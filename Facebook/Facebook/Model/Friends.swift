//
//  Friends.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 7/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Friend:Mappable{
    var id:Int?
    var name:String?
    var image:String?
    var user:User?
    var comment:Comment?
    var commentImage:String?
    var like:Int?
    var share:Int?
    var description:String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        image <- map["image"]
        like <- map["like"]
        comment <- map["comment"]
        user <- map["user"]
        description <- map["description"]
    }
}
