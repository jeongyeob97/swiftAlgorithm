//
//  main.swift
//  내적
//
//  Created by 이정엽 on 2021/05/16.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {

    return a.enumerated().map{
        $0.1 * b[$0.0]
    }.reduce(0, +)
}

print(solution([1,2,3,4], [-3,-1,0,2]))


