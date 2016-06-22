//
//  ViewController.swift
//  GitHubFriends
//
//  Created by Joe Moss on 6/21/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

protocol GithubAPIDelegate : class {
    func passDictionary(dict: JSONDictionary)
    
}

class ViewController: UIViewController, GithubAPIDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let apiController = APIController()
    
    var imageURLString : String = ""
    var username : String = ""
    var githubID : Int = 0
    var gitEmail : String = ""
    var publicRepos : Int = 0
    var publicGists : Int = 0
    var followers : Int = 0
    var following : Int = 0
    var createdAt = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
        
        print("I just called viewDidLoad")
        
        self.apiController.fetchGithubUser("josmoss")
        
    }
    
    func passDictionary(dict: JSONDictionary) {
        
        print("I am in the view controller")
        
        if let avatarURL = dict["avatar_url"] as? String {
            
            self.imageURLString = avatarURL
            
            self.getImageFromURLString(self.imageURLString)
            
        } else {
            print("I couldn't parse the avatar url")
        }
        
        if let gitUsername = dict["name"] as? String {
            self.username = gitUsername
            self.usernameLabel.text = gitUsername
            
        } else {
            print("I could not parse the user name")
        }
        
        if let githubID = dict["id"] as? Int {
            self.githubID = githubID
            
        } else {
            print("I could not parse the github id")
        }
        
        if let gitEmailAddress = dict["email"] as? String {
            self.gitEmail = gitEmailAddress
            self.emailLabel.text = gitEmailAddress
            
        } else {
            print("I could not parse the email")
        }
        
        if let publicRepos = dict["public_repos"] as? Int {
            self.publicRepos = publicRepos
            
        } else {
            print("I could not parse the public repos")
        }
        
        if let publicGists = dict["public_gists"] as? Int {
            self.publicGists = publicGists
            
        } else {
            print("I could not parse the public gists")
        }
        
        if let followers = dict["followers"] as? Int {
            self.followers = followers
            
        } else {
            print("I could not parse the followers")
        }
        
        if let following = dict["following"] as? Int {
            self.following = following
            
        } else {
            print("I could not parse the following")
        }
        
        //        if let createdAt = dict["created_at"] as? String {
        //            let dateFormatter = NSDateFormatter()
        //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        //
        //            self.createdAt = dateFormatter.dateFromString(createdAt)!
        //            
        //        } else {
        //            print("I could not parse the createdAt date")
        //        }
        
    }
    
    func getImageFromURLString(urlString:String) {
        
        if let url = NSURL(string:urlString) {
            
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                
                if error != nil {
                    print("\(error?.localizedDescription)")
                    return
                }
                
                if let data = data {
                    
                    let image = UIImage(data: data)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                    
                        
                        self.imageView.image = image
                        self.imageView.setNeedsLayout()
                
                        })
                    
                }
            })
            task.resume()
            
        } else {
            print("Not a valid url \(urlString)")
        }
        
    }
    
}

