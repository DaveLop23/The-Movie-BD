//
//  MovieDetailsVideoResponse.swift
//  Examen
//
//  Created by David Lopez on 14/11/22.
//

import Foundation

// MARK: - MovieDetailsVideoResponse
class MovieDetailsVideoResponse: Codable {
    let id: Int?
    let results: [ResultVideos]?

    init(id: Int?, results: [ResultVideos]?) {
        self.id = id
        self.results = results
    }
}

// MARK: - Result
class ResultVideos: Codable {
    let iso639_1, iso3166_1, name, key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt, id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }

    init(iso639_1: String?, iso3166_1: String?, name: String?, key: String?, site: String?, size: Int?, type: String?, official: Bool?, publishedAt: String?, id: String?) {
        self.iso639_1 = iso639_1
        self.iso3166_1 = iso3166_1
        self.name = name
        self.key = key
        self.site = site
        self.size = size
        self.type = type
        self.official = official
        self.publishedAt = publishedAt
        self.id = id
    }
}
