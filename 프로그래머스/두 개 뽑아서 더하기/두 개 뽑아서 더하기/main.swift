import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var container = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            container.insert(numbers[i] + numbers[j])
        }
    }
    let answer = Array(container).sorted()
    return answer
}

print(solution([1,4,3,4,3,6]))
