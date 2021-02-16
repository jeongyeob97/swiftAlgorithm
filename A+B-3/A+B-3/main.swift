//
//  main.swift
//  A+B-3
//
//  Created by 이정엽 on 2021/02/16.
//

import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let numArray = readLine()!.split(separator: " ").map{Int($0)!}
    print(numArray.reduce(0, +))
}
