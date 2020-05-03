//
//  SearchFriendsTableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SearchFriendsTableViewCell: UITableViewCell {


    @IBOutlet weak var image_friend: UIImageView!
    @IBOutlet weak var name: UILabel!
    var getimage:String?
    
    func setData(getfriends:Friend?){
        name.text = getfriends?.name
        getimage = getfriends?.image
        
        if getimage != nil {
            perform(#selector(getimages))
        }
    }
    
    @objc func getimages(){
        let name:String! = getimage
                 AF.request(name).responseImage{
                     if let images = $0.value {
                       self.image_friend?.image = images
                     
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
