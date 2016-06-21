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
    
    let apiController = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
        
        print("I just called viewDidLoad")
        
        self.apiController.fetchGithubUser("josmoss")
        
    }
    
    func passDictionary(dict: JSONDictionary) {
        
        print("I am in the view controller")
    
    }
    
}

