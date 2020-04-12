//
//  Id.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//
import UIKit
import ObjectMapper

class Id: Mappable {

    var name: String?
    var value: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        name <- map["name"]
        value <- map["value"]

    }


}
