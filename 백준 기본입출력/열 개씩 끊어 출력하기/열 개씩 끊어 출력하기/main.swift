//
//  main.swift
//  열 개씩 끊어 출력하기
//
//  Created by 이정엽 on 2021/02/16.
//

import Foundation

let a = readLine()!

var start: String.IndexDistance = 0
var last: String.IndexDistance = 10

for _ in 0..<(a.count/10) {
    let startIndex = a.index(a.startIndex, offsetBy: start)
    let endIndex = a.index(a.startIndex, offsetBy: last)
    print(a[startIndex..<endIndex])
    start += 10
    last += 10
}
let startIndex = a.index(a.startIndex, offsetBy: start)
print(a[startIndex..<a.endIndex])
