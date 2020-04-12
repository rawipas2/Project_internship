//
//  Timezone.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Timezone: Mappable {
    
    var offset: String?
    var description: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        offset <- map["offset"]
        description <- map["description"]
        
    }
    

}
