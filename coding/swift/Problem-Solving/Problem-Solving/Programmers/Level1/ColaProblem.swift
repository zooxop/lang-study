//
//  ColaProblem.swift
//  Problem-Solving
//
//  Created by 문철현 on 3/10/24.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
  var fund = n
  var rest = 0
  var result = 0
  
  while fund > a {
    result += (fund / a) * b
    if fund % a != 0 {
      rest += fund % a
    }
    
    fund = fund / a
    
    if rest > 0 {
      fund = fund + rest
      rest = 0
    }
  }
  
  return result
}

/*
 a  b  n  result
 2  1  20  19
 3  1  20  9
 */
