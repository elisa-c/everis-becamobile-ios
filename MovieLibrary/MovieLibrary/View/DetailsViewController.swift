//
//  DetailsViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 31/03/21.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var labelDetailsTitle: UILabel!
    
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
            print(movieTitle)
                self.labelDetailsTitle?.text = movieTitle
            }
            guard let movieRating = movie["vote_average"].double else {return}
            guard let movieOverview = movie["overview"].string else {return}
            
            
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
