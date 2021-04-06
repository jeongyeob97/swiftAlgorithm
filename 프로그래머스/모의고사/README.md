## 문제

---

수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.

1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5,

1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

## 입력 

---

문제의 답이 있는 정수 배열

## 출력

___

가장 많은 문제를 맞힌 사람

## 코드

____

```swift
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var cnt = Array(repeating: 0, count: 3)
    let first = Array(repeating: [1,2,3,4,5], count: 2000).flatMap{$0}
    let second = Array(repeating: [2,1,2,3,2,4,2,5], count: 1250).flatMap{$0}
    let third = Array(repeating: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5], count: 1000).flatMap{$0}
    
    for (idx, value) in answers.enumerated() {
        if first[idx] == value {
            cnt[0] += 1
        }
        if second[idx] == value {
            cnt[1] += 1
        }
        if third[idx] == value {
            cnt[2] += 1
        }
    }
    
    var answer = [1]
    
    for idx in 1...2 {
        if cnt[idx] == cnt[answer.last!-1] {
            answer.append(idx+1)
        } else if cnt[idx] > cnt[answer.last!-1] {
            answer = [idx+1]
        }
    }
    return answer
}
```

코드가 엄청 더럽다 

굳이 first, second, third 배열을 10000까지 늘릴 필요는 없었지만 어떻게 하는지 몰라서 한번 해볼겸 해봤다

다른 사람들의 코드를 봤는데 코드 짜는 걸 모르는 사람이 봐도 차이가 많이 난다는 것을 느낄 수 있을만큼 코드가 좀 그렇다...

## 새로운 문법

___

- flatmap()

  - Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.

  > Declaration
  >
  > > ` func flatMap<SegmentOfResult>(_ transform: (ExtendedAttribute) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence`
  >
  > transform
  >
  > > - A closure that accepts an element of this sequence as its argument and returns a sequence or collection.

  - flatmap은 배열을 flat하게 만들어주는 역할을 하는 고차함수이다

  - 에) Array(repeating: [2,1,2,3,2,4,2,5], count: 1250).flatMap{$0}

    - 2차 배열의 원소를 엮어서 하나의 큰 1차 배열 완성

      

- CompactMap()

  - Returns an array containing the non-`nil` results of calling the given transformation with each element of this sequence.

  > Declaration
  >
  > > ` func compactMap<ElementOfResult>(_ transform: (ExtendedAttribute) throws -> ElementOfResult?) rethrows -> [ElementOfResult]`
  >
  > transform
  >
  > > A closure that accepts an element of this sequence as its argument and returns an optional value.

  - 1차원 배열에서 nil을 제거, 옵셔널 바인딩을 할 때 사용

    ​	[애플 공홈 예시 링크](https://developer.apple.com/documentation/applearchive/archiveheader/entryxatblob/3588778-compactmap/)

## 쌈박한 코드

---

횟수를 추가하는 딕셔너리 타입의 변수가 point일 때  밑의 코드를 통해서 엄청 쉽게 많은 점수를 딴 사람을 골라낼 수 있다.

```swift
return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }

// dictionary 순서가 없으니까 정렬
print(point.sorted{ $0.key < $1.key}) 
// 정렬하고 value가 max랑 맞는지 비교하고 같은 것만 남김
point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }
// 남긴 것중에서 key만 뽑아서 배열로 반환
point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
```

쩐다