//
//  Feed.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 16/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Feed: Mappable {
    
    var name: String?
    var parentUserId: Int?
    var feedid: Int?
    var description: String?
    var image: String?
    var like: Int?
    var parentUserLiked: Bool?
    var comments: Int?
    var shareds: Int?
    var sharedLinks:[String]?
    var user:User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
 
            name <- map["name"]
            parentUserId <- map["parentUserId"]
            feedid <- map["feedid"]
            description <- map["description"]
            image <- map["image"]
            like <- map["like"]
            parentUserLiked <- map["parentUserLiked"]
            comments <- map["comments"]
            shareds <- map["shareds"]
            
            user <- map["user"]

    }
    

}
