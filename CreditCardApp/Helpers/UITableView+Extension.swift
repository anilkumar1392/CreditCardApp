//
//  UITableView+Extension.swift
//  CreditCardApp
//
//  Created by 13401027 on 11/07/22.
//

import Foundation
import UIKit

public extension UITableView {
    func dequeueResuableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
}
