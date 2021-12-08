//
//  main.swift
//  튜플
//
//  Created by apple on 2021/12/08.
//

import Foundation

func solution(_ s:String) -> [Int] {
    let tuples = returnOrderList(s)
    var answer:[Int] = []
    tuples.reduce(Set<Int>()) {
        answer.append(Array($1.subtracting($0))[0])
        return $1
    }
    return answer
}

func returnOrderList(_ s: String) -> [Set<Int>]{
    let startIndex = s.index(s.startIndex, offsetBy: 1)
    let endIndex = s.index(s.endIndex, offsetBy: -1)
    let text = s[startIndex..<endIndex].replacingOccurrences(of: "}", with: "").replacingOccurrences(of: ",{", with: "|").replacingOccurrences(of: "{", with: "")

    return text.split(separator: "|")
        .map { arr in
        arr.split(separator: ",").map {
                Int(String($0))!
            }
        }
        .sorted { a, b in
            a.count < b.count
        }
        .map { Set($0) }
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
print(solution("{{20,111},{111}}"))
print(solution("{{123}}"))
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
