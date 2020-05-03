//
//  SideMenuArrayTableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 30/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class SideMenuArrayTableViewCell: UITableViewCell {

    @IBOutlet weak var menu: UILabel!
    
    func setData(Menu:String?){
           menu.text = Menu
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
