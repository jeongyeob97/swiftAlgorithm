//
//  main.swift
//  메뉴 리뉴얼
//
//  Created by apple on 2021/12/07.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    let available = getCombinations(orders, course)
    let x = countAvailable(available)


    return getMaximum(x, course)
}

func getMaximum(_ countDict: [String: Int], _ course: [Int]) -> [String] {
    var answer: [String] = []
    course.forEach { count in
        let temp = countDict.filter { $0.key.count == count}
        let maximum = temp.values.max()
        guard let maximum = maximum,
              maximum >= 2 else {
            return
        }
        answer += temp.filter { $0.value == maximum }
        .map{ $0.key }
    }

    return answer.sorted()
}

func getCombinations(_ orders: [String], _ course: [Int]) -> [String] {
    var combinations: [String] = []
    for order in orders {
        combinations += recurCombination(order, 0, "", course: course)
    }
    return combinations
}

func recurCombination(_ order: String, _ index: Int, _ text: String, course: [Int]) -> [String] {
    var temp: [String] = []
    if text.count >= course.max()! || index >= order.count {
        return []
    }

    for idx in (index..<order.count) {
        let tempText = (text + order.getCharacter(idx)).getOrderedString()

        if course.contains(tempText.count) {
            temp += [tempText] + recurCombination(order, idx+1, tempText, course: course)
        } else {
            temp += recurCombination(order, idx+1, tempText, course: course)
        }
    }
    return temp
}

func countAvailable(_ candidates: [String]) -> [String: Int] {
    var tempDict: [String: Int] = [:]
    for candidate in candidates {
        tempDict[candidate, default: 0] += 1
    }

    return tempDict.filter { $0.value >= 2 }
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))

print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))

print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))

extension String {
    func getCharacter(_ index: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: index)
        return String(self[index])
    }

    func getOrderedString() -> String {
        return self.sorted().map{ String($0)}.joined()
    }
}
