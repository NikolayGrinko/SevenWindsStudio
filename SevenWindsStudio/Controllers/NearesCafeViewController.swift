//
//  NearesCafeControllerViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 05.02.2024.
//

import UIKit

class NearesCafeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	private var modelLoca: [String] = ["1 км от вас", "2 км от вас", "1 км от вас", "300 м от вас", "3 км от вас"]
	
	private let model: [String] = ["BEDOEV COFFEE", "Coffee Like", "EM&DI Coffee and Snacks", "Коффе есть", "BEDOEV COFFEE 2"]
	
	private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
	)
	
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
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Ближайшие кофейни"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.frame = CGRect(x: 100, y: 50, width: 200, height: 40)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var nextMapKitButton: UIButton = {
		let button = UIButton()
		button.setTitle("На карте", for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.frame = CGRect(x: 30, y: 660, width: 338, height: 47)
		button.backgroundColor = #colorLiteral(red: 0.2048919797, green: 0.175404191, blue: 0.1001136526, alpha: 1)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func didTapCreateAccountButton() {
		
		let vc = MapKitViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.register(NearesCollectionViewCell.self, forCellWithReuseIdentifier: NearesCollectionViewCell.identifier)
		collectionView.addSubview(nextMapKitButton)
		view.addSubview(backButton)
		view.addSubview(collectionView)
		view.backgroundColor = .white
		view.addSubview(titleLabel)
		view.backgroundColor = #colorLiteral(red: 0.9812716842, green: 0.9763050675, blue: 0.9763934016, alpha: 1)
		
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return model.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = UICollectionViewCell()
		
		if let labelNames = collectionView.dequeueReusableCell(withReuseIdentifier: NearesCollectionViewCell.identifier, for: indexPath) as? NearesCollectionViewCell {
			
			labelNames.configure(label: model[indexPath.row])
			labelNames.configureLoc(labelLocation: modelLoca[indexPath.row])
			labelNames.layer.backgroundColor = #colorLiteral(red: 0.9639263749, green: 0.8997291923, blue: 0.8184673786, alpha: 1)
			//labelNames.layer.borderWidth = 5
			labelNames.layer.cornerRadius = 10
			labelNames.layer.shadowOpacity = 0.5
			labelNames.layer.masksToBounds = false
			labelNames.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			labelNames.layer.shadowOffset = CGSize(width: 0, height: 4)
			labelNames.layer.shouldRasterize = true
			
			cell = labelNames
		}
		return cell
	}
	
	// size element
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(
			width: 349,
			height: 71
		)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		10
	}
	// расстояние по бокам ячейки
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
	}
	
	// func tap cell (функция нажатия)
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		print("selected section \(indexPath.section) and row \(indexPath.row)")
	}
	
}
