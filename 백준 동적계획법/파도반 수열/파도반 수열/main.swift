//
//  main.swift
//  파도반 수열
//
//  Created by 이정엽 on 2021/02/22.
//

func wave(_ n: Int, _ array: [Int]) {
    var tempArray = array
    var index: Int = 3
    while tempArray.count < n {
        tempArray.append(tempArray[index-3] + tempArray[index-2])
        index += 1
    }
    print(tempArray[index-1])
}

import Foundation

var dpArray: [Int] = [1,1,1]

for _ in 0..<Int(readLine()!)!{
    
    let num: Int = Int(readLine()!)!
    if num <= dpArray.count {
        print(dpArray[num-1])
    } else {
        wave(num, dpArray)
    }
}


