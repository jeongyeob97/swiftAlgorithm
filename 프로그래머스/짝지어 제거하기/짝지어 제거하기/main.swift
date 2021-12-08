//
//  main.swift
//  짝지어 제거하기
//
//  Created by apple on 2021/12/08.
//

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var stack: [Character] = []

    for text in s {
        if stack.isEmpty {
            stack.append(text)
        } else if stack.last! == text {
            stack.popLast()
        } else {
            stack.append(text)
        }
    }

    answer = stack.isEmpty ? 1 : 0

    return answer
}


print(solution("baabaa"))
print(solution("cdcd"))
