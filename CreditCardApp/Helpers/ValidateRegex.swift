//
//  ValidateRegex.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation

struct Utility {
    static func validateRegex(regex: String, forString str: String) -> Bool {
        if str.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil{
            return true
        }
        return false
    }
}


