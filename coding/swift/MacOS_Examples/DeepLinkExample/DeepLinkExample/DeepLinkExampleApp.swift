//
//  DeepLinkExampleApp.swift
//  DeepLinkExample
//
//  Created by 문철현 on 2023/06/13.
//

import SwiftUI

@main
struct DeepLinkExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if (url.scheme! == "deep-linker" && url.host! == "share") {
                        if let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true) {
//                            return
                            for query in components.queryItems! {
                                print(query.name)
                                print(query.value!)  // Deeplink 파싱
                            }
                        }
                    }
                    print("URL: \(url.description)")
                }
                .handlesExternalEvents(preferring: ["deep-linker"], allowing: ["*"])
        }
        .handlesExternalEvents(matching: ["deep-linker"])
    }
}
