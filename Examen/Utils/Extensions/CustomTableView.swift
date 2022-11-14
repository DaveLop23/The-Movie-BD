//
//  TableViewManager.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import Foundation
import UIKit

protocol RefreshTableViewProtocol: AnyObject {
    func refresh(tableView: UITableView)
}

class CustomTableView: UITableView {

    var refreshDelegate: RefreshTableViewProtocol? {
        didSet {
            if let _ = self.refreshDelegate {
                self.addRefreshControl()
            } else {
                self.refreshControl = nil
            }
        }
    }
    
    override func reloadData() {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
        //    DispatchQueue.main.async {
                super.reloadData()
          //  }
        }, completion: nil)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func addRefreshControl() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refresh(tableView:)), for: .valueChanged)
        refresh.tintColor = UIColor(named: "LightBlue")
        self.refreshControl = refresh
    }
    
    @objc func refresh(tableView: UITableView) {
        self.refreshControl?.beginRefreshing()
        self.refreshDelegate?.refresh(tableView: self)
    }
    
}
