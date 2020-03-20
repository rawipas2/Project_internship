//
//  Myselfs.swift
//  Facebook
//
//  Created by mycostech on 20/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

@objc protocol MySelfsDelegate {
    
    func didTapOnProfileButton()
    
    @objc optional func x()
}

class Myselfs: UITableViewCell {
    
    var delegate: MySelfsDelegate?
    
    @IBOutlet weak var ImageProfile: UIImageView!

    @IBAction func didTapOnProfileButton(_ sender: Any) {
        
        delegate?.didTapOnProfileButton()
    }
}
