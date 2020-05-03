//
//  Friends_CollectionViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 28/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Friends_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    var  image_url:String?
    
    func setData(friend:Friend?,url:String?){
        image_url = url
        name?.text = friend?.name
        if image_url != nil {
            perform(#selector(getimage))
        }
    }
    
    @objc func getimage(){
        let name:String! = image_url
        AF.request(name).responseImage {
            if let images = $0.value {
                self.image?.image = images
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
