//
//  main.swift
//  K번째수
//
//  Created by 이정엽 on 2021/04/13.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    commands.forEach{
        let tempArray = array[($0[0]-1)...($0[1]-1)]
        answer.append(tempArray.sorted()[$0[2]-1])
    }
    return answer
}
//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    return commands.map{
//        return array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1]
//    }
//}


print(solution([1, 5, 2, 6, 3, 7, 4],[[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
