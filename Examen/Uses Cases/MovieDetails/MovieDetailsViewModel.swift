//
//  MovieDetailsViewModel.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import Foundation
import UIKit

extension MovieDetailsViewController {

    func getDetails() {
        // 278
        // 436270
        // 505642
        let movieId = "\(idMovie ?? "")"
        API.getMovieDetails(movieId: movieId).request(model: MovieDetailsResponse.self, handler: {response, error, statusCode in
            if let response = response {
                debugPrint(response)
                self.dataMovieDetails?.append(response)
            } else {
                if let error = error {
                    self.alerta(mensaje: error)
                }
            }
        })
    }
    
    func getVideos() {
        // 278
        // 436270
        // 505642
        let movieId = "\(idMovie ?? "")"
        API.getVideos(movieId: movieId).request(model: MovieDetailsVideoResponse?.self, handler: {response, error, statusCode in
            if let response = response {
                if response?.results?.count ?? 0 > 0 {
                    let key = "\(response?.results?[0].key ?? "")"
                    let name = "\(response?.results?[0].name ?? "")"
                    self.keyVideo = key
                    self.nameVideo = name
                } else {
                    let key = ""
                    let name = ""
                    self.keyVideo = key
                    self.nameVideo = name
                }
                

              
            } else {
                if let error = error {
                    self.alerta(mensaje: error)
                }
            }
        })
    }
}
