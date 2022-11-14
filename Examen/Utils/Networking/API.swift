//
//  API.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import Foundation
import UIKit
import CoreLocation

enum API {
    
    static var enviroment:Enviroment = .prd
    // MARK: - Ambiente
    enum Enviroment{
        case dev
        case prd
    }
    
    static var apiKey:String = "7a34fade8b76083c2199185ee1bbb7b6"
    
    // MARK: - URL Base
    static var urlBase:String {
        switch API.enviroment {
        case .prd:
            //https://api.themoviedb.org/3/authentication/token/new?api_key=7a34fade8b76083c2199185ee1bbb7b6
            return "https://api.themoviedb.org/3"
        case .dev:
            return "https://api.themoviedb.org/3"
        }
    }
    
    // MARK: - Casos de Servicio
    // GET
    case test
    case getToken
    case getPopular
    case getUpcoming
    case getMovieDetails(movieId:String)
    case getVideos(movieId:String)
    case getTopRated
    case getInfoAccount(id:String)
    
    // POST
    case login(user:String, pass:String, token:String)
    case getSessionId(token:String)
}

// MARK: - Metodos
extension API{
    var method:HTTPMethod {
        switch self {
        case .getToken, .getInfoAccount, .getPopular, .getMovieDetails, .getVideos:
            return .get
        default:
            return .post
        }
    }
    // MARK: - Parametros
    var params:[String:Any]?{
        switch self {
        case .login(let user, let pass, let token):
            return ["username":user,
                    "password":pass,
                    "request_token":token]
       
        case .getSessionId(let token):
            return ["request_token": token]
        default:
            return nil
        }
    }
    
    
    // MARK: - URL de Servicios
    var urlComplement:String{
        switch self {
        case .test:
            return ""
        case .getVideos(let movieId):
            return"\(API.urlBase)/movie/\(movieId)/videos?api_key=\(API.apiKey)&language=es-MX"
        case .getMovieDetails(let movieId):
            return"\(API.urlBase)/movie/\(movieId)?api_key=\(API.apiKey)&language=es-MX"
        case .getPopular:
            return "\(API.urlBase)/movie/popular?api_key=\(API.apiKey)&language=es-MX&page=1&region=mx"
        case .getUpcoming:
            return "\(API.urlBase)/movie/upcoming?api_key=\(API.apiKey)&language=es-MX&page=1&region=mx"
        case .getTopRated:
            return "\(API.urlBase)/movie/top_rated?api_key=\(API.apiKey)&language=es-MX&page=1&region=mx"
        case .getToken:
            return "\(API.urlBase)/authentication/token/new?api_key=\(API.apiKey)"
        case .getInfoAccount(let id):
            return "\(API.urlBase)/account?api_key=\(API.apiKey)&session_id=\(id)"
        case .getSessionId(let token):
            return "\(API.urlBase)/authentication/session/new?api_key=\(API.apiKey)&request_token=\(token)"
        
        case .login(let user, let pass, let token):
            return "\(API.urlBase)/authentication/token/validate_with_login?api_key=\(API.apiKey)&username=\(user)&password=\(pass)&request_token=\(token)"
        }
    }
    // MARK: - Headers
    var headers: [String: String]{
        switch self {
        default:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        }
    }
}

extension API {
    
    func request<ResponseType:Codable>(model: ResponseType.Type,handler: @escaping (_ response:ResponseType?, _ error:String?, _ statusCode:Int?) -> Void) {
        
        guard let url = URL(string: self.urlComplement) else {
            return
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = self.method.rawValue
        request.allHTTPHeaderFields = self.headers
        
        if let parameter = self.params {
            do {
                
                let data = try JSONSerialization.data(withJSONObject: parameter,options: .fragmentsAllowed)
                request.httpBody = data
                
            } catch {
                debugPrint(error)
                handler(nil, error.localizedDescription, 999)
            }
        }
        
        let urlSession = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data, let urlResponse = urlResponse else {
                handler(nil, "La peticion no regreso datos", 9999)
                return
            }
            guard let code = (urlResponse as? HTTPURLResponse)?.statusCode else {
                handler(nil, "La peticion no tiene status code", 9999)
                return
            }
            do {
                let dataResponse = try JSONDecoder().decode(ResponseType.self, from: data)
                handler(dataResponse, nil, code)
            } catch {
                debugPrint(error)
                handler(nil, error.localizedDescription, code)
            }
            
        }
        urlSession.resume()
    }
}
