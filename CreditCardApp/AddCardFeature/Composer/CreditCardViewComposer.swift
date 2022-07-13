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
        
        let phoneNoController = getPhoneNumberController()
        let emailController = getEmailController()

        vc.tableModel = [phoneNoController, emailController]
        return vc
    }
    
    private static func getPhoneNumberController() -> PhoneNumberCellController {
        let phoneNoModel = PhoneNumberModel(
            phoneNumber: nil,
            errorMsg: nil,
            regex: PhoneNumberModel.phoneNumberRegex,
            phoneNumberLength: PhoneNumberModel.phoneNoLength,
            placeHolder: "Enter mobile no")
        let phoneNoViewModel = PhoneNumberViewModel(model: phoneNoModel)
        return PhoneNumberCellController(viewModel: phoneNoViewModel)
    }
    
    private static func getEmailController() -> EmailIdCellController {
        let emailModel = EmailModel(emailID: nil, errorMsg: nil, regex: EmailModel.emailRegex, placeHolder: "Enter Email")
        let viewModel = EmailIDViewModel(model: emailModel)
        return EmailIdCellController(viewModel: viewModel)
    }
}

private extension CreditCardViewController {
    static func make(viewModel: CreditCardViewModel) -> CreditCardViewController {
        return CreditCardViewController(viewModel: viewModel)
    }
}
