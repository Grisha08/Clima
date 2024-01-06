//
//  test.swift
//  Clima
//
//  Created by Grisha Borodavka on 09/12/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation



func calculate (n1:Int,n2:Int,operation:(Int, Int) -> Int ) -> Int{
    
    return operation(n1,n2)
    
    
}
//{ (no1:Int,no2:Int)->Int in
  //  return no1 + no2
//}
var b = calculate(n1: 2, n2: 3) {$0 + $1}


let array = [1,3,5,6,6]

//func plucOne (n1) {$0 + 1}

let c = array.map({$0 + 1})


