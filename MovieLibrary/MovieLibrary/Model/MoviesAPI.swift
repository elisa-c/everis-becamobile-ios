//
//  MoviesAPI.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 29/03/21.
//

import UIKit
import Alamofire
import SwiftyJSON


class MoviesAPI: NSObject {
        
    func retrieveTrendingMovies(completion: @escaping (_ movies: JSON) -> Void) {
        
        let api_key: String = "a3627ac6d1cea57a39a026d0d83a6a0a"
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=\(api_key)") else {return}

        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let moviesJSON = json["results"]
                completion(moviesJSON)

            case .failure(let error):
                print(error)
            }
        }

}

}

// MARK: - Unused Code


//        AF.request(url, method: .get).responseJSON{ (data) in
//            print(data)
//        }

//
//        AF.request(url, method: .get).responseJSON() { (response) in
//            switch response.result {
//            case .success(let json):
//                if let moviesJSON = json as? [String: Any] {
//                    let movies = try newJSONDecoder().decode(Movies.self, from: moviesJSON)
//
//                }
//
//            case .failure(let error):
//            print(error)
//            }
//        }


//
//        if let jsonData = json.data(using: .utf8) {
//        let movies = try? newJSONDecoder().decode(Movies.self, from: jsonData)
//
//        AF.request("https://run.mocky.io/v3/e0eed0b3-0fa7-4dce-8356-ef0069c7be22")
//          .validate()
//          .responseDecodable(of: Movies.self) { (response) in
//            guard let movies = response.value else { return }
//            print(movies)
//          }

//}

//        if let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(api_key)") {
//            if let data = try? Data(contentsOf: url) {
//                parse(json: data)
//            }
//        }

//
//    func parse(json: Data)  {
//        let decoder = JSONDecoder()
//
//        if let jsonMovies = try? decoder.decode(Movies.self, from: json) {
//            movies = jsonMovies.results
//        }
//    }

