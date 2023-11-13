//
//  HelperProtocol.swift
//  ExamplePrivilegedHelper
//
//  Created by 문철현 on 11/10/23.
//

import Foundation
import Security

let helperVersion: String = "2"  // `helperBundleInfo["CFBundleVersion"] as? String` 으로 가져오면 $(MARKETING_VERSION) 이런 스트링이 그대로 가져와짐..

@objc(HelperProtocol)
protocol HelperProtocol {
  func getVersion(completion: @escaping (String) -> Void)
  func runCommandLs(withPath: String, completion: @escaping (NSNumber) -> Void)
  func runCommandLs(withPath: String, authData: NSData?, completion: @escaping (NSNumber) -> Void)
}
