//
//  ViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 29/03/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var movieTitle: String = ""
    var trendingMovies: [[String:Any]] = [[:]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MoviesAPI().retrieveTrendingMovies{ [self] (movies) in
            print("------------------viewcontroller-------------------")
            if let parsedTitle = movies[0]["title"].string {
                movieTitle = parsedTitle
                print(movieTitle)
            }
//            for movie in movies {
//                print(movie.1["title"])
//            }
            }
            
}
}
