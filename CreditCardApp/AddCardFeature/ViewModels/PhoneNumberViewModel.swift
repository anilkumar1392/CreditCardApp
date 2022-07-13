//
//  PhoneNumberViewModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation

protocol PhoneNumberCellDelegate {
    func didUpdatePhoneNumber(phoneNumber: String?)
}

class PhoneNumberViewModel {
    private var model: PhoneNumberModel
    var delegate: PhoneNumberCellDelegate
    
    init(model: PhoneNumberModel, delegate: PhoneNumberCellDelegate) {
        self.model = model
        self.delegate = delegate
    }

    func getRegex() -> String? {
        return model.regex
    }
    
    func getPhoneNumber() -> String? {
        return model.phoneNumber
    }
    
    func getPlaceHolderText() -> String? {
        return model.placeHolder
    }
    
    func getErrorMsg() -> String? {
        return model.errorMsg
    }
    
    func setErrorMsg(msg: String?) {
        model.errorMsg = msg
    }
    
    func showErrorLabel() -> Bool {
        return (model.errorMsg?.isEmpty ?? true)
    }
    
    func getPhoneNumberLength() -> Int {
        return model.phoneNumberLength ?? 10
    }
    
    func setPhoneNumber(phoneNumber: String?) {
        model.phoneNumber = phoneNumber
        delegate.didUpdatePhoneNumber(phoneNumber: phoneNumber)
    }
    
    func validatePhoneNumber() -> Bool {
        guard let regex = getRegex(),
              let phoneNumber = getPhoneNumber() else { return false }
        let isValid = Utility.validateRegex(regex: regex, forString: phoneNumber)
        return isValid
    }
    
    func allowEditing(with text: String) -> Bool {
        return text.count <= getPhoneNumberLength()
    }
}
