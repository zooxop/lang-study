// 1. [main.swift] 파일에서 문제 풀이.
// 2. 풀이 완료 후, BOJ 또는 Programmers 폴더에 새로운 파일을 생성하여 코드 이관.
// 3. 2번 작업 완료 후 [main.swift]의 코드를 아래 코드로 변경.

//import Foundation
//print("Hello, World!")

import Foundation

func mainFunc(_ a:Int, _ b:Int, _ n:Int) -> Int {
  var fund = n
  var rest = 0
  var result = 0
  
  while fund >= a {
    result += (fund / a) * b
    if fund % a != 0 {
      rest += fund % a
    }
    
    fund = (fund / a) * b
    
    if rest > 0 {
      fund = fund + rest
      rest = 0
    }
  }
  
  return result
}

print("output : \(mainFunc(2, 1, 20))")
print("output : \(mainFunc(3, 1, 20))")
print("output : \(mainFunc(999999, 4, 999999))")
print("output : \(mainFunc(3, 2, 20))")

/*
 a  b  n  result
 2  1  20  19
 3  1  20  9
 */
