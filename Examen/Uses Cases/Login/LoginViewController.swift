//
//  LoginViewController.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblErrorServicio: UILabel!
    @IBOutlet weak var vwLoader: UIView!
    
    var requestToken: String = ""
    var requesTokenSessionId: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.getToken()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.txtUser.text = nil
        self.txtPassword.text = nil
        loadViewIfNeeded()
    }
    
    func configUI(){
        self.view.backgroundColor = UIColor(named: "DarkBlue")
        btnLogin.layer.cornerRadius = 5
        btnLogin.backgroundColor = .systemGray4
        btnLogin.setTitle(String.Login.Login, for: .normal)
        txtUser.placeholder = String.Login.User
        txtPassword.placeholder = String.Login.Password
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        self.login()
        
    }
    
}
