//
//  TabBarController.swift
//  Examen
//
//  Created by David Lopez on 14/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var tokenSessionId: String = ""
    var idSession: String? = ""
    var segundavista = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.getSessionId()
    }
    
    func setup(){
        let primeravista = HomeViewController()
        primeravista.title = "Home"
        segundavista.title = "Perfil"
        
        self.setViewControllers([primeravista, segundavista], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = [ "house","person.fill"]
        
        for x in 0...1{
            items[x].image = UIImage(systemName: images[x])
        }
        
        
        self.tabBar.backgroundColor = UIColor(named: "DarkBlue")
        self.tabBar.tintColor = UIColor(named: "LightBlue")
    }
    
    func getSessionId() {
        let token = tokenSessionId
        debugPrint(token)
        API.getSessionId(token:token).request(model: SessionResponse.self, handler: {response, error, statusCode in
            if let response = response {
                if response.success == true {
                    let idSession = "\(response.sessionID ?? "")"
                    debugPrint(idSession)
                    self.segundavista.datos = idSession
                    self.idSession = idSession
                } else {
                    if let error = error {
                        debugPrint(error)
                        //self.alerta(mensaje: error)
                    }
                    
                }
            }
        })
        
    }
    

    
}
