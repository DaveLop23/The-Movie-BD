//
//  MovieDetailsViewController.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var tableViewDetails: CustomTableView!
    
    var dataMovieDetails: [MovieDetailsResponse]? = [] {
        didSet {
            self.tableViewDetails.reloadData()
        }
    }
    var idMovie: String? = ""
    var keyVideo: String? = ""
    var nameVideo: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDetails()
        self.getVideos()
        self.tableViewSetup()
        self.navigationWhitItemButtonMenu()
        self.navigationItem.hidesBackButton = true
        self.vwHeader.backgroundColor = UIColor(named: "NavBar")
        self.view.backgroundColor = UIColor(named: "DarkBlue")
    }
    
    
    
    func tableViewSetup(){
        MovieDetailsTableViewCell.register(tableView: tableViewDetails)
        MovieDetailVideoTableViewCell.register(tableView: tableViewDetails)
        self.tableViewDetails.delegate = self
        self.tableViewDetails.dataSource = self
        self.tableViewDetails.separatorStyle = .none
    }
    
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return 1
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section, indexPath.row){
        case (0, 0):
            let cell: MovieDetailsTableViewCell = tableView.deque(atIndexPath: indexPath)
            
            cell.config(dataDetails:dataMovieDetails ?? [])
            cell.selectionStyle = .none
            return cell
        case (1, 0):
            let cell: MovieDetailVideoTableViewCell = tableView.deque(atIndexPath: indexPath)
            cell.config(key:keyVideo ?? "", name:nameVideo ?? "")
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
}

