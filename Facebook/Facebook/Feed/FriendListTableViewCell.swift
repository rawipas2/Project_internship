//
//  FriendListTableViewCell.swift
//  Facebook
//
//  Created by mycostech on 19/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation
import UIKit

class FriendListTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func initFriendListTableViewCell() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let x = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        x.backgroundColor = .black
        
        return x
    }
}
