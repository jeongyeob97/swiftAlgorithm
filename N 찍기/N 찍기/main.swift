//
//  main.swift
//  N 찍기
//
//  Created by 이정엽 on 2021/02/17.
//

import Foundation

let n: Int = Int(readLine()!)!
var answer: String = String()

for i in (1...n).reversed() {
    answer += "\(i)\n"
}
print(answer)
