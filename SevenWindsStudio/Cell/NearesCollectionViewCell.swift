//
//  PhotoCollectionViewCell.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 06.02.2024.
//

import UIKit

class NearesCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "NearesCollectionViewCell"
	
	var nameLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
		nameLabel.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
		nameLabel.textAlignment = .justified
		return nameLabel
	}()
	
	var locationLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.font = .systemFont(ofSize: 12, weight: .regular)
		nameLabel.textColor = #colorLiteral(red: 0.6881152987, green: 0.5803138614, blue: 0.4772750139, alpha: 1)
		nameLabel.textAlignment = .justified
		return nameLabel
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(nameLabel)
		contentView.addSubview(locationLabel)
	}
	
	func configure(label: String) {
		nameLabel.text = label
	}
	
	func configureLoc(labelLocation: String) {
		locationLabel.text = labelLocation
	}
	required init?(coder: NSCoder) {
		fatalError()
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		nameLabel.frame = CGRect(x: 10, y: 15, width: 300, height: 20)
		locationLabel.frame = CGRect(x: 10, y: 40, width: 100, height: 15)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		nameLabel.text = nil
		locationLabel.text = nil
	}
}
