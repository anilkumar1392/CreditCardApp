//
//  EmailCell.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import UIKit

class EmailCell: UITableViewCell {

    @IBOutlet private(set) public weak var emailTextField: UITextField!
    @IBOutlet private(set) public weak var separatorView: UIView!
    @IBOutlet private(set) public weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
