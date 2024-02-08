//
//  PhotoCollectionViewCell.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 06.02.2024.
//

import UIKit

class NearesCollectionViewCell: UICollectionViewCell {
    
	static let identifier = "PhotoCollectionViewCell"
	

	
	 var nameLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
		nameLabel.textColor = UIColor.black
		nameLabel.textAlignment = .justified
		return nameLabel
	}()
	
	var locationLabel: UILabel = {
	   let nameLabel = UILabel()
	   nameLabel.font = .systemFont(ofSize: 12, weight: .regular)
	   nameLabel.textColor = UIColor.black
	   nameLabel.textAlignment = .justified
	   return nameLabel
   }()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(nameLabel)
		contentView.addSubview(locationLabel)
		//contentView.backgroundColor = #colorLiteral(red: 0.9639263749, green: 0.8997291923, blue: 0.8184673786, alpha: 1)
		
	}
	
	func configure(witn label: String) {
		nameLabel.text = label
		locationLabel.text = label
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		nameLabel.frame = CGRect(x: 10, y: 10, width: 100, height: 20)
		locationLabel.frame = CGRect(x: 10, y: 35, width: 100, height: 10)
		
		
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		//imageView.image = nil
		nameLabel.text = nil
		locationLabel.text = nil
	}
	
	
}
