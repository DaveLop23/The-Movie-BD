//
//  Request.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Request {
    var metodo: HTTPMethod { get }
    var parametros: [String: Any]? { get }
    var url: String { get }
    var headers: [String: String]? { get }
    func resume<T: Codable>(completion: @escaping (Result<T, Error>) -> Void, codeStatusResponse: ((Int) -> Void)?) -> Void
}
