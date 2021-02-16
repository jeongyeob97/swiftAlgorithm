//
//  main.swift
//  A+B
//
//  Created by 이정엽 on 2021/02/16.
//

import Foundation

let a = readLine()!.split(separator: " ").map{Int($0)!}
print(a.reduce(0, +))


