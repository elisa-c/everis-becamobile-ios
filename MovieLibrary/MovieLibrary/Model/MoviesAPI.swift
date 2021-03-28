//
//  MoviesAPI.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 27/03/21.
//

import UIKit
import Alamofire

class MoviesAPI: NSObject {
    
    func retrieveTrendingMovies() {
        
        let api_key: String = "a3627ac6d1cea57a39a026d0d83a6a0a"
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=\(api_key)&language=pt-BR")
        else {return}
        
        AF.request(url)
        .validate()
        .responseDecodable(of: Movies.self) { (response) in
            guard let movies = response.value else { return }
            print(movies.results?[0].title)
        }

    }
}
