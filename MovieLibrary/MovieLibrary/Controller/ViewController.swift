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
    @IBOutlet weak var labelHome: UILabel!
    
    // MARK: - Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! TableViewCell
        
        let movie = movieList[indexPath.row]
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: baseUrl + movie.movieBackdrop)!

        cell.posterCell.af.setImage(withURL: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedMovie = movieList[indexPath.row]
        let selectedID = String(selectedMovie.movieID)
        
        let detailsViewController = DetailsViewController()
        
        detailsViewController.selectedMovieID = selectedID
        
        navigationController?.pushViewController(detailsViewController, animated: true)
//       DetailsViewController().getSelectedMovie(sMovie: selectedMovie)
    }
    
    
    // MARK: - Animation
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.9) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    

    // MARK: - Variables
    
    var movieList:[MovieObj] = []
    
    // MARK: - DidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // changing bg color of the navigation area
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.red;
        
        labelHome.backgroundColor = UIColor.black.withAlphaComponent(0)


        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        MoviesAPI().retrieveTrendingMovies{ (movies) in
            for i in 0..<movies.count {
                guard let movieTitle = movies[i]["title"].string else {return}
                guard let movieCover = movies[i]["poster_path"].string else {return}
                guard let movieRating = movies[i]["vote_average"].double else {return}
                guard let movieOverview = movies[i]["overview"].string else {return}
                guard let movieBackdrop = movies[i]["backdrop_path"].string else {return}
                guard let movieID = movies[i]["id"].int else {return}
                
                let eachMovie = MovieObj(title: movieTitle, cover: movieCover, rating: movieRating, overview: movieOverview, backdrop: movieBackdrop, mID: movieID)
                self.movieList.append(eachMovie)
                self.moviesTableView.reloadData()
            }
            

            }
        
}
}
