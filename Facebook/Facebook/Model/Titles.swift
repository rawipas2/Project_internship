//
//  Title.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 16/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Titles: Mappable {
    
    var head:String?
    var description:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        head <- map["head"]
        description <- map["description"]
    }
    

    

}
