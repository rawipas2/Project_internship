//
//  Feedfacebook.swift
//  Facebook
//
//  Created by mycostech on 18/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation
import UIKit

class Postfacebook: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
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
            return 1
        }
        else {
            return 3
        }
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells01", for: indexPath)
                    return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells02", for: indexPath)
                    return cell
        }
    }
}
