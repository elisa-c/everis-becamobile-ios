//
//  DetailsViewController.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 31/03/21.
//

import UIKit

class DetailsViewController: UIViewController {

    var selectedMovie: MovieObj?
    
    
    func getSelectedMovie(sMovie: MovieObj) -> MovieObj {
        let selectedMovie = sMovie
        print(selectedMovie.movieTitle)
        return selectedMovie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDetails()
    }
    
    // MARK: - Functions
    
    func getDetails() {
        //
        print(selectedMovie?.movieTitle)
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
