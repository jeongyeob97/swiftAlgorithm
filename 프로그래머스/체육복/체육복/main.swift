//
//  main.swift
//  체육복
//
//  Created by 이정엽 on 2021/04/08.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var studentArray = [Int].init(repeating: 1, count: n+1)
    var cnt = n-lost.count
    let common = Set(lost).intersection(Set(reserve))
    let reserved = Array(Set(reserve).subtracting(Set(lost))).sorted()

    lost.forEach{
        studentArray[$0] = 0
    }
    common.forEach{ (num) in
        studentArray[num] = 1
        cnt += 1
    }
  
    reserved.forEach { (num) in
        if studentArray[num-1] == 0 {
            studentArray[num-1] = 1
            cnt += 1
        } else if num+1 <= n && studentArray[num+1] == 0 {
            studentArray[num+1] = 1
            cnt += 1
        }
    }
    return cnt
}



print(solution(5,[2,4],[1,3,5]))
