//
//  CreditCardViewModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation

public class CreditCardViewModel {
    typealias Observer<T> = (T) -> Void
    
    private let title: String?
    private var phoneNumber: String?
    private var emailID: String?

    init(title: String?) {
        self.title = title
    }
    
    func getTitle() -> String? {
        return title
    }
    
    func setPhoneNumber(number: String?) {
        phoneNumber = number
        checkToProceedEnable()
    }
    
    func setEmailID(emailId: String?) {
        emailID = emailId
        checkToProceedEnable()
    }
    
    func getEmail() -> String? {
        return emailID
    }
    
    func getPhoneNumber() -> String? {
        return phoneNumber
    }
    
    var enableProceed: Observer<Bool>?
    
    private func checkToProceedEnable() {
        if validatePhoneNumber() && validateEmail() {
            enableProceed?(true)
        } else {
            enableProceed?(false)
        }
    }
    
    private func validatePhoneNumber() -> Bool {
        guard let phoneNumber = getPhoneNumber() else { return false }
        let isValid = Utility.validateRegex(regex: PhoneNumberModel.phoneNumberRegex, forString: phoneNumber)
        return isValid
    }
    
    private func validateEmail() -> Bool {
        guard let email = getEmail() else { return false }
        let isValid = Utility.validateRegex(regex: EmailModel.emailRegex, forString: email)
        return isValid
    }
}

// MARK: - Confirm to phone number delegate

extension CreditCardViewModel: PhoneNumberCellDelegate {
    func didUpdatePhoneNumber(phoneNumber: String?) {
        setPhoneNumber(number: phoneNumber)
    }
    
    func emailUpdated(_ email: String?) -> Void {
        setEmailID(emailId: email)
    }
}
