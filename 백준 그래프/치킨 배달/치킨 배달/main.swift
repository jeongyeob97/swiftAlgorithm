import Foundation

let tempInput = readLine()!.split(separator: " ").map{Int($0)!}
let total = tempInput[0], limit = tempInput[1]

var chicken: [[Int]] = []
var house:[[Int]] = []

for i in 0..<total {
    for (index, value) in readLine()!.split(separator: " ").map({Int($0)!}).enumerated() {
        if value == 1 {
            chicken.append([i,index])
        } else if value == 2 {
            house.append([i,index])
        }
    }
}

func combination(_ num: Int, _ path: [Int], _ bound: Int, _ index: Int) -> [[Int]] {
    var answer: [[Int]] = []
    if path.count == bound{
        return [path]
    }
    for i in index..<num {
        answer += combination(num, path+[i], bound, i+1)
    }
    return answer
}

let cases = combination(chicken.count, [], limit, 0)

var minimum: Int = Int(10e3)

for i in cases{
    var cnt: Int = 0
    for j in house {
        var temp: Int = Int(10e3)
        for x in i {
            temp = min((abs(chicken[x][0]-j[0]) + abs(chicken[x][1]-j[1])),temp)
        }
        cnt += temp
    }
    minimum = min(cnt,minimum)
}

print(Int(minimum))
