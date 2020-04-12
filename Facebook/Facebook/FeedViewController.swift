//
//  FeedViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var user: User?
//    var friends: [User]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        user = User(JSON: UserAccountData["results"] as! [String : Any])
        //friends = User(JSON: FriendsAccountData["results"] as! [String : Any])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProfileScreen":
            let toProfileScreen = segue.destination as! ProfileViewController
                toProfileScreen.user = user
            break
            
        case "FProfileScreen":
            let toProfileScreen = segue.destination as! ProfileViewController
            let friend:Friend = sender as! Friend
            toProfileScreen.user = friend.user

            break
        default: break

        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           
           return 2
       }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       switch section {
       case 0: return 1 
       default: return user?.friends?.count ?? 0
        
       }
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       switch indexPath.section {
           case 0:
               let feedcells1 = tableView.dequeueReusableCell(withIdentifier: "Feedcells01", for: indexPath) as! FeedCell1TableViewCell
               feedcells1.imageName = user?.picture?.large
              if feedcells1.imageName != nil {
                perform(#selector(getimageProfile(cell:)), with: feedcells1, afterDelay: 0)
               }
               
               
               return feedcells1
           default:
               let feedcells2 = tableView.dequeueReusableCell(withIdentifier: "Feedcells02", for: indexPath) as! FeedCell2TableViewCell
               let friend = user?.friends?[indexPath.row]
               feedcells2.p_name?.text = friend?.name //friends?.name?.fullname
               feedcells2.p_time?.text = ""
               feedcells2.p_description?.text = friend?.description
               feedcells2.imageName = friend?.image
               feedcells2.c_like?.text = "Like \(friend?.like ?? 0)"
               feedcells2.c_comment?.text = "\(friend?.comment?.name?.count ?? 0) Comment"
               feedcells2.c_share?.text = "\(friend?.share ?? 0) Share"
               if feedcells2.imageName != nil {
                perform(#selector(getimage(cell:)), with: feedcells2, afterDelay: 0)
               }
               
               return feedcells2
       }
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "ProfileScreen", sender: user)
        case 1:
            performSegue(withIdentifier: "FProfileScreen", sender: user?.friends?[indexPath.row])
        default: break
        }
        
        
    }
    
    @objc func getimageProfile(cell:FeedCell1TableViewCell)  {
        let name:String! = cell.imageName
        AF.request(name).responseImage { response in
            if let images = response.value {
                cell.p_image?.image = images
            }
       }
    }
    
    @objc func getimage(cell:FeedCell2TableViewCell)  {
          let name:String! = cell.imageName
        AF.request(name).responseImage {
            if let images = $0.value {
              cell.p_image?.image = images
           }
       }
    }
    

}
