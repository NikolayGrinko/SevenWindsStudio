//
//  Places.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 08.02.2024.
//

import Foundation

import Foundation
import MapKit
import Contacts

class Places: NSObject, MKAnnotation {
	
	let title: String?
	let locationName: String?
	let discipline: String?
	let coordinate: CLLocationCoordinate2D
	
	init(title: String?,
		 locationName: String?,
		 discipline: String?,
		 coordinate: CLLocationCoordinate2D) {
		
		self.title = title
		self.locationName = locationName
		self.discipline = discipline
		self.coordinate = coordinate
		
		super.init()
	}
	
	// метод работающий со всеми данными с json formatter
	init?(feature: MKGeoJSONFeature) {
		guard
			let point = feature.geometry.first as? MKPointAnnotation,
			let propertiesData = feature.properties,
			let json = try? JSONSerialization.jsonObject(with: propertiesData),
			let properties = json as? [String: Any]
		else {
			return nil
		}
		title = properties["title"] as? String
		locationName = properties["locationName"] as? String
		discipline = properties["discipline"] as? String
		coordinate = point.coordinate
		super.init()
		
	}
	
	var subtitle: String? {
		return locationName
	}
	
	var mapItem: MKMapItem? {
		
		guard let location = locationName else {
			return nil
		}
		
		let adressDict = [CNPostalAddressStreetKey: location]
		let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: adressDict)
		
		let mapItem = MKMapItem(placemark: placemark)
		mapItem.name = title
		return mapItem
	}
	
	var image: UIImage {
		guard let name = discipline else {
			return #imageLiteral(resourceName: "cofe")
		}
		switch name {
			case "Cathedral": return #imageLiteral(resourceName: "cofe")
			case "Home": return #imageLiteral(resourceName: "cofe")
			default:
				return #imageLiteral(resourceName: "2222")
		}
	}
}
