//
//  MenuProfileTableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 29/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MenuProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image_profile: UIImageView!
    
    var image_url:String?
    
    func setData(user:User?){
        name.text = user?.name?.fullname
        image_url = user?.picture?.large
        if image_url != nil {
            perform(#selector(getimageProfile))
        }
    }
    
    @objc func getimageProfile()  {
          let name:String! = image_url
          AF.request(name).responseImage { response in
              if let images = response.value {
                  self.image_profile.image = images
              }
         }
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
