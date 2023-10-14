//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by 문철현 on 2023/10/11.
//

import Foundation

struct CenterAPIResponse: Decodable {
  let data: [Center]
}
