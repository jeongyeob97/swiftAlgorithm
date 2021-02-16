//
//  main.swift
//  숫자의 합
//
//  Created by 이정엽 on 2021/02/16.
//

import Foundation

readLine()
let a = Array(readLine()!).map{ Int(String($0))! }
print(a.reduce(0, +))
