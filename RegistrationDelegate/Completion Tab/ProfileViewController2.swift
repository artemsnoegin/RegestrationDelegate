//
//  ProfileViewController2.swift
//  RegistrationDelegate
//
//  Created by Артём Сноегин on 11.08.2025.
//

import UIKit

class ProfileViewController2: UIViewController{
    
    private let userNameLabel = UILabel()
    private let userEmailLabel = UILabel()
    private let userPhoneNumberLabel = UILabel()
    private let editUserInfoButton = UIButton(configuration: .filled())
    private let rightButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "User Profile"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        let stackViewHeight = view.bounds.height / 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight)
        ])
        
        userNameLabel.text = "Имя: . . ."
        userEmailLabel.text = "Email: . . ."
        userPhoneNumberLabel.text = "Номер телефона: . . ."
        
        [userNameLabel,userEmailLabel, userPhoneNumberLabel].forEach {
            $0.font = .boldSystemFont(ofSize: 18)
            $0.adjustsFontSizeToFitWidth = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }
        
        editUserInfoButton.setTitle("Редактировать", for: .normal)
        editUserInfoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        editUserInfoButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(editUserInfoButton)
        
        editUserInfoButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        rightButton.image = UIImage(systemName: "trash")
        rightButton.tintColor = .red
        rightButton.target = self
        rightButton.action = #selector(clearInfo)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideRightBarButton()
    }
    
    @objc private func navigate() {
        let nextVC = EditProfileViewController2()
        nextVC.sendDataOnTapCompletion = { name, email, phone in
            self.userNameLabel.text = "Имя: " + name
            self.userEmailLabel.text = "Email: " + email
            self.userPhoneNumberLabel.text = "Номер телефона: " + phone
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func clearInfo() {
        userNameLabel.text = "Имя: . . ."
        userEmailLabel.text = "Email: ..."
        userPhoneNumberLabel.text = "Номер телефона: . . ."
        rightButton.isHidden = true
    }
    
    private func hideRightBarButton() {
        if userNameLabel.text == "Имя: . . ." && userEmailLabel.text == "Email: . . ." && userPhoneNumberLabel.text == "Номер телефона: . . ." {
            rightButton.isHidden = true
        } else {
            rightButton.isHidden = false
        }
    }
}
