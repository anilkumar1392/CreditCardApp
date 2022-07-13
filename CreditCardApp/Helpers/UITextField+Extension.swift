//
//  UITextField+Extension.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation
import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = .red
        let attri1: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14)]
        done.setTitleTextAttributes(attri1, for: .normal)
        
        let items = [flexSpace,done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        resignFirstResponder()
    }
}
