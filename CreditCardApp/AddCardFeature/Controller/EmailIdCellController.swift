//
//  EmailIdCellController.swift
//  CreditCardApp
//
//  Created by 13401027 on 13/07/22.
//

import Foundation
import UIKit

extension EmailIdCellController: CreditCardCell {}

class EmailIdCellController: NSObject {
    private var viewModel: EmailIDViewModel
    private var cell: EmailCell?
    
    init(viewModel: EmailIDViewModel) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueResuableCell()
        cell?.emailTextField.delegate = self
        display()
        return cell!
    }
    
    func display() {
        cell?.selectionStyle = .none
        cell?.emailTextField.text = viewModel.getEmail()
        cell?.emailTextField.placeholder = viewModel.getPlaceHolderText()
        cell?.emailTextField.keyboardType = .emailAddress
        showError()
    }
    
    func showError() {
        cell?.errorLabel.text = viewModel.getErrorMsg()
        cell?.errorLabel.isHidden = viewModel.showErrorLabel()
    }
}

// MARK: - UITextViewDelegate

extension EmailIdCellController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        viewModel.setErrorMsg(msg: nil)
        showError()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cell?.emailTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateEmailID()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        viewModel.setEmail(email: newText)
        return true
    }
    
    func validateEmailID() {
        if viewModel.valdiateEmail() {
            viewModel.setErrorMsg(msg: nil)
        } else {
            viewModel.setErrorMsg(msg: "Please enter valid email ID")
        }
        showError()
    }
}
