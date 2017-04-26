//
//  SecondViewController.swift
//  Movie_Ratings_On_The_Fly
//
//  Created by Jenil Shah on 4/26/17.
//  Copyright © 2017 NerdAttack. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
 
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var yearBig: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var votesBig: UILabel!
    @IBOutlet var ratingBing: UILabel!
    @IBOutlet var votesLabel: UILabel!
    var titleString: String!
    var movie = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DownloadData {
            self.setupUI()
        }
       
    }
    func setupUI(){
        titleLabel.text = self.movie["title"] as? String
        yearLabel.text = self.movie["released"] as? String
        ratingLabel.text = self.movie["rating"] as? String
        votesLabel.text = self.movie["votes"] as? String
    }
    
    func DownloadData(completed: @escaping DownloadComplete){
        titleString  = titleString.replacingOccurrences(of: " ", with: "+")
       
        Alamofire.request("http://www.omdbapi.com/?t=\(titleString!)&plot=full&r=json").responseJSON {
             response in
            if let dict = response.result.value as? Dictionary<String,Any>{
                let movieData = MovieData(movieData:dict)
                self.movie.updateValue(movieData.released, forKey: "released")
                self.movie.updateValue(movieData.title, forKey: "title")
                self.movie.updateValue(movieData.rating, forKey: "rating")
                self.movie.updateValue(movieData.votes, forKey: "votes")
            }
            completed()
        }
    }
}
