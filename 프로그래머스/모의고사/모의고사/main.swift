//
//  main.swift
//  모의고사
//
//  Created by 이정엽 on 2021/04/06.
//

import Foundation

print("Hello, World!")

func solution(_ answers:[Int]) -> [Int] {
    var cnt = Array(repeating: 0, count: 3)
    let first = Array(repeating: [1,2,3,4,5], count: 2000).flatMap{$0}
    let second = Array(repeating: [2,1,2,3,2,4,2,5], count: 1250).flatMap{$0}
    let third = Array(repeating: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5], count: 1000).flatMap{$0}
    
    for (idx, value) in answers.enumerated() {
        if first[idx] == value {
            cnt[0] += 1
        }
        if second[idx] == value {
            cnt[1] += 1
        }
        if third[idx] == value {
            cnt[2] += 1
        }
    }
    
    var answer = [1]
    
    for idx in 1...2 {
        if cnt[idx] == cnt[answer.last!-1] {
            answer.append(idx+1)
        } else if cnt[idx] > cnt[answer.last!-1] {
            answer = [idx+1]
        }
    }
    return answer
}

solution([1,3,2,4,2])
