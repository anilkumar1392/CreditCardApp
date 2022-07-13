//
//  EmailModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 13/07/22.
//

import Foundation

struct EmailModel {
    var emailID: String?
    var errorMsg: String?
    var regex: String?
    var placeHolder: String?
    
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}
