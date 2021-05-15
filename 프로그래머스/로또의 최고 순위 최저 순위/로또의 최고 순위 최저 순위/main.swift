//
//  main.swift
//  로또의 최고 순위 최저 순위
//
//  Created by 이정엽 on 2021/05/16.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zero: Int = 0
    var same: Int = 0
    lottos.forEach{
        if $0 == 0 {
            zero += 1
        } else if win_nums.contains($0){
            same += 1
        }
    }
    return [ rank(same + zero),rank(same)]
}

func rank(_ num: Int) -> Int{
    if num <= 1 {
        return 6
    } else {
        return 7-num
    }
}
print(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))

