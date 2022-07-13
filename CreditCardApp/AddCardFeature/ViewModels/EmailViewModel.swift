//
//  EmailViewModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 13/07/22.
//

import Foundation

class EmailIDViewModel {
    private var model: EmailModel
    
    init(model: EmailModel) {
        self.model = model
    }
    
    func setEmail(email: String) {
        model.emailID = email
    }
    
    func getEmail() -> String? {
        return model.emailID
    }
    
    func setError(error: String) {
        model.errorMsg = error
    }
    
    func getError() -> String? {
        return model.errorMsg
    }
    
    func getRegex() -> String? {
        return model.regex
    }
    
    func showErrorLabel() -> Bool {
        return (model.errorMsg?.isEmpty ?? true)
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
    
    func valdiateEmail() -> Bool {
        guard let regex = getRegex(),
              let phoneNumber = getEmail() else { return false }
        let isValid = Utility.validateRegex(regex: regex, forString: phoneNumber)
        return isValid
    }
}
