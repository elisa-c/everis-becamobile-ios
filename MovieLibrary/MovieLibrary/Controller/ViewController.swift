//
//  ViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 29/03/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var movieList:[MovieObj] = []

    
//    var movieTitle:String = ""
//    var movieCover:String = ""
//    var movieRating:Double = ""
//    var movieOverview:String = ""
//    var trendingMovies: [[String:Any]] = [[:]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MoviesAPI().retrieveTrendingMovies{ (movies) in

            for i in 0..<movies.count {
                guard let movieTitle = movies[i]["title"].string else {return}
                guard let movieCover = movies[i]["poster_path"].string else {return}
                guard let movieRating = movies[i]["vote_average"].double else {return}
                guard let movieOverview = movies[i]["overview"].string else {return}
                
                let eachMovie = MovieObj(title: movieTitle, cover: movieCover, rating: movieRating, overview: movieOverview)
                self.movieList.append(eachMovie)
                print(self.movieList)
            }
            
//            let eachMovie = MovieObj(title: movieTitle, cover: movieCover, rating: movieRating, overview: movieOverview)
            print("smth")
          
//            print("------------------viewcontroller-------------------")
//            if let parsedTitle = movies[0]["title"].string {
//                movieTitle = parsedTitle
//                if let parsedCover = movies[0]["poster_path"].string {
//                    movieCover = parsedCover
//                    if let parsedRating = movies[0]["vote_average"].string {
//                        movieRating = parsedRating
//                        if let parsedOverview = movies[0]["overview"].string {
//                            movieOverview = parsedOverview
//                            let eachMovie = MovieObj(title: movieTitle, cover: movieCover, rating: movieRating, overview: movieOverview)
//                            print(eachMovie.movieTitle)
//                        }
//                    }
//                }
//            }
//            for movie in movies {
//                print(movie.1["title"])
//            }
            }
            
}
}
