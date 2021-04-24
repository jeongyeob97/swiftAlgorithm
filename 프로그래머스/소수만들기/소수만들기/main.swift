//
//  main.swift
//  소수만들기
//
//  Created by 이정엽 on 2021/04/25.
//

import Foundation

print(solution([1,2,3,4]))

func solution(_ nums:[Int]) -> Int {
    let answer = combination(nums, 0, 0, 0)
    return answer
}

func combination(_ nums:[Int], _ index: Int, _ count: Int, _ sum: Int) -> Int {
    if count == 3 {
        return findPrime(sum)
    }
    var varIndex = index
    var total: Int = 0
    for i in index..<nums.count {
        varIndex += 1
        total += combination(nums, varIndex, count + 1, sum+nums[i])
    }
    return total
}

func findPrime(_ num: Int) -> Int {

    for i in 2..<num {
        if num%i == 0 {
            return 0
        }
    }
    return 1
}
