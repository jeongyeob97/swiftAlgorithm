//
//  main.swift
//  예산
//
//  Created by 이정엽 on 2021/04/25.
//

import Foundation

print(solution([2,2,3,3], 10))

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sortedD = d.sorted()
    var total: Int = 0
    for (index, value) in sortedD.enumerated() {
        total += value
        if total > budget{
            return index
        }
    }
    return d.count
}
