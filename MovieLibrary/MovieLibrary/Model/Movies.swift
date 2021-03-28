// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movies = try? newJSONDecoder().decode(Movies.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMovies { response in
//     if let movies = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Movies
struct Movies: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseResult { response in
//     if let result = response.result.value {
//       ...
//     }
//   }

// MARK: - Result
struct Result: Codable {
    let genreIDS: [Int]?
    let title: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle, posterPath: String?
    let video: Bool?
    let voteAverage: Double?
    let overview, releaseDate: String?
    let voteCount, id: Int?
    let adult: Bool?
    let backdropPath: String?
    let popularity: Double?
    let mediaType: MediaType?
    let originalName: String?
    let originCountry: [String]?
    let firstAirDate, name: String?

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case id, adult
        case backdropPath = "backdrop_path"
        case popularity
        case mediaType = "media_type"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
