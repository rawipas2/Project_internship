//
//  SideMenuSwitchTableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 3/5/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class SideMenuSwitchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menu: UILabel!
    @IBOutlet weak var value: UISwitch!
    
    
    func setData(Menu:String?, Value:Bool?){
        menu.text = Menu
        value.isOn = Value!
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
