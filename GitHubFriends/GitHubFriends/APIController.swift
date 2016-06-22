//
//  APIController.swift
//  TopTracks App
//
//  Created by Joe Moss on 6/20/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
    weak var delegate: GithubAPIDelegate?
    
    let sesssion = NSURLSession.sharedSession()
    
    func fetchGithubUser(username: String) {
        
        let urlString = "https://api.github.com/users/\(username)"
        print(urlString)
        
        if let url = NSURL(string: urlString) {
            
            let task = sesssion.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let jsonDictionary = self.parseJSON(data) {
                    
                    print("I am in the APIController")
                    print(jsonDictionary)
                    
                    self.delegate?.passDictionary(jsonDictionary)
                    
                } else {
                    print("Could not get root level dictionary")
                }
                
                
                })
                task.resume()
            
        } else {
            print("Not a valid URL \(urlString)")
        }
        
    }
                
    func parseJSON(data: NSData?) -> JSONDictionary? {
        
        var theDictionary : JSONDictionary? = nil
        
        if let data = data {
            do {
                
                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                    
                    
                    theDictionary = jsonDictionary
                    
                    //print(jsonDictionary)
                    
                    
                    
                } else {
                    print("Could not parse jsonDictionary")
                }
                
            } catch {
                
            }
            
            
        } else {
            print("Could not unwrap data")
        }
        
        return theDictionary
    }

}
