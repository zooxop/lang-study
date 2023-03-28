//
//  ProcessHelper.swift
//  PrivilegedTaskRunnerHelper
//
//  Created by 문철현 on 2023/03/27.
//

import Foundation

struct HelperConstants {
    static let machServiceName = "com.chmun.PrivilegedTaskRunnerHelper"
}

/// Protocol with inter process method invocation methods that ProcessHelper supports
/// Because communication over XPC is asynchronous, all methods in the protocol must have a return type of void
@objc(RemoteProcessProtocol)
protocol RemoteProcessProtocol {
    func getVersion(reply: (String) -> Void)
    func runCommand(path: String, authData: NSData?, reply: @escaping (String) -> Void)
    func runCommand(path: String, reply: @escaping (String) -> Void)
}
