//
//  File.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import Foundation
import UIKit

extension ProfileViewController {
    
    
    func getInfoAccount() {
        
        let id = "\(datos ?? "")"
        debugPrint(id)
        self.vwLoader.isHidden = false
        API.getInfoAccount(id: id).request(model: AccountResponse.self, handler: {response, error, statusCode in
            if let datos = response {
                DispatchQueue.main.async {
                    self.vwLoader.isHidden = true
                    self.lblUsername.text = "\(String.Profile.At)\(datos.username ?? "")"
                    self.lblName.text = "\(String.Profile.Nombre) \(datos.name ?? "")"
                    self.lblPais.text = "\(String.Profile.Pais) \(datos.iso3166_1 ?? "")"
                    let path = datos.avatar?.tmdb?.avatarPath ?? ""
                    let url = URL(string: "\(String.Profile.urlAvatar)\(path)")
                    let data = try? Data(contentsOf: url!)
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        self.imgProfile.image =  image
                    }
                }
            } else {
                self.alerta(mensaje: error)
            }
        })
    }
}
