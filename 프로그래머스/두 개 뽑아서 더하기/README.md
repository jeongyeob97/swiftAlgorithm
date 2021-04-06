## 문제

---

numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.

## 입력

---

2이상 100이하의 길이를 가진 정수 배열

## 출력

---

배열 요소로 만들 수 있는 모든 수

## 코드

---

```swift
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
```

중복되는 값은 필요 없기 때문에 Set로 문제 해결

