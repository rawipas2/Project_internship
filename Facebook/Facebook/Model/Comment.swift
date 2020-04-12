//
//  Comment.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 8/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Comment: Mappable {
    
    var name:String?
    var description:String?
    var image:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        image <- map["image"]
    }
    

}
