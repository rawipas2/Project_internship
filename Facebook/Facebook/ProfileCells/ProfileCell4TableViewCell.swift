//
//  ProfileCell4TableViewCell.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 5/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProfileCell4TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var FriendsCollectionView: UICollectionView!
    @IBOutlet weak var countFrient: UILabel!
    
    var user: User?
    var friends: [Friend]?
    
    func initFcollectionViewCell(){
        FriendsCollectionView.delegate = self
        FriendsCollectionView.dataSource = self
        if (user?.friends?.count != 0){
            FriendsCollectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.friends?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let F_colletion = collectionView.dequeueReusableCell(withReuseIdentifier: "Friendscell", for: indexPath) as! FriensCollectionViewCell
        if (user?.friends?.count != 0){
            
//            let json = JSON(user?.friends).arrayObject
//            self.friends = json?.map{_ in
//                    Friend(JSON: JSON ($0).dictionaryObject!)!
//                   }
//            let friend = friends?[indexPath.row]
//            F_colletion.f_name?.text = friend?.name
//            perform(#selector(getfriend(cell:)), with: F_colletion, afterDelay:  0)
        }
        
       
        return F_colletion
    }
    
//    @objc func getfriend(cell:FriensCollectionViewCell){
//        let json = JSON(user?.friends).arrayObject
//        self.friends = json?.map{
//            Friend(JSON: JSON($0).dictionaryObject!)!
//        }
//        let friend = friends?
        
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
