//
//  main.swift
//  크레인 인형뽑기 게임
//
//  Created by 이정엽 on 2021/04/05.
//

import Foundation

let board: [[Int]] = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let move: [Int] = [1,5,3,5,1,2,1,4]


func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var tempBoard = board
    var previous: [Int] = []
    var cnt = 0
    for move in moves {
        for idx in 0..<board.count {
            let tempNum = tempBoard[idx][move-1]
            if tempNum == 0 {
                continue
            } else {
                tempBoard[idx][move-1] = 0
                if previous.count == 0 {
                    previous.append(tempNum)
                } else {
                    if tempNum == previous.last! {
                        cnt += 1
                        previous.popLast()
                    } else {
                        previous.append(tempNum)
                    }
                }
                break
            }
        }
    }
    return cnt*2
}

print(solution(board, move))
