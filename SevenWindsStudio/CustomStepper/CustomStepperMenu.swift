//
//  CustomStepperMenu.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 11.02.2024.
//

import Foundation
import UIKit
import SnapKit

final class CustomStepperMenu: UIControl {
	
	/// Счетчик степпер который мы можем считывать и записывать
	var currentValue = 1 {
		didSet {
			currentValue = currentValue > 0 ? currentValue : 0
			currentStepValueLabel.text = "\(currentValue)"
		}
	}
	
	private lazy var decreaseButton: UIButton = {
		let button = UIButton()
		button.setTitleColor(.brown , for: .normal)
		button.setTitle("-", for: .normal)
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		return button
	}()
	
	private lazy var currentStepValueLabel: UILabel = {
		var label = UILabel()
		label.textColor = .black
		label.text = "\(currentValue)"
		label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
		return label
	}()
	
	private lazy var increaseButton: UIButton = {
		let button = UIButton()
		button.setTitle("+", for: .normal)
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		button.setTitleColor(.brown, for: .normal)
		return button
	}()
	
	private lazy var horizontalStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
		stackView.distribution = .equalSpacing
		stackView.spacing = 3
		return stackView
	}()
	
	//MARK: - Life Cycle
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		setupContraints()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Private
	private func setupViews() {
		backgroundColor = #colorLiteral(red: 0.9639263749, green: 0.8997291923, blue: 0.8184673786, alpha: 1)
		addSubview(horizontalStackView)
		horizontalStackView.addArrangedSubview(decreaseButton)
		horizontalStackView.addArrangedSubview(currentStepValueLabel)
		horizontalStackView.addArrangedSubview(increaseButton)
	}
	
	private func setupContraints() {
		horizontalStackView.snp.makeConstraints { make in
			make.edges.equalToSuperview().inset(3)
		}
	}
	
	//MARK: - Actions
	@objc private func buttonAction(_ sender: UIButton) {
		switch sender {
			case decreaseButton:
				currentValue -= 1
			case increaseButton:
				currentValue += 1
			default:
				break
		}
		sendActions(for: .touchUpInside)
	}
}

