//
//  Login.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class Login: Mappable {
    
    var uuid: String?
    var username: String?
    var password: String?
    var salt: String?
    var mad5: String?
    var sha1: String?
    var sha256: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        uuid <- map["uuid"]
        username <- map["username"]
        password <- map["password"]
        salt <- map["salt"]
        mad5 <- map["mad5"]
        sha1 <- map["sha1"]
        sha256 <- map["sha256"]
    }
    
    
    

}
