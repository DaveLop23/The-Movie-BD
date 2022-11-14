//
//  SessionResponse.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import Foundation

// MARK: - SessionResponse
class SessionResponse: Codable {
    let success: Bool?
    let sessionID: String?

    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }

    init(success: Bool?, sessionID: String?) {
        self.success = success
        self.sessionID = sessionID
    }
}
