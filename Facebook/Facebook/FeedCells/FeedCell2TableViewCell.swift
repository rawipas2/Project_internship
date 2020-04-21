//
//  FeedCell2.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class FeedCell2TableViewCell: UITableViewCell {

    @IBOutlet weak var p_image: UIImageView!
    @IBOutlet weak var p_name: UILabel!
    @IBOutlet weak var p_time: UILabel!
    @IBOutlet weak var p_description: UILabel!
    @IBOutlet weak var pt_image: UIImageView!

    @IBOutlet weak var c_like: UILabel!
    @IBOutlet weak var c_comment: UILabel!
    @IBOutlet weak var c_share: UILabel!
    

    
    var imageName:String?
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

   override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)

       // Configure the view for the selected state
   }
    
}