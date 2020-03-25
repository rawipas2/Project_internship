//
//  MyFrindProfileCollectionViewCell.swift
//  Facebook
//
//  Created by MycosTech on 20/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

protocol MyFrindProfileCollectionViewCellDelegate {
    
    func didTapOnProfileFriendButton()
}

class MyFrindProfileCollectionViewCell: UICollectionViewCell {
    var delegate: MyFrindProfileCollectionViewCellDelegate?
    

    @IBOutlet weak var ImageFriend: UIImageView!
    @IBOutlet weak var FriendName: UILabel!
    
    @IBAction func didTabOnProfileFriend(_ sender: Any) {
        
        delegate?.didTapOnProfileFriendButton()
    }
}
