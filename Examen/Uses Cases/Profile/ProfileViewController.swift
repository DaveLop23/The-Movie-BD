//
//  ProfileViewController.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import UIKit


class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var vwLoader: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var datos: String? = ""
    var username: String = ""
    var name: String = ""
    var country: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getInfoAccount()
        self.configUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getInfoAccount()
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func configUI(){
        self.vwHeader.backgroundColor = UIColor(named: "DarkBlue")
        self.view.backgroundColor = UIColor(named: "DarkBlue")
        btnLogOut.layer.cornerRadius = 5
        btnLogOut.backgroundColor = .systemGray4
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.clear.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
      //  btnLogOut.setTitle(String.Profile.Button, for: .normal)
        self.lblTitle.text = String.Profile.Title
    }
    
    @IBAction func actionLogOut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

