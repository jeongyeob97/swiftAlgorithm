## 문제

---

자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.

## 입력

---

n은 1 이상 100,000,000 이하인 자연수입니다.

## 출력 

---

n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수

## 입출력 예시

---

| n    | result |
| ---- | ------ |
| 45   | 7      |

| 10진법 | 3진법 | 앞뒤 반전 3진법 | 10진법으로 표현 |
| ------ | ----- | --------------- | --------------- |
| 45     | 1200  | 0021            | 7               |

## 코드

---

```swift
func solution(_ n:Int) -> Int {
    var num = n
    var sum = 0
    var base3 : [Int] = []
    while num > 0 {
        base3.append(num%3)
        num = num/3
    }
    base3.reverse()
    base3.enumerated().map{
        sum += Int(pow(3.0, Double($0.0))) * $0.1
    }
    return sum
}
```



## 새로 배운 문법

---

```swift
Int(String, radix = 원하는 진수 수)
let b2 = "10110"
let d2 = Int(b2, radix: 2)!// 를 통해 b2의 문자열이 2진수라는 것을 명시하고 그에 대한 decimal 값을 얻을 수 있다

String(decimal, radix = 원하는 진수 수)
let d3 = 61
let h1 = String(d3, radix: 16) // 를 통해 데시멀을 해당 진수로 바꾼 문자열을 얻는 다는 뜻

// String일 때는 Decimal을 해당 진수로 바꾼 값을 얻는 것
// Int은 String 값이 해당 진수값이라는 것을 명시하게 이에 대한 Decimal 값을 얻는 것





```

