//
//  HelperContents.swift
//  ExamplePrivilegedHelper
//
//  Created by 문철현 on 11/10/23.
//

import Foundation

let kAuthorizationRightKeyClass     = "class"
let kAuthorizationRightKeyGroup     = "group"
let kAuthorizationRightKeyRule      = "rule"
let kAuthorizationRightKeyTimeout   = "timeout"
let kAuthorizationRightKeyVersion   = "version"

let kAuthorizationFailedExitCode    = NSNumber(value: 503340)

struct HelperConstants {
  static let machServiceName = "com.chmun.LaunchdExample.PrivilegedHelper"
}
