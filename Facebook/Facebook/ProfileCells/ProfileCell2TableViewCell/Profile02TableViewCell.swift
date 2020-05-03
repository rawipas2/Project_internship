//
//  Profile02TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class Profile02TableViewCell: UITableViewCell {

     @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
   
    func setData(titles:Titles?){
        
        title.text = titles?.head
        descriptions.text = titles?.description
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
