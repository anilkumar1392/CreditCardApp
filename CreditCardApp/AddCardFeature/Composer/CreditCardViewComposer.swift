//
//  CreditCardViewComposer.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation

public class CreditCardViewComposer {
    private init() {}
    
    static func viewComposedWith() -> CreditCardViewController {
        let viewModel = CreditCardViewModel(title: "Credit/Debit Card")
        let vc = CreditCardViewController.make(viewModel: viewModel)
        
        let phoneNoController = getPhoneNumberController(delegate: viewModel)
        let emailController = getEmailController(emailObserver: viewModel)

        vc.tableModel = [phoneNoController, emailController]
        return vc
    }
    
    private static func getPhoneNumberController(delegate: PhoneNumberCellDelegate) -> PhoneNumberCellController {
        let phoneNoModel = PhoneNumberModel(
            phoneNumber: nil,
            errorMsg: nil,
            regex: PhoneNumberModel.phoneNumberRegex,
            phoneNumberLength: PhoneNumberModel.phoneNoLength,
            placeHolder: "Enter mobile no")
        let phoneNoViewModel = PhoneNumberViewModel(model: phoneNoModel, delegate: delegate)
        return PhoneNumberCellController(viewModel: phoneNoViewModel)
    }

    private static func getEmailController(emailObserver: CreditCardViewModel) -> EmailIdCellController {
        let emailModel = EmailModel(
            emailID: nil,
            errorMsg: nil,
            regex: EmailModel.emailRegex,
            placeHolder: "Enter Email")
        let viewModel = EmailIDViewModel(model: emailModel)
        viewModel.didChangeEmail = emailObserver.emailUpdated
        return EmailIdCellController(viewModel: viewModel)
    }

}

private extension CreditCardViewController {
    static func make(viewModel: CreditCardViewModel) -> CreditCardViewController {
        return CreditCardViewController(viewModel: viewModel)
    }
}
