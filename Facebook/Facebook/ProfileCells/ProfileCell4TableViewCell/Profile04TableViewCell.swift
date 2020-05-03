//
//  Profile04TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 27/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

protocol ProfileCell04Delegate {
    func didSelectFriend(user:User)
}

protocol SeeAllFriendsDelegate {
    func didSelecySeeAllFriends()
}


class Profile04TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var count_friends: UILabel!
    @IBOutlet weak var friends_collection: UICollectionView!
    
    @IBAction func see_friends(_ sender: Any) {
        delegate_friends?.didSelecySeeAllFriends()
    }
    
    var delegate_friends:SeeAllFriendsDelegate?
    var delegate:ProfileCell04Delegate?
    var user:User?


    func initFcollectionViewCell(user:User?, countFriend:Int){
        
        self.friends_collection.register(UINib(nibName: "Friends_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "friendcollection")
        
        self.user = user
        friends_collection.delegate = self
        friends_collection.dataSource = self
        
        if (user?.friends?.count != 0){
            friends_collection.reloadData()
        }
        count_friends.text = "Friends \(countFriend)"
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.friends?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let friend = user?.friends?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendcollection", for: indexPath) as! Friends_CollectionViewCell
        cell.setData(friend: friend, url: friend?.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friend = user?.friends?[indexPath.row]
        if friend != nil && friend?.user != nil {
            self.delegate?.didSelectFriend(user: (friend?.user!)!)
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
