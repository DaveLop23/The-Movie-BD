//
//  HomeViewModel.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import Foundation

extension HomeViewController {
    
    
    func getSessionId() {
        let token = requesTokenSessionId
        debugPrint(token)
        API.getSessionId(token:token).request(model: SessionResponse.self, handler: {response, error, statusCode in
            if let response = response {
                if response.success == true {
                    let idSession = "\(response.sessionID ?? "")"
                    debugPrint(idSession)
                    self.idSession = idSession
                } else {
                    if let error = error {
                        self.alerta(mensaje: error)
                    }
                    
                }
            }
        })
        
    }
    
    
    
    func getPopularMovies() {
        API.getPopular.request(model: MoviesResponse.self, handler: {response, error, statusCode in
            if let response = response {
                debugPrint(response)
                self.responsePopular.append(response)
            } else {
                if let error = error {
                    self.alerta(mensaje: error)
                }
            }
        })
    }
    
    func getUpcomingMovies() {
        API.getUpcoming.request(model: MoviesResponse.self, handler: {response, error, statusCode in
            if let response = response {
                debugPrint(response)
                self.responseUpcoming.append(response)
            } else {
                if let error = error {
                    self.alerta(mensaje: error)
                }
            }
        })
    }
    
    func getTopRatedMovies() {
        API.getTopRated.request(model: TopRateResponse.self, handler: {response, error, statusCode in
            if let response = response {
                debugPrint(response)
                self.responseTopRated.append(response)
            } else {
                if let error = error {
                    self.alerta(mensaje: error)
                }
            }
        })
    }
    
    
    
}
