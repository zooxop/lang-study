//
//  main.swift
//  Test
//
//  Created by 문철현 on 2023/05/22.
//

import Foundation
import EndpointSecurity

var client: OpaquePointer?

// Create the client
let res = es_new_client(&client) { (client, message) in
    // Do processing on the message received
}

if res != ES_NEW_CLIENT_RESULT_SUCCESS {
    exit(EXIT_FAILURE)
}

dispatchMain()
