//
//  ContentView.swift
//  CertificateInstaller
//
//  Created by 문철현 on 2023/05/22.
//

import SwiftUI

struct ContentView: View {
    let certManager: CertManager = CertManager()
    var body: some View {
        VStack {
            Button("isCertInstalled") {
                Task {
                    await certManager.isCertInstalled()
                }
            }
            
            Button("tryCertInstall") {
                let err = certManager.tryCertInstall()
                if err != nil {
                    let _ = "\(err!.localizedDescription) / \((err as NSError?)?.userInfo["msg"] as? String ?? "")"
                    print(err!)
                }
            }
            
            Button("tryCertTrusted") {
                let err = certManager.changeRootCertificateTrustSettings()
                if err != nil {
                    print(err!)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 400, height: 400)
    }
}
