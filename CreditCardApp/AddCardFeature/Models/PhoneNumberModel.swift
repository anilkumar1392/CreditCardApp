//
//  PhoneNumberModel.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation

struct PhoneNumberModel {
    var phoneNumber: String?
    var errorMsg: String?
    var regex: String?
    var phoneNumberLength: Int? = 10
    var placeHolder: String?

    static let phoneNumberRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
    static let phoneNoLength = 10
}

