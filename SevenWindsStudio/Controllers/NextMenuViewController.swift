//
//  MenuCollectionViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 09.02.2024.
//

import UIKit

class NextMenuViewController: UIViewController {
	
	
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
		button.frame = CGRect(x: 10, y: 50, width: 25, height: 25)
		button.backgroundColor = .white
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(backRegistrationAccountButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func backRegistrationAccountButton() {
		let vc = MapKitViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Меню"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.frame = CGRect(x: 140, y: 50, width: 100, height: 30)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		label.textAlignment = .center
		return label
	}()
	
	lazy var nextMapKitButton: UIButton = {
		let button = UIButton()
		button.setTitle("Перейти к оплате", for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.frame = CGRect(x: 30, y: 770, width: 338, height: 47)
		button.backgroundColor = #colorLiteral(red: 0.2048919797, green: 0.175404191, blue: 0.1001136526, alpha: 1)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func didTapCreateAccountButton() {
		let vc = OrderCoffeeViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	let modelMenu: [MenuCustom] = MenuCollection.setupMenu()
	
	//MARK: - Add Collection View
	private let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.backgroundColor = .white
		view.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupLayoutConstraints()
		setupCollectionView()
		view.addSubview(backButton)
		view.addSubview(titleLabel)
		view.addSubview(nextMapKitButton)
		view.backgroundColor = .white
		
	}
	
	//MARK: - Setup Collection View
	private func setupCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
	//MARK: - Setup Layout Constraints
	private func setupLayoutConstraints() {
		view.addSubview(collectionView)
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
		])
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		showNavigationBar()
	}
	
	//MARK: - Show Navigation Bar
	private func showNavigationBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance()
		navigationController?.toolbar.backgroundColor = .white
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
	}
}

//MARK: - Extension UICollectionViewDataSource
extension NextMenuViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return modelMenu.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		var cell = UICollectionViewCell()
		
		if let labelNames = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell {
			
			labelNames.configure(image: UIImage(named: modelMenu[indexPath.item].imageName), textName: modelMenu[indexPath.row].titleName, textCount: modelMenu[indexPath.row].titleCount)
			
			labelNames.layer.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
			labelNames.layer.cornerRadius = 10
			labelNames.layer.shadowOpacity = 0.5
			labelNames.layer.masksToBounds = false
			
			labelNames.layer.shadowPath = .none
			labelNames.layer.shadowOffset = CGSize(width: 0, height: 4)
			labelNames.layer.shouldRasterize = true
			
			cell = labelNames
			
		}
		return cell
	}
}

//MARK: - Extension UICollectionViewDelegateFlowLayout
extension NextMenuViewController: UICollectionViewDelegateFlowLayout {
	private var sideInset: CGFloat { return 8 }
	private var elementCount: CGFloat { return 2}
	private var insetsCount: CGFloat { return elementCount + 1}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width  = (collectionView.bounds.width - sideInset * insetsCount) / elementCount
		let height = CGFloat(integerLiteral: 205)
		return CGSize(width: width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return sideInset
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		20
	}
}
