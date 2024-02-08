//
//  RegistrationViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 04.02.2024.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {

	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	lazy var nextButton: UIButton = {
		let button = UIButton()
		let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
		button.setImage(image, for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.backgroundColor = .white
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func didTapCreateAccountButton() {
		
		let vc = LoginViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Вход"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .center
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var emailLabel: UILabel = {
		let label = UILabel()
		label.text = "e-mail"
		label.font = .systemFont(ofSize: 12, weight: .regular)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .justified
		return label
	}()
	
	private let userNameEmailField: UITextField = {
		let field = UITextField()
		field.placeholder = "example@example.ru"
		field.returnKeyType = .next
		field.leftViewMode = .always
		field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		field.autocapitalizationType = .none
		field.autocorrectionType = .no
		field.layer.masksToBounds = true
		field.layer.cornerRadius = Constants.cornerRadius
		field.backgroundColor = .secondarySystemBackground
		field.layer.borderWidth = 1.0
		field.layer.borderColor = UIColor.systemBrown.cgColor
		return field
	}()
	
	private lazy var passwordLabel: UILabel = {
		let label = UILabel()
		label.text = "Пароль"
		label.font = .systemFont(ofSize: 12, weight: .regular)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .justified
		return label
	}()
	
	private let passwordField: UITextField = {
		let field = UITextField()
		field.placeholder = "******"
		field.returnKeyType = .continue
		field.leftViewMode = .always
		field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		field.autocapitalizationType = .none
		field.autocorrectionType = .no
		field.layer.masksToBounds = true
		field.layer.cornerRadius = Constants.cornerRadius
		field.backgroundColor = .secondarySystemBackground
		field.layer.borderWidth = 1.0
		field.layer.borderColor = UIColor.systemBrown.cgColor
		return field
	}()
	
	
	
	lazy var loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("Войти", for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.backgroundColor = #colorLiteral(red: 0.2048919797, green: 0.175404191, blue: 0.1001136526, alpha: 1)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(tapNextCafesButton), for: .touchUpInside)
		return button
	}()
	
	@objc private func tapNextCafesButton() {
		
		let vc = NearesCafeViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
		

	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		loginButton.addTarget(self,
//								 action: #selector(didTapRegister),
//								 for: .touchUpInside)
		
		userNameEmailField.delegate = self
		passwordField.delegate = self
		
		view.addSubview(nextButton)
		view.addSubview(titleLabel)
		view.addSubview(emailLabel)
		view.addSubview(userNameEmailField)
		view.addSubview(passwordLabel)
		view.addSubview(passwordField)
		view.addSubview(loginButton)
		
		view.backgroundColor = .systemBackground
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		//
		nextButton.frame = CGRect(
			x: 10,
			y: 60,
			width: 30,
			height: 30
		)
		
		// регистрация
		titleLabel.frame = CGRect(
			x: 90,
			y: 60,
			width: 200,
			height: 30
		)
	   // Email
		emailLabel.frame = CGRect(
			x: 25,
			y:  220,
			width: view.width - 150,
			height: 10.0
		)
		// Username of Email
		userNameEmailField.frame = CGRect(
			x: 25,
			y:  240,
			width: view.width - 50,
			height: 52.0
		)
		// Пароль
		passwordLabel.frame = CGRect(
			x: 25,
			y: 320,
			width: view.width - 150,
			height: 15.0
		)
		// Password...
		passwordField.frame = CGRect(
			x: 25,
			y: userNameEmailField.bottom + 50,
			width: view.width - 50,
			height: 52.0
		)
		
		loginButton.frame = CGRect(
			x: 25,
			y: passwordField.bottom + 30,
			width: view.width - 50,
			height: 52.0
		)
	}
	

//	@objc private func didTapRegister() {
//		
//		userNameEmailField.resignFirstResponder()
//		passwordField.resignFirstResponder()
//		
//		guard let email = userNameEmailField.text, !email.isEmpty,
//			  let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
//			return
//		}
//	}
}


	extension RegistrationViewController: UITextFieldDelegate {
		
//		func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//			if textField == userNameEmailField {
//				passwordField.becomeFirstResponder()
//			}
//			else if textField == passwordField {
//				passwordField.becomeFirstResponder()
//			}
//			else {
//				didTapRegister()
//			}
//			return true
//		}
		
	}
