//
//  Friend.swift
//  GitHubFriends
//
//  Created by Joe Moss on 6/21/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class Friend: NSObject {
    
    // Properties
    var imageURLString : String = ""
    var username : String = ""
    var githubID : Int = 0
    var gitEmail : String = ""
    var publicRepos : Int = 0
    var publicGists : Int = 0
    var followers : Int = 0
    var following : Int = 0
    var createdAt = NSDate()
    
    init(dict: JSONDictionary) {
       super.init()
        
        if let avatarURL = dict["avatar_url"] as? String {
            
            self.imageURLString = avatarURL
            
        } else {
            print("I couldn't parse the avatar url")
        }
        
        if let gitUsername = dict["name"] as? String {
            self.username = gitUsername
            
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
        
//        if let createdAtString = dict["created_at"] as? String {
//            let dateFormatter = NSDateFormatter()
//            
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//            
//            self.createdAt = dateFormatter.dateFromString(createdAtString)!
//        
//        } else {
//            print("I could not parse the createdAt date")
//        }
        
    }
    
}
