//
//  Feedfacebook.swift
//  Facebook
//
//  Created by mycostech on 18/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation
import UIKit

class Postfacebook: UIViewController, UITableViewDataSource, UITableViewDelegate, MySelfsDelegate {
    
    func didTapOnProfileButton() {
        //
        
        performSegue(withIdentifier: "SegueToProfileFacebookView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(x)
    }
    
    @objc func tap() {
        
        view.endEditing(true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            print("HHH")
            return 1
        }
        else {
            return Friends.count
        }
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            let Me = MySelf
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells01", for: indexPath) as! Myselfs
            cell.delegate = self
            cell.ImageProfile?.image = UIImage(named: Me["image"] ?? "")
                    return cell
        }
        else {
            let Friend = Friends[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells02", for: indexPath) as! MyFriendPost
            cell.ImageProfile?.image = UIImage(named: Friend["image"] as! String )
            cell.Name?.text = Friend["name"] as? String
            cell.Des?.text = Friend["Des"] as? String
            cell.Time?.text = "\(Friend["time"] ?? "") s"
                    return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


