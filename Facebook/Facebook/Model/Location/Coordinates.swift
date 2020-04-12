//
//  Coordinates.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Coordinates: Mappable {
    
    var latitude: String?
    var longitude: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    

    
    
}
