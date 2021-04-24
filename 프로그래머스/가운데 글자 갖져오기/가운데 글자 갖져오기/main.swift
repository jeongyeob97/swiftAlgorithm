//
//  main.swift
//  가운데 글자 갖져오기
//
//  Created by 이정엽 on 2021/04/25.
//

import Foundation

print(solution("abcdxd"))

func solution(_ s:String) -> String {
    let index = s.count / 2
    if s.count % 2 == 0 {
        return String(s[s.index(s.startIndex, offsetBy: index-1)...s.index(s.startIndex, offsetBy: index)])
    } else {
        return String(s[s.index(s.startIndex,offsetBy: index)])
    }
}


