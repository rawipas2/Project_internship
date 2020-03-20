//
//  Profilefacebook.swift
//  Facebook
//
//  Created by mycostech on 18/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit

class Profilefacebook: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return 3
        case 4 :
            return Friends.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells01", for: indexPath)
                   return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells02", for: indexPath)
                   return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells03", for: indexPath)
                   return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells04", for: indexPath) as! FriendListTableViewCell
            cell.initFriendListTableViewCell()
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells05", for: indexPath)
            return cell
        }
    }
}
