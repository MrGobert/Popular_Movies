//
//  MovieData.swift
//  Popular_Movies
//
//  Created by James Gobert on 3/9/16.
//  Copyright © 2016 EverydayDigitals. All rights reserved.
//

import Foundation

class MovieData {
    
    let URL_BASE = "http://api.themoviedb.org/3/movie/popular?api_key=f04511d89a5258d2f8fc16267060251d"
    
    
    func downloadMovieData() {
        
        let url = NSURL(string: URL_BASE)!
        let request = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Dictionary<String, AnyObject>
                    
                    if let results = dict!["results"] as? [Dictionary<String, AnyObject>] {
                        print(results)
                    }
                    
                } catch {
                    
                }
            }
        }
        
        task.resume()
        
    }

}
