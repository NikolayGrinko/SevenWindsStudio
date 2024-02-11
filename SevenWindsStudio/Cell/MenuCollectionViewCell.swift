//
//  MenuCollectionviewCellCollectionViewCell.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 09.02.2024.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
	private lazy var stepperView = CustomStepperMenu()
	
		static let identifier = "MenuCollectionViewCell"
	
		//MARK: - Add Image View
		var colImageView: UIImageView = {
			let image = UIImageView()
			image.contentMode = .scaleAspectFill
			image.layer.cornerRadius = 10
			image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
			image.clipsToBounds = true
			image.translatesAutoresizingMaskIntoConstraints = false
			return image
		}()
	
	private lazy var titlesNameLabel: UILabel = {
		let label = UILabel()
		label.text = ""
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var titleCountLabel: UILabel = {
		let label = UILabel()
		label.text = ""
		label.font = .systemFont(ofSize: 12, weight: .medium)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	override func layoutSubviews() {
		super.layoutSubviews()
		stepperView.frame = CGRect(x: 110, y: 180, width: 70, height: 20)
		stepperView.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
	}
	
		override init(frame: CGRect) {
			super.init(frame: frame)
			setupLayoutConstraints()
			
		}

		required init?(coder: NSCoder) {
			fatalError()
		}
		
		//MARK: - Public func
	func configure(image: UIImage?, textName: String?, textCount: String) {
			colImageView.image = image
			titlesNameLabel.text = textName
		    titleCountLabel.text = textCount
		}
		

		//MARK: - Setup Layout Constraints
		private func setupLayoutConstraints() {
			contentView.addSubview(colImageView)
			contentView.addSubview(titlesNameLabel)
			contentView.addSubview(titleCountLabel)
			contentView.layer.cornerRadius = 10
			contentView.addSubview(stepperView)
			
			NSLayoutConstraint.activate ([
				colImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
				colImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
				colImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
				colImageView.bottomAnchor.constraint(equalTo: titlesNameLabel.topAnchor, constant: -5),
				
				titlesNameLabel.topAnchor.constraint(equalTo: colImageView.bottomAnchor,constant: 5),
				titlesNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
				titlesNameLabel.heightAnchor.constraint(equalToConstant: 20),
				titlesNameLabel.widthAnchor.constraint(equalToConstant: 150),
				
				titleCountLabel.topAnchor.constraint(equalTo: titlesNameLabel.bottomAnchor,constant: 5),
				titleCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
				titleCountLabel.heightAnchor.constraint(equalToConstant: 20),
				titleCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
				titleCountLabel.widthAnchor.constraint(equalToConstant: 50),
			])
		}
	}

