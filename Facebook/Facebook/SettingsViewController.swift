//
//  SettingsViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 3/5/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var table: UITableView!
    
    var settings_data:[String]?
    var settings_data_bool:[Bool]?
    var data:[String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settings_data =  getArrayPlist(file: "SettingMenu", name: "SettingMenu")
        settings_data_bool = [getBoolPlist(file: "SettingMenu", name: "Night Mode")]
        data = getData(file: "SettingMenu")
        print(data)
        tableregister()
    }
    
    func getData(file:String?) -> [String:Any]?{
        let path = Bundle.main.path(forResource: file, ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        
        return dict as! [String:Any]?
    }
    
    func getArrayPlist(file:String?, name:String? ) -> [String]?{
        
        let path = Bundle.main.path(forResource: file, ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        let value = dict!.object(forKey: name!) as! [String]
        
        return value
    }
    
    func getBoolPlist(file:String?, name:String?) -> Bool{
        
        let path = Bundle.main.path(forResource: file, ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        let value:Bool = dict?[name!] as! Bool
        return value
    }
    
    func tableregister(){
        table.register(UINib(nibName: "SideMenuSwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SidemenuSwitch")
        table.register(UINib(nibName: "SideMenuArrayTableViewCell", bundle: nil), forCellReuseIdentifier: "SidemenuArray")
        table.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Sidemenu")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count:Int =  /*(settings_data!.count) +*/ (settings_data_bool!.count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if ((data?.index(forKey: "Night Mode")) != nil) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuSwitch", for: indexPath) as! SideMenuSwitchTableViewCell
            cell.setData(Menu: settings_data?[indexPath.row], Value: false)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sidemenu", for: indexPath) as! SideMenuTableViewCell
            cell.setData(Menu: "nil")
            return cell
        }
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
