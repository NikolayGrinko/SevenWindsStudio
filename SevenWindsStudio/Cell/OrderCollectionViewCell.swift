//
//  OrderCollectionViewCell.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 11.02.2024.
//

import Foundation
import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "OrderCollectionViewCell"
	
	private lazy var stepperView = CustomStepper()
	
	var nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		label.frame = CGRect(x: 10, y: 10, width: 300, height: 25)
		label.textAlignment = .justified
		return label
	}()
	
	var nameCount: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textColor = #colorLiteral(red: 0.6881153584, green: 0.5803137422, blue: 0.4728174806, alpha: 1)
		label.frame = CGRect(x: 10, y: 40, width: 100, height: 20)
		label.textAlignment = .justified
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(nameLabel)
		contentView.addSubview(nameCount)
		contentView.addSubview(stepperView)
		stepperView.frame = CGRect(x: 260, y: 25, width: 80, height: 30)
	}
	
	func configure(label: String) {
		nameLabel.text = label
	}
	
	func configureLoc(labelName: String, labelCount: String) {
		nameLabel.text = labelName
		nameCount.text = labelCount
		
	}
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		nameLabel.text = nil
		nameCount.text = nil
	}
	
}
