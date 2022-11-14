//
//  LoginResponse.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import Foundation

// MARK: - LoginResponse
class LoginResponse: Codable {
    let success: Bool?
    let expiresAt, requestToken: String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }

    init(success: Bool?, expiresAt: String?, requestToken: String?) {
        self.success = success
        self.expiresAt = expiresAt
        self.requestToken = requestToken
    }
}


