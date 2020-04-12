//
//  Name.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Name: Mappable {
    
    var title: String?
    var first: String?
    var last: String?
    var fullname: String {
         return String(format: "%@ %@", first ?? "", last ?? "")
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        title <- map["title"]
        first <- map["first"]
        last <- map["last"]
    }
    

        
}
