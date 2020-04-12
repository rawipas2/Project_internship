//
//  Picture.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Picture: Mappable {
    
    var large: String?
    var medium: String?
    var thumbnail: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        large <- map["large"]
        medium <- map["medium"]
        thumbnail <- map["thumbnail"]
        
    }
    

}
