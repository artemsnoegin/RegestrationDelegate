//
//  EditProfileViewController2.swift
//  RegistrationDelegate
//
//  Created by Артём Сноегин on 11.08.2025.
//

import UIKit

class EditProfileViewController2: UIViewController {
    
    var sendDataOnTapCompletion: ((_ name: String, _ email: String, _ phone: String) -> ())?
    
    private let userNameField = UITextField()
    private let userEmailField = UITextField()
    private let userPhoneNumberField = UITextField()
    private let saveButton = UIButton(configuration: .filled())
    
    private var validName = ""
    private var validEmail = ""
    private var validPhoneNumber = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Completion"
        
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
        
        userNameField.placeholder = "User Name: . . ."
        userNameField.textContentType = .name
        userNameField.keyboardType = .default
        
        userEmailField.placeholder = "User Email: . . ."
        userEmailField.textContentType = .emailAddress
        userEmailField.keyboardType = .emailAddress
        userEmailField.autocapitalizationType = .none
        
        userPhoneNumberField.placeholder = "User Phone: . . ."
        userPhoneNumberField.textContentType = .telephoneNumber
        userPhoneNumberField.keyboardType = .phonePad
        
        userPhoneNumberField.addTarget(self, action: #selector(phoneNumberFormatting), for: .editingDidBegin)
        
        [userNameField, userEmailField, userPhoneNumberField].forEach {
            $0.font = .boldSystemFont(ofSize: 18)
            $0.borderStyle = .roundedRect
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(validation), for: .editingChanged)
            
            saveButton.setTitle("Сохранить", for: .normal)
            saveButton.tintColor = .systemGreen
            saveButton.setTitle("Сохранить", for: .disabled)
            saveButton.setTitleColor(.lightGray, for: .disabled)
            saveButton.isEnabled = false
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(saveButton)
            saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            saveButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        }
    }
    
    @objc private func sendData() {
        sendDataOnTapCompletion?(validName, validEmail, validPhoneNumber)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func validation() {
        
        var isNameValid = false
        var isEmailValid = false
        var isPhoneNumberValid = false
        
        if let unwrappedName = userNameField.text {
            if unwrappedName.isEmpty == false {
                isNameValid = true
                validName = unwrappedName
            } else {
                isNameValid = false
                validName = ""
            }
        }
        
        if let unwrappedEmail = userEmailField.text {
            if unwrappedEmail.isEmpty == false && unwrappedEmail.contains("@") && unwrappedEmail.contains(".") {
                isEmailValid = true
                validEmail = unwrappedEmail
            } else {
                isEmailValid = false
                validEmail = ""
            }
        }
        
        if let unwrappedPhoneNumber = userPhoneNumberField.text {
            if unwrappedPhoneNumber.count >= 12 && unwrappedPhoneNumber.count <= 15 && unwrappedPhoneNumber.starts(with: "+") && numberValidation(unwrappedPhoneNumber) {
                isPhoneNumberValid = true
                validPhoneNumber = unwrappedPhoneNumber
            } else {
                isPhoneNumberValid = false
                validPhoneNumber = ""
            }
        }
        
        if isNameValid && isEmailValid && isPhoneNumberValid {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    private func numberValidation(_ number: String) -> Bool {
        let filteredNumber = number.filter { "1234567890+".contains($0) }
        
        if filteredNumber.count == number.count {
            return true
        } else {
            return false
        }
    }
    
    @objc private func phoneNumberFormatting() {
        if userPhoneNumberField.hasText == false {
            userPhoneNumberField.text = "+"
        }
    }
}
