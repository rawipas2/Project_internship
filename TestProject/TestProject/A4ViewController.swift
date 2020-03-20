//
//  A4ViewController.swift
//  TestProject
//
//  Created by mycostech on 19/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation
import UIKit

class A4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        dismiss2(animated: true) {
            
            let a = 0
            let b = 2
            let c = a + b
        }
    }
    
    func dismiss2(animated: Bool, completion: () -> ()) {
        
        completion()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func didTapOnToA1Button(_ sender: Any) {
        
//        self.navigationController?.popViewController(animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
        let x = self.navigationController!.viewControllers[1]
        self.navigationController?.popToViewController(x, animated: true)
        
    }
    
    @IBAction func didTapOnToB1Button(_ sender: Any) {
            
//            performSegue(withIdentifier: "SegueToB1", sender: nil)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}





























class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 2
    }
}
