//
//  SettingsBundleHelper.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 29/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation
import UIKit

class SettingsBundleHelper {
  
//    enum BundleSetting: String {
//        case NIGHT_MODE = "night_mode"
//    }
//    
//    class func getTextColor()->UIColor{
//           let color:UIColor = UIColor(hexString: UserDefaults.standard.string(forKey: BundleSetting.NIGHT_MODE.rawValue) ?? "#292b2c")
//           return color;
//       }
//   
    func setBundle() {
        UserDefaults.standard.set("www.google.com", forKey: "Server")
    }
    func getServer() -> String{
        return UserDefaults.standard.string(forKey: "Server") ?? ""
        
    }
}
