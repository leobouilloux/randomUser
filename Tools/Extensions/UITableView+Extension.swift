//
//  UITableView+Extension.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

extension UITableView {
    func register(cell: UITableViewCell.Type) {
        register(UINib(nibName: cell.nameOfClass, bundle: cell.bundle), forCellReuseIdentifier: cell.identifier)
    }
}
