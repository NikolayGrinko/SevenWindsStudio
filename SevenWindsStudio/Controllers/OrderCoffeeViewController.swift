//
//  OrderCoffeeVC.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 11.02.2024.
//

import Foundation
import UIKit


class OrderCoffeeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	private var modelName: [String] = ["Эспрессо", "Капучино", "Латте"]
	private var modelCount: [String] = ["200 руб", "250 руб", "260 руб"]
	private var modelStepper: [CustomStepper] = []
	
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
		label.text = "Ваш заказ"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.frame = CGRect(x: 90, y: 50, width: 200, height: 40)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		label.textAlignment = .center
		return label
	}()
	
	private var titleOrderTextLabel: UILabel = {
		var textLabel = "      "
		let label = UILabel()
		label.text = "  Время ожидания заказа \(textLabel) \(textLabel) 15 минут! \(textLabel) \(textLabel) \(textLabel) \(textLabel) \(textLabel) Спасибо, что выбрали нас!"
		label.font = .systemFont(ofSize: 24, weight: .medium)
		label.frame = CGRect(x: 20, y: 350, width: 349, height: 100)
		label.textColor = UIColor.systemBrown
		label.numberOfLines = 3
		label.textAlignment = .center
		return label
	}()
	
	lazy var nextMapKitButton: UIButton = {
		let button = UIButton()
		button.setTitle("Оплатить", for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.frame = CGRect(x: 30, y: 650, width: 338, height: 47)
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
		view.backgroundColor = .white
		collectionView.register(OrderCollectionViewCell.self, forCellWithReuseIdentifier: OrderCollectionViewCell.identifier)
		collectionView.addSubview(nextMapKitButton)
		view.addSubview(backButton)
		collectionView.addSubview(titleOrderTextLabel)
		view.addSubview(collectionView)
		collectionView.backgroundColor = .white
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
		return modelName.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = UICollectionViewCell()
		
		if let labelNames = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.identifier, for: indexPath) as? OrderCollectionViewCell {
			
			//labelNames.configure(label: modelName[indexPath.row])
			labelNames.configureLoc(labelName: modelName[indexPath.row], labelCount: modelCount[indexPath.row])
			labelNames.layer.backgroundColor = #colorLiteral(red: 0.9639263749, green: 0.8997291923, blue: 0.8184673786, alpha: 1)
			labelNames.layer.cornerRadius = 5
			labelNames.layer.shadowOpacity = 0.3
			labelNames.layer.masksToBounds = false
			labelNames.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			labelNames.layer.shadowOffset = CGSize(width: 0, height: 3)
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

