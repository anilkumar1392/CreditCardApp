//
//  PhoneNumberCellController.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation
import UIKit

extension PhoneNumberCellController: CreditCardCell {}

class PhoneNumberCellController: NSObject {
    private var viewModel: PhoneNumberViewModel
    private var cell: PhoneNumberCell?
    
    init(viewModel: PhoneNumberViewModel) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueResuableCell()
        cell?.phoneNumberTextField.delegate = self
        display()
        return cell!
    }
    
    func display() {
        cell?.selectionStyle = .none
        cell?.phoneNumberTextField.text = viewModel.getPhoneNumber()
        cell?.phoneNumberTextField.placeholder = viewModel.getPlaceHolderText()
        cell?.phoneNumberTextField.keyboardType = .numberPad
        cell?.phoneNumberTextField.addDoneButtonOnKeyboard()
        showError()
    }
    
    func showError() {
        cell?.errorLabel.text = viewModel.getErrorMsg()
        cell?.errorLabel.isHidden = viewModel.showErrorLabel()
    }
}


// MARK: - UITextViewDelegate

extension PhoneNumberCellController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        viewModel.setErrorMsg(msg: nil)
        showError()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if viewModel.allowEditing(with: newText) {
            viewModel.setPhoneNumber(phoneNumber: newText)
            validatePhoneNumber()
            return true
        } else {
            return false
        }
    }
    
    func validatePhoneNumber() {
        if viewModel.validatePhoneNumber() {
            viewModel.setErrorMsg(msg: nil)
        } else {
            viewModel.setErrorMsg(msg: "Please enter valid phone number")
        }
        showError()
    }
}
