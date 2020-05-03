//
//  Feed2TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Feed2TableViewCell: UITableViewCell {

    @IBOutlet weak var imageprofile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var imagepost: UIImageView!
    

    @IBOutlet weak var count_like: UILabel!
    @IBOutlet weak var count_comment: UILabel!
    @IBOutlet weak var count_share: UILabel!
    
    @IBOutlet weak var button_like: UIButton!
    
    var comment:Comment?
    var imageName:String?
    var postimage:String?
    var cheack_lick:Bool?
    
    func setData(feed:Feed?) {
          name?.text = feed?.name //friends?.name?.fullname
          descriptions?.text = feed?.description
          comment =  feed?.comment
          cheack_lick = feed?.parentUserLiked
          imageName = feed?.image
          postimage = feed?.imagepost
          
          count_like?.text = "Like \(feed?.like ?? 0)"
          count_comment.text = "Comment"
          count_share?.text = "Share \(feed?.shareds ?? 0)"
          time?.text = ""
          
          
     
          if cheack_lick != false {
           button_like.setTitle("Liked", for: .normal)
           button_like.setTitleColor( #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) , for: .normal)
          }
          
          if postimage != nil {
            perform(#selector(getimagepost))
         }
          
          if imageName != nil {
            perform(#selector(getimage))
          }
    }
    
    @objc func getimage()  {
            let name:String! = imageName
          AF.request(name).responseImage {
              if let images = $0.value {
                self.imageprofile?.image = images
             }
         }
      }
    
    @objc func getimagepost() {
        let name:String! = postimage
        AF.request(name).responseImage { response in
             if let images = response.value {
                self.imagepost?.image = images
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
