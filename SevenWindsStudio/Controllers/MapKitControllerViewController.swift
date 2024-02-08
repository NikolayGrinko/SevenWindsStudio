//
//  MapKitControllerViewController.swift
//  SevenWindsStudio
//
//  Created by Николай Гринько on 06.02.2024.
//

import UIKit

class MapKitControllerViewController: UIViewController {

	struct Constants {
		static let cornerRadius: CGFloat = 25.0
	}
	
	lazy var backButton: UIButton = {
		let button = UIButton()
		let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
		button.setImage(image, for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = Constants.cornerRadius
		button.frame = CGRect(x: 10, y: 60, width: 30, height: 30)
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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(backButton)
		view.backgroundColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
