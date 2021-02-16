//
//  main.swift
//  2007년
//
//  Created by 이정엽 on 2021/02/17.
//

import Foundation

let temp = readLine()!.split(separator: " ").map{Int($0)!}

let weekday: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]

let m = temp[0]
let d = temp[1]

var startM: Int = 1

var days: Int = 0

while startM < m  {
    
    switch startM {
    
    case 1,3,5,7,8,10,12:
        days += 3
        
    case 2:
        days += 28
        
    default:
        days += 30
    }
    startM+=1
}

print(weekday[(days+d)%7])

