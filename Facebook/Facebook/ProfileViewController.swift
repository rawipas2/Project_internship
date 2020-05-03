//
//  ProfileViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileCell04Delegate, SeeAllFriendsDelegate {
    
  
    var user:User?
    var feeds: [Feed]?
    var allFriends:[Friend]?
//    var friend:[Friend]?
    @IBOutlet weak var tableProfile: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//     
        perform(#selector(getProfile))
        tableregister()
        
      
        
        let path:String = "http://localhost:5000/api/users/getfeeds/\(user?.userId ?? 0)"
        AF.request(path).responseJSON {
            switch $0.result {
            case .success(let value):
                let json = JSON(value).arrayObject
                self.feeds = json?.map {
                    Feed(JSON: JSON($0).dictionaryObject!)!
                }
                self.tableProfile.reloadData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
        let path2:String = "http://localhost:5000/api/users/getallfriends/\(user?.userId ?? 0)"
              AF.request(path2).responseJSON {
                  switch $0.result {
                  case .success(let value):
                      let json = JSON(value).arrayObject
                      self.allFriends = json?.map {
                          Friend(JSON: JSON($0).dictionaryObject!)!
                      }
                      self.tableProfile.reloadData()
                      break
                  case .failure(let error):
                      print(error)
                      break
                  }
              }
           }
   
    func tableregister(){
            
              tableProfile.register(UINib(nibName: "Profile01TableViewCell", bundle: nil), forCellReuseIdentifier: "profile1")
              tableProfile.register(UINib(nibName: "Profile02TableViewCell", bundle: nil), forCellReuseIdentifier: "profile2")
              tableProfile.register(UINib(nibName: "Profile03TableViewCell", bundle: nil), forCellReuseIdentifier: "profile3")
              tableProfile.register(UINib(nibName: "Profile04TableViewCell", bundle: nil), forCellReuseIdentifier: "profile4")
              
              
              
              tableProfile.register(UINib(nibName: "Feed2TableViewCell", bundle: nil), forCellReuseIdentifier: "feeds02cell")
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "FProfile2":
            let toProfileScreen = segue.destination as! ProfileViewController
            toProfileScreen.user = sender as? User
        
            break
        case "SeeFriend":
            let seeAllfriends = segue.destination as! SeeAllFriendsViewController
            seeAllfriends.user = user
        default: break
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
//

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = (user == nil || (user?.isEmptyUser() ?? false)) ? 0 : 1
        let countFriends = (count > 0 && user?.friends != nil ? user?.friends?.count : 0) ?? 0

        switch section {
        case 0: return count
        case 1: return user?.titles?.count ?? 0
        case 2: return count
        case 3:
            if (countFriends > 0 ) {
                return count
            }
            else {
                return 0
            }
        case 4: return feeds?.count ?? 0
        default: return 0
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
            case 0:

                let profile1 = tableView.dequeueReusableCell(withIdentifier: "profile1", for: indexPath) as! Profile01TableViewCell
                profile1.setData(user: user)
                return profile1
            
            
            case 1:
                
                let titles = user?.titles?[indexPath.row]
                let profile2 = tableView.dequeueReusableCell(withIdentifier: "profile2", for: indexPath) as! Profile02TableViewCell
                profile2.setData(titles: titles)
                
                return profile2
            
            
            case 2:
                let profile3 = tableView.dequeueReusableCell(withIdentifier: "profile3", for: indexPath) as! Profile03TableViewCell
                profile3.setData(user: user)
                
                return profile3
//            
            
            case 3:

                
                let profile4 = tableView.dequeueReusableCell(withIdentifier: "profile4", for: indexPath) as! Profile04TableViewCell
                profile4.delegate = self
                profile4.delegate_friends = self
                profile4.initFcollectionViewCell(user: user,countFriend: allFriends?.count ?? 0)
                return profile4


        default:
            let profile5 = tableView.dequeueReusableCell(withIdentifier: "feeds02cell", for: indexPath) as! Feed2TableViewCell
                let feed = feeds![indexPath.row]
            
//            if  user?.userId == feed.parentUserId  &&  user?.userId == feed.user?.userId {
                profile5.setData(feed: feed)
                if profile5.cheack_lick != false {
                         profile5.button_like.setTitle("Liked", for: .normal)
                         profile5.button_like.setTitleColor( #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) , for: .normal)
                }
//            }
                     
            return profile5
                
        }
    }

    
    
    
    
    //MARK: Load profile & friends
    @objc func getProfile(){
        let path = "http://localhost:5000/api/users/GetProfile/\(user?.userId ?? 0)"
        AF.request(path).responseJSON {
            switch $0.result {
            case .success(let value):
                print(value)
                let json = JSON(value).dictionaryObject
                self.successGetProfile(json: json ?? [:])
                break
            case .failure(let error):
                self.failedGetProfile(error: error)
                break
            }
        }
    }
    func successGetProfile(json:[String:Any]){
        self.user =  User(JSON: json)
        self.tableProfile.reloadData()
    }
    func failedGetProfile(error:AFError){
        print(error)
    }
    
    //MARK: Friend
    func didSelectFriend(user: User) {
        performSegue(withIdentifier: "FProfile2", sender:  user )
    }
    
    func didSelecySeeAllFriends() {
         performSegue(withIdentifier: "SeeFriend", sender: nil)
     }

}
