## 문제

---

점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.

전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

## 입력

---

| n       | lost               | reserve                    |
| ------- | ------------------ | -------------------------- |
| 학생 수 | 잃어버린 학생 배열 | 여벌을 갖고 있는 학생 배열 |



## 출력

----

체육수업을 들을 수 있는 학생의 최댓값

## 코드

---

```swift
import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var studentArray = [Int].init(repeating: 1, count: n+1)
    var cnt = n-lost.count
    let common = Set(lost).intersection(Set(reserve))
    let reserved = Array(Set(reserve).subtracting(Set(lost))).sorted()

    lost.forEach{
        studentArray[$0] = 0
    }
    common.forEach{ (num) in
        studentArray[num] = 1
        cnt += 1
    }
  
    reserved.forEach { (num) in
        if studentArray[num-1] == 0 {
            studentArray[num-1] = 1
            cnt += 1
        } else if num+1 <= n && studentArray[num+1] == 0 {
            studentArray[num+1] = 1
            cnt += 1
        }
    }
    return cnt
}
```

