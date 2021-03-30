//
//  MovieObj.swift
//  MovieLibrary
//
//  Created by Elisa Camillo on 30/03/21.
//

import UIKit

class MovieObj: NSObject {

    var movieTitle: String
    var movieCover: String
    var movieRating: Double
    var movieOverview: String
    
    init(title:String, cover:String, rating:Double, overview:String) {
        self.movieTitle = title
        self.movieCover = cover
        self.movieRating = rating
        self.movieOverview = overview
    }
    
    }
