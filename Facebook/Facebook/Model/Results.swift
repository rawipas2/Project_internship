//
//  Results.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 5/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Results: Mappable {
    
    var results:User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
    

}
