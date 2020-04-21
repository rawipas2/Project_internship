//
//  LoginViewController.swift
//  Facebook
//
//  Created by Rawipas Samoondee on 9/4/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class LoginViewController: UIViewController {

    var user: User?
   
    public static var shouldGoBackToMainRoot = false;
    
//    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var t_username: UITextField!
    @IBOutlet weak var t_password: UITextField!
    @IBOutlet weak var alet: UILabel!
    
    @IBAction func bt_login(_ sender: Any) {
        login(username: t_username.text ?? "", password: t_password.text ?? "")
//        if user?.login?.username == t_username.text && user?.login?.password == t_password.text {
//
//
//
//
//
//        }
//        else {
//            alet.text = "An error occurred."
//            t_username.text = nil
//            t_password.text = nil
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        user = User(JSON: UserAccountData["results"] as! [String : Any])
        
//        AF.request("http://localhost:5000/api/users/1").responseJSON {
//
//            switch $0.result {
//            case .success(let value):
////                print(JSON)
//                let json = JSON(value).dictionary?["results"]?.arrayObject?.first
//                self.user = User(JSON: json as! [String : Any])
//                //let json:[String:Any] = value as! [String:Any]
////                let data =  //json.filter { $0.key == "results" }.map { $0.value }
////                self.user =
////                self.user = User(JSON: (value as! [String : Any]).filter({ (e) -> Bool in
////                    e.key == "results"
////                }).first!.value as! [String : Any])
//                break
//            default: print("error")
//                break
//            }
//        }
//
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LoginViewController.shouldGoBackToMainRoot = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        sleep(3)
//        indicatorLoading.stopAnimating()

        let didOnTabbar:UITabBarController = segue.destination as! UITabBarController
        let didOnNavi:UINavigationController = didOnTabbar.viewControllers?[0] as! UINavigationController
        let didOnFeed = didOnNavi.viewControllers[0] as! FeedViewController
//        let didOnFeed = didOnTabbar.viewControllers?[0] as! FeedViewController
        didOnFeed.user = user
        
        
        
        
    }
    func login(username:String, password:String){
        let path = "http://localhost:5000/api/users/login/" + username + "/" + password
        AF.request(path).responseJSON {
            switch $0.result {
            case .success(let value):
                let json = JSON(value).dictionaryObject
                self.user = User(JSON: json!)
                self.performSegue(withIdentifier: "LoginSuccess", sender: nil)
                break
            case .failure(let error):
                print(error)
                self.alet.text = error.localizedDescription ?? "Invalid"
                break
            }
        }
    }
    
}
