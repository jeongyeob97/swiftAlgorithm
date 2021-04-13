 

## 문제

---

배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.

예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

1. array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
2. 1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
3. 2에서 나온 배열의 3번째 숫자는 5입니다.

배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

## 입력

___

| Array                 | Commands                          |
| --------------------- | --------------------------------- |
| [1, 5, 2, 6, 3, 7, 4] | [[2, 5, 3], [4, 4, 1], [1, 7, 3]] |

## 출력

___

[5, 6, 3]

## 코드 

___

```swift
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
  	// forEach를 통해 원소를 하나씩 빼온다
    commands.forEach{
        let tempArray = array[($0[0]-1)...($0[1]-1)]
        answer.append(tempArray.sorted()[$0[2]-1])
    }
    return answer
}
```

## 참고할 코드

```swift
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
  	// commands 배열의 원소를 하나씩 빼서 사용하는 것이기 때문에 map을 이용해서 수월하게 할 수 있다. 
  	// 코드가 훨씬 간략해졌다
    return commands.map{
        return array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1]
    }
}
```

