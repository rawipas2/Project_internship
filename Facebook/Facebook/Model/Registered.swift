//
//  Registered.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Registered: Mappable {
    
   var date: String?
   var age: Int?
        
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        date <- map["date"]
        age <- map["age"]
        
    }
}
