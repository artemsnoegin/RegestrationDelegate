//
//  SaveDataDelegate.swift
//  RegistrationDelegate
//
//  Created by Артём Сноегин on 11.08.2025.
//

protocol SaveUserDataDelegate: AnyObject {
    func saveUserData(userName: String, userEmail: String, userPhoneNumber: String)
}
