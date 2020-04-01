//
//  Closure.swift
//  TestProject
//
//  Created by Rawipas Samoondee on 27/3/2563 BE.
//  Copyright © 2563 mycostech. All rights reserved.
//

import Foundation

class Closure {
    
    let x = 10
    let y = 20
    var result = 0
    
    func start() {
        
        calculate {
            
            result = x + y
        }
        
        calculate2 {
            
            self.result = self.x + self.y
        }
    }
    
    //non-escaped closure
    func calculate(equation: () -> ()) {
        
            
            
            equation()
            
            result = result * 10
            print(result)
            
    }
    
    //escaped closure
    func calculate2(equation: @escaping () -> ()) {
        
            
            
            equation()
            
            result = result * 10
            print(result)
            
        
    }
}
