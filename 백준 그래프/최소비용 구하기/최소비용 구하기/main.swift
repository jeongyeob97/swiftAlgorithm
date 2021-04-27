import Foundation

let cities: Int = Int(readLine()!)!
let buses: Int = Int(readLine()!)!

var answer: [Float] = [Float](repeating: .infinity, count: cities)
var graph:[Int:[[Int]]] = [Int:[[Int]]]()

for _ in 0..<buses {
    let inputValue = readLine()?.split(separator: " ").map{Int($0)!}
    let start = inputValue![0]-1, end = inputValue![1]-1, cost = inputValue![2]
    if graph[start] == nil {
        graph[start] = [[end,cost]]
    }else{
        graph[start]!.append([end,cost])
    }
}

var destination = readLine()?.split(separator: " ").map{Int($0)!}
destination![0] -= 1
destination![1] -= 1
answer[destination![0]] = 0

var path: [Int] = [destination![0]]

while path.count > 0 {
    let node = path.removeFirst()
    if node == destination![1] {
        continue
    }
    graph[node]?.forEach {
        if answer[$0[0]] > answer[node] + Float($0[1]) {
            answer[$0[0]] = answer[node] + Float($0[1])
            path.append($0[0])
        }
    }
}

print(Int(answer[destination![1]]))
