## 문제설명

----

집게 위치에 있는 인형을 하나씩 뽑아 바구니로 옮긴다. 그리고 같은 모양의 인행 두 개가 바구니에 연속해서 쌓이게 되면 두 인형은 터지면서 바구니에서 사리지게 된다. 이 때 사라지는 인형의 총 수량을 알아내는 것

## 입력

----

- 인형뽑기 기계 안에 있는 인형들의 상태가 배열로 주어짐
- 집게의 위치가 들어있는 배열

## 출력

---

- 몇 개의 인형이 터졌는지

## 코드

---

```swift
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var tempBoard = board
    var stack: [Int] = []
    var cnt = 0
    for move in moves {
        for idx in 0..<board.count {
          	// 집게가 수직으로 움직이니까
            let tempNum = tempBoard[idx][move-1]
            if tempNum == 0 {
                continue
            } else {
                // 인형을 뽑았기 때문에 0으로 초기화
                tempBoard[idx][move-1] = 0
              	// 바구니가 비었으면 바로 넣어준다
                if stack.count == 0 {
                    stack.append(tempNum)
                } else {
                  	// 바구니 가장 위에 있는 인형과 현재 담으려는 인형이 같을 때
                    if tempNum == stack.last! {
                        cnt += 1
                        stack.popLast()
                    } else {
                        stack.append(tempNum)
                    }
                }
                break
            }
        }
    }
    return cnt*2
}
```

스위프트로 알고리즘 문제를 푸는 게 처음이다 보니 매우 조잡하다. 다른 사람들의 풀이를 보니 더 간략하게 풀 수 있는 방법이 있는 거 같음

## 새로운 문법

---

- forEach

  - for _ in CollectionTypes과 동일하게 각각의 Element들을 호출한다

    > Declaration
    >
    > > ` func forEach(_ body: (Element) throws -> Void) rethrows`
    >
    > Parameters
    >
    > > body 
    > >
    > > - A closure that takes an element of the sequence as a parameter.

  - for Each는 고차함수에 속하기 때문에 break와 continue를 사용할 수 없고 return만 사용 가능하다. return을 통해서 빠져나올 수 있고 일반 반복문의 continue와 같은 역할을 한다.

- enumerated()

  - CollectionType.enumerated()를 사용하면 index와 해당 인덱스의 value를 모두 얻을 수 있다.

