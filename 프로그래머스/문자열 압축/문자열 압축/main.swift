//
//  main.swift
//  문자열 압축
//
//  Created by apple on 2021/12/01.
//

import Foundation
//
func solution(_ s:String) -> Int {
    var answer = s.count

    for index in 1..<s.count {
        answer = min(zipString(s, index), answer)
    }
    return answer
}

func zipString(_ s: String, _ interval: Int) -> Int {
    var count = 0
    var duplicateCount = 0
    for index in stride(from: 0, to: s.count, by: interval) {
        if s.count <  index + interval * 2 {
            let startIndex = s.index(s.startIndex, offsetBy: index)
            count += duplicateCount == 0 ? s[startIndex...].count : "\(duplicateCount + 1)".count + s[startIndex...].count
            break
        }
        if compareString(s, index, interval) {
            duplicateCount += 1
            continue
        }
        count += duplicateCount == 0 ? interval : "\(duplicateCount + 1)".count + interval
        duplicateCount = 0
    }

    return count
}

func compareString(_ s: String, _ index: Int, _ interval: Int) -> Bool {
    let startIndex = s.index(s.startIndex, offsetBy: index)
    let endIndex = s.index(s.startIndex, offsetBy: index + interval)
    let nextEndIndex = s.index(s.startIndex, offsetBy: index + interval + interval)

    return s[startIndex..<endIndex] == s[endIndex..<nextEndIndex]
}


print(solution("aabbaccc"))
print(solution("ababcdcdababcdcd"))
print(solution("abcabcdede"))
print(solution("abcabcabcabcdededededede"))
print(solution("xababcdcdababcdcd"))
