//
//  DetailsViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 31/03/21.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var labelDetailsTitle: UILabel!
    @IBOutlet weak var labelDetailsRating: UILabel!
    @IBOutlet weak var labelDetailsOverview: UILabel!
    
    // MARK: - Variables
    var selectedMovieID: String = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDetails()
    }
    
    // MARK: - Functions
    
    func getDetails() {
        print("loaded details view")
        MoviesAPI().retrieveMovieDetails(movieID: selectedMovieID, completion:{ (movie) in
            
            if let movieTitle = movie["title"].string {
                self.labelDetailsTitle?.text = movieTitle
            }
            if let movieRating = movie["vote_average"].double {
                let movieRatingStr = String(movieRating)
                self.labelDetailsRating?.text = "Rating: \(movieRatingStr)"
            }
            if let movieOverview = movie["overview"].string {
                self.labelDetailsOverview?.text = movieOverview
            }
            
            if let movieCoverPath = movie["backdrop_path"].string {
                
                guard let url = URL(string: "http://image.tmdb.org/t/p/w500\(movieCoverPath)") else {return}
                
                self.imageDetails.af.setImage(withURL: url)
//                self.imageDetails.layer.shadowColor = UIColor.white.cgColor
//                self.imageDetails.layer.shadowOpacity = 1
//                self.imageDetails.layer.shadowOffset = .zero
//                self.imageDetails.layer.shadowRadius = 5
            }
            
            
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
