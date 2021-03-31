//
//  ViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 29/03/21.
//

import UIKit
import Alamofire
import AlamofireImage


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
    }
    
    
    // MARK: - Variables
    
    var movieList:[MovieObj] = []
    
    // MARK: - DidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        MoviesAPI().retrieveTrendingMovies{ (movies) in
            for i in 0..<movies.count {
                guard let movieTitle = movies[i]["title"].string else {return}
                guard let movieCover = movies[i]["poster_path"].string else {return}
                guard let movieRating = movies[i]["vote_average"].double else {return}
                guard let movieOverview = movies[i]["overview"].string else {return}
                
                let eachMovie = MovieObj(title: movieTitle, cover: movieCover, rating: movieRating, overview: movieOverview)
                self.movieList.append(eachMovie)
            }
            

            }
            
}
}


// MARK: - Unused Code
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
