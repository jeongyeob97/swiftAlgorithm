//
//  main.swift
//  3진법 뒤집기
//
//  Created by 이정엽 on 2021/04/13.
//

import Foundation

func solution(_ n:Int) -> Int {
    var num = n
    var sum = 0
    var base3 : [Int] = []
    while num > 0 {
        base3.append(num%3)
        num = num/3
    }
    base3.reverse()
    base3.enumerated().map{
        sum += Int(pow(3.0, Double($0.0))) * $0.1
    }
    return sum
}

print(solution(9))
