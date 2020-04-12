//
//  Location.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable  {
    
    var street: Street?
    var coordinates: Coordinates?
    var timezone: Timezone?
    
    var city: String?
    var state: String?
    var country: String?
    var postcode: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        street <- map["street"]
        coordinates <- map["coordinates"]
        timezone <- map["timezone"]
        
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        postcode <- map["postcode"]
        
    }
    

    
    
}
