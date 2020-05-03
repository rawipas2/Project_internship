//
//  Feed1TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Feed1TableViewCell: UITableViewCell {

    @IBOutlet weak var imageprofile: UIImageView!
    var imagename:String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(user:User?){
            imagename = user?.picture?.large
            if imagename != nil {
                    perform(#selector(getimageProfile))
            }
    }

    
    @objc func getimageProfile()  {
        let name:String! = imagename
        AF.request(name).responseImage { response in
            if let images = response.value {
                self.imageprofile.image = images
            }
       }
    }
    
    
}
