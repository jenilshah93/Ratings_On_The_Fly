//
//  MovieData.swift
//  Movie_Ratings_On_The_Fly
//
//  Created by Jenil Shah on 4/26/17.
//  Copyright © 2017 NerdAttack. All rights reserved.
//

import Foundation

class MovieData {
    private var _released: String!
    private var _title: String!
    private var _rating: String!
    private var _votes: String!
    
    var released: String {
        if _released == nil {
            _released = ""
        }
        return _released
    }
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    var rating: String {
        if _rating == nil {
            _rating = ""
        }
        return _rating
    }
    var votes: String {
        if _votes == nil {
            _votes = ""
        }
        return _votes
    }
    
    init(movieData:Dictionary<String,Any>){
        if let r = movieData["Released"] as? String {
            _released = r
        }
        if let ra = movieData["imdbRating"] as? String {
            _rating = ra
        }
        if let t = movieData["Title"] as? String {
            _title = t
        }
        if let v = movieData["imdbVotes"] as? String {
            _votes = v
        }
    }


    
}
