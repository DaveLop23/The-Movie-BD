//
//  LoginViewModel.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func getToken() {
        
        API.getToken.request(model: GenerateToken.self, handler: {response, error, statusCode in
            if let response = response {
                if response.success == true {
                    debugPrint(response)
                    let tokenRequest = "\(response.requestToken ?? "")"
                    self.requestToken = tokenRequest
                } else {
                    if let error = error {
                        self.alerta(mensaje: error)
                    }
                    
                }
            }
        })
    }
    
    
    func login() {
        
        guard let userStr = txtUser.text else{
            return
        }
        guard let passStr = txtPassword.text else{
            return
        }
        
        let tokenStr = requestToken
        if userStr == "" || passStr == "" {
            self.alerta(mensaje: "Por favor ingrese su usuario y contraseña")
        } else {
            DispatchQueue.main.async {
                self.vwLoader.isHidden = false
            }
            API.login(user: userStr, pass: passStr, token: tokenStr).request(model: LoginResponse.self, handler: {response, error, statusCode in
                if let response = response {
                    if statusCode == 401 {
                        DispatchQueue.main.async {
                            self.alerta(mensaje: "Los datos ingresados no son correctos, por favor verifique su Usuario y/o Contraseña.")
                            self.vwLoader.isHidden = true
                        }
                    }
                    if response.success == true {
                        DispatchQueue.main.async {
                            self.vwLoader.isHidden = true
                            let token = "\(response.requestToken ?? "")"
                            self.requesTokenSessionId = token
                            let vc = TabBarViewController()
                            vc.tokenSessionId = "\(self.requesTokenSessionId)"
                            debugPrint("\(self.requesTokenSessionId)")
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    } else if response.success == false {
                        if let error = error {
                            self.alerta(mensaje: error)
                        }
                    }
                }
            })
        }
        
    }
}
