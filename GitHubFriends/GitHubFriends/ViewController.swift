//
//  ViewController.swift
//  GitHubFriends
//
//  Created by Joe Moss on 6/21/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

protocol GithubAPIDelegate : class {
    func passGithubFriend(friend: Friend)
    
}

class ViewController: UIViewController, GithubAPIDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var gitIdLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let apiController = APIController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
        
        print("I just called viewDidLoad")
        
        self.apiController.fetchGithubUser("josmoss")
        
    }
    
    func passGithubFriend(friend: Friend) {
        
        print("I am in the view controller")
        
        print(friend.username)
        
        self.usernameLabel?.text = friend.username
        
        self.emailLabel?.text = friend.gitEmail
        
//        self.gitIdLabel?.text =
//        self.dateLabel?.text =
        
        self.getImageFromURLString(friend.imageURLString)
        
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

