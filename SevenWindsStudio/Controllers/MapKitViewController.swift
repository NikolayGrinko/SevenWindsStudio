//
//  MapKitControllerViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 06.02.2024.
//


import UIKit
import MapKit
import CoreLocation

class MapKitViewController: UIViewController {
	
	var places: [Places] = []
	
	let mapView = MKMapView()
	
	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	lazy var backButton: UIButton = {
		let button = UIButton()
		let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
		button.setImage(image, for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.tintColor = .systemBrown
		button.frame = CGRect(x: 10, y: 60, width: 25, height: 25)
		button.backgroundColor = .white
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(backRegistrationAccountButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func backRegistrationAccountButton() {
		let vc = RegistrationViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	lazy var nextButtons: UIButton = {
		let button = UIButton()
		let image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
		button.setImage(image, for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.tintColor = .systemBrown
		button.frame = CGRect(x: 350, y: 60, width: 25, height: 25)
		button.backgroundColor = .white
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(nextMenuButtons), for: .touchUpInside)
		return button
	}()
	
	@objc private func nextMenuButtons() {
		let vc = NextMenuViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Карта"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.frame = CGRect(x: 140, y: 55, width: 100, height: 40)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mapView.delegate = self
		
		view.addSubview(backButton)
		view.addSubview(titleLabel)
		view.addSubview(nextButtons)
		view.addSubview(mapView)
		mapView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height)
		view.backgroundColor = .white
		
		mapView.delegate = self
		// координаты положения юзера
		let initialLocation = CLLocation(latitude: 59.9358713, longitude: 30.3205176)
		mapView.centerLocation(initialLocation)
		
		// граница увеличения карты
		let cameraCenter = CLLocation(latitude: 59.9358713, longitude: 30.3205176)
		let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
		mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
		
		// с какого и по какой масштаб сможет увеличивать
		let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
		mapView.setCameraZoomRange(zoomRage, animated: true)
		
		//ew.register(PlacesMarkersViews.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
		mapView.register(PlacesViews.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
		
		loadInitialData()
		mapView.addAnnotations(places)
	}
	
	// метод берет данные с json с проекта
	func loadInitialData() {
		guard let fileName = Bundle.main.url(forResource: "Places", withExtension: "geojson"),
			  
				let placesData = try? Data(contentsOf: fileName)
		else {
			return
		}
		do {
			let features = try MKGeoJSONDecoder()
				.decode(placesData)
				.compactMap {$0 as? MKGeoJSONFeature}
			let validWorks = features.compactMap(Places.init)
			places.append(contentsOf: validWorks)
			print(places[0].coordinate)
			print(validWorks)
		} catch {
			print(placesData)
			print(fileName)
			print("\(error)")
		}
	}
}

// локация положения юзера
extension MKMapView {
	func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
		let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
		setRegion(coordinateRegion, animated: true)
	}
}

extension MapKitViewController: MKMapViewDelegate {
	
	// пользователь нажимает на правую кнопку описания - вывод
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		guard let places = view.annotation as? Places else {
			return
		}
		let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
		
		places.mapItem?.openInMaps(launchOptions: launchOptions)
	}
}
