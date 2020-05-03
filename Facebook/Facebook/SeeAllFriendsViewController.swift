//
//  SeeAllFriendsViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 24/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class SeeAllFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var friendstable: UITableView!
    
    var resultFriends:[Friend]?
    var allFriends:[Friend]?
    var user:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbar.delegate = self
        
        
        friendstable.register(UINib(nibName: "SearchFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "searchfriend")
       
        //get all friends
        //allFriends receive from responseJSON
        //resultFriends = allFriends
        
        
       let path:String = "http://localhost:5000/api/users/getallfriends/\(user?.userId ?? 0)"
       AF.request(path).responseJSON {
           switch $0.result {
           case .success(let value):
               let json = JSON(value).arrayObject
               self.allFriends = json?.map {
                   Friend(JSON: JSON($0).dictionaryObject!)!
               }
               self.resultFriends = self.allFriends
               self.friendstable.reloadData()
               break
           case .failure(let error):
               print(error)
               break
           }
       }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friends = allFriends?[indexPath.row]
        performSegue(withIdentifier: "GotoPfofile", sender:  friends?.user )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GotoPfofile":
              let toProfileScreen = segue.destination as! ProfileViewController
                  toProfileScreen.user = sender as? User
        default:
            break
        }
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        resultFriends = searchText.isEmpty ? allFriends : allFriends?.filter { $0.name?.contains(searchText) as! Bool}

        friendstable.reloadData()
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbar.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultFriends?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let getfriend = resultFriends?[indexPath.row]
        let seefriends = tableView.dequeueReusableCell(withIdentifier: "searchfriend", for: indexPath) as! SearchFriendsTableViewCell
        
        if resultFriends?.count != 0 {
            seefriends.setData(getfriends: getfriend)
            
        }
        else {
//            seefriends.name.text = g
        }
        return seefriends
    }
    

}
