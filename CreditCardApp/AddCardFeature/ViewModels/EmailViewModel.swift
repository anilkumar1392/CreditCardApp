//
//  EmailViewModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 13/07/22.
//

import Foundation

protocol EmailCellDelegate {
    func didUpdateEmailID(emailID: String?)
}

class EmailIDViewModel {
    private var model: EmailModel
    private var delegate: EmailCellDelegate
    var didChangeEmail: ((_ email: String?) -> Void)?

    init(model: EmailModel, delegate: EmailCellDelegate) {
        self.model = model
        self.delegate = delegate
    }
    
    func setEmail(email: String) {
        model.emailID = email
        delegate.didUpdateEmailID(emailID: email)
        didChangeEmail?(email)
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
