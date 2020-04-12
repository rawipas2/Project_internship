//
//  ProfileViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 4/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user:User?
//    var friend:[Friend]?
    @IBOutlet weak var tableProfile: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (user?.userId ?? 0) > 0 {
            perform(#selector(loadUser), with: nil, afterDelay: 0)
            
        }
    }
    @objc func loadUser(){
        //load API get by user id
        user = User(JSON: UserAccountData["results"] as! [String : Any])
//        let path = "http://localhost:5000/api/users/" + String(user?.userId ?? 0)
//        AF.request(path).responseJSON {
//            print($0.value)
//            switch response.value {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error)
//            }
//        }
        tableProfile.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (user == nil || (user?.isEmptyUser() ?? false)) ? 0 : 1
        let countFriends = (count > 0 && user?.friends != nil ? user?.friends?.count : 0) ?? 0
//        if user != nil {
//            count = 1
//        }
//        if user != nil && user?.friends != nil {
//            count = user?.friends?.count
//        }
        switch section {
        case 0: return count
        case 1: return count
        case 2: return count
        case 3: return count
        case 4: return countFriends
            
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
            case 0:
                let profile1 = tableView.dequeueReusableCell(withIdentifier: "Profilecells01", for: indexPath) as! ProfileCell1TableViewCell
                profile1.imageName = user?.picture?.large
                profile1.p_name?.text = user?.name?.fullname
                profile1.p_description?.text = user?.email
                profile1.bg_image?.image = UIImage(named: "")
                
                if profile1.imageName != nil {
                    perform(#selector(getimage(cell:)), with: profile1, afterDelay: 0)
                }
                return profile1
            case 1:
                let profile2 = tableView.dequeueReusableCell(withIdentifier: "Profilecells02", for: indexPath) as! ProfileCell2TableViewCell
                return profile2
            case 2:
                let profile2 = tableView.dequeueReusableCell(withIdentifier: "Profilecells03", for: indexPath) as! ProfileCell3TableViewCell
                return profile2
            case 3:
                let profile3 = tableView.dequeueReusableCell(withIdentifier: "Profilecells04", for: indexPath) as! ProfileCell4TableViewCell
                profile3.initFcollectionViewCell()
                return profile3
            default:
                let profile4 = tableView.dequeueReusableCell(withIdentifier: "Profilecells05", for: indexPath) as! ProfileCell5TableViewCell
                return profile4
        }
    }

    @objc func getimage(cell: ProfileCell1TableViewCell) {
        let name:String! = cell.imageName
        AF.request(name).responseImage{
            if let images = $0.value {
                cell.p_image?.image = images
            }
        }
        
    }
    
    

}
