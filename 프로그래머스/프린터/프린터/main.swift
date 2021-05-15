//
//  main.swift
//  프린터
//
//  Created by 이정엽 on 2021/05/16.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var array = [Int](repeating: 0, count: priorities.count)
    array[location] = 1
    
    var temp_priorities = priorities
    var maximum = temp_priorities.max()!
    var cnt = 0
    while temp_priorities.count > 0 {
       
        let value = temp_priorities.removeFirst()
        let loca = array.removeFirst()
        if value < maximum {
            temp_priorities.append(value)
            array.append(loca)
        } else {
            cnt += 1
            if loca == 1 {
              break
            } else {
                maximum = temp_priorities.max()!
            }
        }
    }
    return cnt
}

print(solution([1, 1, 9, 1, 1, 1],0))
print(solution([2, 1, 3, 2],2))
