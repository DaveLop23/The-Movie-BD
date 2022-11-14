//
//  RegisterTableViewCellProtocol.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import Foundation
import UIKit

protocol RegisterTableViewCellProtocol: CellConfigurationProtocol {}

extension RegisterTableViewCellProtocol {
    
    static func register(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func deque<T: RegisterTableViewCellProtocol>(atIndexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: atIndexPath) as! T
    }
}

extension UITableViewCell: RegisterTableViewCellProtocol { }
