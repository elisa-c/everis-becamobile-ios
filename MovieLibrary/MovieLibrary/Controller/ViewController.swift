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
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! TableViewCell
        
        let movie = movieList[indexPath.row]
        let title = movie.movieTitle
        cell.labelTitle.text = "testee"
        debugPrint(cell.labelTitle.text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
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
                self.moviesTableView.reloadData()
            }
            

            }
        
}
}
