//
//  main.swift
//  최소, 최대
//
//  Created by 이정엽 on 2021/02/17.
//

import Foundation

readLine()

var maximum: Int = 0
var minimum: Int = 100

for i in readLine()!.split(separator: " ") {
    let num = Int(i)!
    
    maximum = num > maximum ? num:maximum
    minimum = num < minimum ? num:minimum
}

print(minimum, maximum)


