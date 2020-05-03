//
//  User.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {

    var name: Name?
    var location: Location?
    var login: Login?
    var dob: Dob?
    var registered : Registered?
    var id: Id?
    var picture: Picture?
    var friends:[Friend]?
    var titles: [Titles]?
    
    var userId:Int?
    var gender: String?
    var phone: String?
    var cell: String?
    var email: String?
    var imagehighlights: String?
    var imagebg: String?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        location <- map["location"]
        dob <- map["dob"]
        registered <- map["registered"]
        id <- map["id"]
        friends <- map["friends"]
        picture <- map["picture"]
        login <- map["login"]
        titles <- map["titles"]
        
        userId <- map["userId"]
        gender <- map["gender"]
        phone <- map["phone"]
        cell <- map["cell"]
        email <- map["email"]
        imagehighlights <- map["imagehighlights"]
        imagebg <- map["imagebg"]
    }
    func isEmptyUser() -> Bool {
        return (userId ?? 0) == 0 || ((userId ?? 0) > 0 && name == nil)
    }
    
}
