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
    @IBOutlet weak var titleContainer: UIView!
    
    // MARK: - Functions
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("creating cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! TableViewCell
        
        let movie = movieList[indexPath.row]
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: baseUrl + movie.movieCover)!

        cell.posterCell.af.setImage(withURL: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedMovie = movieList[indexPath.row]
        let selectedID = String(selectedMovie.movieID)
        
        let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController

        
        detailsViewController.selectedMovieID = selectedID
        
        navigationController?.pushViewController(detailsViewController, animated: false)
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
        
        print("main view loaded")
        
        // changing bg color of the navigation area and hiding border
        
        let color1 = hexStringToUIColor(hex: "FBB53B")
        let color2 = hexStringToUIColor(hex: "FFFFFF")
        
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.barTintColor = color1;
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()

        labelHome.backgroundColor = color1
        titleContainer.backgroundColor = color1
        
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
