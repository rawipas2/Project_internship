//
//  MenuTableViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 29/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    var user:User?
//    var setting_data:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableregister()
//        tableheader()
//        tablefooter()
//
//
//
//        let path = Bundle.main.path(forResource: "SettingMenu", ofType: "plist")!
//        let dict = NSDictionary(contentsOfFile: path)
//        setting_data = dict!.object(forKey: "SettingMenu") as! [String]
//
//
    }

    // MARK: - Table view data source
    func tableregister(){
        tableview.register(UINib(nibName: "MenuProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "menu_profile")
        tableview.register(UINib(nibName: "SideMenuArrayTableViewCell", bundle: nil), forCellReuseIdentifier: "SidemenuArray")
        tableview.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Sidemenu")
    }
    
//    func tableheader(){
//         let headerview = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
//         tableview.tableHeaderView = headerview
//         tableview.tableHeaderView?.backgroundColor = .red
//         
//    }
    
//    func tablefooter(){
//        let footerview = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
//        tableview.tableFooterView = footerview
//        tableview.tableFooterView?.backgroundColor = .red
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let footerview = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
//        footerview.backgroundColor = .red
//        return footerview
//    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "menu_profile", for: indexPath) as! MenuProfileTableViewCell
            cell.setData(user: user)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuArray", for: indexPath) as! SideMenuArrayTableViewCell
            cell.setData(Menu: "Settings")
            return cell
           
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sidemenu", for: indexPath) as! SideMenuTableViewCell
            cell.setData(Menu: "Log Out")
            cell.menu.textAlignment = NSTextAlignment.center
           
            return cell
            
        default:
             let cell = tableView.dequeueReusableCell(withIdentifier: "Sidemenu", for: indexPath) as! SideMenuTableViewCell
             return cell
        }
            

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sideprofile":
            let toProfileScreen = segue.destination as! ProfileViewController
            toProfileScreen.user = sender as? User
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "sideprofile", sender: user)
        case 1:
            performSegue(withIdentifier: "sidesetting", sender: user)
        case 2:
            performSegue(withIdentifier: "sidelogout", sender: nil)
            
        default:
            break
        }
    }
    
}

