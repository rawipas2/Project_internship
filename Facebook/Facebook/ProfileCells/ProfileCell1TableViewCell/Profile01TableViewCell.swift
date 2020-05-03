//
//  Profile01TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Profile01TableViewCell: UITableViewCell {

    @IBOutlet weak var bg_image: UIImageView!
    @IBOutlet weak var pf_image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    var bg_url:String?
    var im_url:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(user:User?){


        im_url = user?.picture?.large
        bg_url = user?.imagebg

        name?.text = user?.name?.fullname
        descriptions?.text = user?.email


        if im_url != nil {
            perform(#selector(getimage))
        }

        if bg_url != nil {
            perform(#selector(getimagebg))
        }

    }
    
    
    
      @objc func getimagebg(){
          let name:String! = bg_url
          AF.request(name).responseImage{ response in
                   if let images = response.value {
                    self.bg_image.image = images
                   }
               }
      }
      
      
      @objc func getimage() {
          let name:String! = im_url
          AF.request(name).responseImage{
              if let images = $0.value {
                self.pf_image?.image = images
              
              }
          }
          
      }
    
    
    
}
