

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer: [Int] = []
    arr.forEach {
        if $0 % divisor == 0 {
            answer.append($0)
        }
    }
    return answer.count==0 ? [-1] : answer.sorted()
}
