//
//  AppProtocol.swift
//  LaunchdExample
//
//  Created by 문철현 on 11/10/23.
//

import Foundation

@objc(AppProtocol)
protocol AppProtocol {
  func log(stdOut: String) -> Void
  func log(stdErr: String) -> Void
}
