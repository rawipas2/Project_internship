//
//  ProfileCell4TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 5/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class ProfileCell4TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var FriendsCollectionView: UICollectionView!
    
    
    func initFcollectionViewCell(){
        FriendsCollectionView.delegate = self
        FriendsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let F_colletion = collectionView.dequeueReusableCell(withReuseIdentifier: "Friendscell", for: indexPath)
       
        return F_colletion
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
