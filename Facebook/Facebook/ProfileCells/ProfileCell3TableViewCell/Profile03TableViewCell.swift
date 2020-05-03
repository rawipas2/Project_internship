//
//  Profile03TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Profile03TableViewCell: UITableViewCell {

    @IBOutlet weak var show_image: UIImageView!
    var url_showimage:String?
    
    
    
    func setData(user:User?){
        
      url_showimage = user?.imagehighlights
                      
      if url_showimage != nil {
          perform(#selector(getimageH))
      }
        
    }
    
    @objc func getimageH(){
           let name:String! = url_showimage
           AF.request(name).responseImage{ response in
                    if let images = response.value {
                        self.show_image?.image = images
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
