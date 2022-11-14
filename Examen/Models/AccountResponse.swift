//
//  AccountResponse.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import Foundation

// MARK: - AccountResponse
class AccountResponse: Codable {
    let avatar: Avatar?
    let id: Int?
    let iso639_1, iso3166_1, name: String?
    let includeAdult: Bool?
    let username: String?

    enum CodingKeys: String, CodingKey {
        case avatar, id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name
        case includeAdult = "include_adult"
        case username
    }

    init(avatar: Avatar?, id: Int?, iso639_1: String?, iso3166_1: String?, name: String?, includeAdult: Bool?, username: String?) {
        self.avatar = avatar
        self.id = id
        self.iso639_1 = iso639_1
        self.iso3166_1 = iso3166_1
        self.name = name
        self.includeAdult = includeAdult
        self.username = username
    }
}

// MARK: - Avatar
class Avatar: Codable {
    let gravatar: Gravatar?
    let tmdb: Tmdb?

    init(gravatar: Gravatar?, tmdb: Tmdb?) {
        self.gravatar = gravatar
        self.tmdb = tmdb
    }
}

// MARK: - Gravatar
class Gravatar: Codable {
    let hash: String?

    init(hash: String?) {
        self.hash = hash
    }
}

// MARK: - Tmdb
class Tmdb: Codable {
    let avatarPath: String?

    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }

    init(avatarPath: String?) {
        self.avatarPath = avatarPath
    }
}
