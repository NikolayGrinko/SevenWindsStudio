//
//  LoginViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 04.02.2024.
//


import UIKit
import SafariServices

class LoginViewController: UIViewController {
	
	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Регистрация"
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.textColor = #colorLiteral(red: 0.5182373524, green: 0.3868932724, blue: 0.2507439256, alpha: 1)
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
	
	private let usernameEmailField: UITextField = {
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
	
	private lazy var repeadPasswordLabel: UILabel = {
		let label = UILabel()
		label.text = "Повторите пароль"
		label.font = .systemFont(ofSize: 12, weight: .regular)
		label.textColor = UIColor.systemBrown
		label.textAlignment = .justified
		return label
	}()
	
	private let repeatPasswordField: UITextField = {
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
		button.setTitle("Регистрация", for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.backgroundColor = #colorLiteral(red: 0.2048919797, green: 0.175404191, blue: 0.1001136526, alpha: 1)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
		return button
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Регистрация"
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
//		usernameEmailField.delegate = self
//		passwordField.delegate = self
		addSubviews()
		view.backgroundColor = .systemBackground
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
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
		usernameEmailField.frame = CGRect(
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
			y: usernameEmailField.bottom + 50,
			width: view.width - 50,
			height: 52.0
		)
		// Повторите пароль
		repeadPasswordLabel.frame = CGRect(
			x: 25,
			y: 420,
			width: view.width - 150,
			height: 15.0
		)
		// Repeat password...
		repeatPasswordField.frame = CGRect(
			x: 25,
			y: passwordField.bottom + 50,
			width: view.width - 50,
			height: 52.0
		)
		
		loginButton.frame = CGRect(
			x: 25,
			y: repeatPasswordField.bottom + 30,
			width: view.width - 50,
			height: 52.0
		)
	}
	
	private func addSubviews() {
		view.addSubview(titleLabel)
		view.addSubview(emailLabel)
		view.addSubview(usernameEmailField)
		view.addSubview(passwordLabel)
		view.addSubview(passwordField)
		view.addSubview(repeadPasswordLabel)
		view.addSubview(repeatPasswordField)
		view.addSubview(loginButton)
	}
	
	@objc private func didTapLoginButton() {
		passwordField.resignFirstResponder()
		usernameEmailField.resignFirstResponder()
	}
	
	@objc private func didTapCreateAccountButton() {
		
		let vc = RegistrationViewController()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true)
	}
}

