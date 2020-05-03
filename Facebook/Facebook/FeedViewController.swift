//
//  FeedViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//
import UIKit
import SwiftyJSON
import ObjectMapper
import Alamofire
import AlamofireImage
import SideMenu



class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var user: User?
    var feeds: [Feed]?
    var comment: Comment?
    
    @IBAction func sidetomenu(_ sender: Any) {
        
    }
    
    @IBOutlet weak var tableFeed: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideMenu()
        tabelregister()
        getuser()
//
//
        }
   //image profile / user name
   //Main menu
   //Setting
   //logout
    func setupSideMenu() {
       
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    
    func tabelregister(){
        tableFeed.register(UINib(nibName: "Feed1TableViewCell", bundle: nil), forCellReuseIdentifier: "feeds01cell")
        tableFeed.register(UINib(nibName: "Feed2TableViewCell", bundle: nil), forCellReuseIdentifier: "feeds02cell")
    }
    
    func getuser(){
        let path:String = "http://localhost:5000/api/users/getfeeds/\(user?.userId ?? 0)"
        AF.request(path).responseJSON {
            switch $0.result {
            case .success(let value):
                let json = JSON(value).arrayObject
                self.feeds = json?.map {
                    Feed(JSON: JSON($0).dictionaryObject!)!
                }
                
                self.tableFeed.reloadData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        
        switch segue.identifier {
        case "ProfileScreen":
            let toProfileScreen = segue.destination as! ProfileViewController
                toProfileScreen.user = user
            break
            
        case "FProfileScreen":
            let toProfileScreen = segue.destination as! ProfileViewController
            toProfileScreen.user = sender as! User
            break
            
        default:
            let didOnSideNavi:UINavigationController =  segue.destination as! SideMenuNavigationController
            let didOnMenu = didOnSideNavi.viewControllers[0] as! MenuTableViewController
            didOnMenu.user = user
            
            break

        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           
           return 2
       }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let count = (user == nil || (user?.isEmptyUser() ?? false)) ? 0 : 1
       let countFeeds = (count > 0 && feeds != nil ? feeds?.count : 0) ?? 0
    
    
       switch section {
       case 0: return count
       default: return countFeeds
        
       }
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       switch indexPath.section {
           case 0:
            
            
              let feedcells1 = tableView.dequeueReusableCell(withIdentifier: "feeds01cell", for: indexPath) as! Feed1TableViewCell
              feedcells1.setData(user: user)
              
               return feedcells1
           default:
           
               let feedcells2 = tableView.dequeueReusableCell(withIdentifier: "feeds02cell", for: indexPath) as! Feed2TableViewCell
               let feed = feeds?[indexPath.row]
               feedcells2.setData(feed: feed)
              
               
               return feedcells2
       }
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds?[indexPath.row]
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "ProfileScreen", sender: user)
        case 1:
            performSegue(withIdentifier: "FProfileScreen", sender: feed?.user)
        

        default: break
        }
    }
    
}
