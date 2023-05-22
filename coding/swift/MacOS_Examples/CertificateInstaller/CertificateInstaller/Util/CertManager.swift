//
//  CertManager.swift
//  CertificateInstaller
//
//  Created by 문철현 on 2023/05/22.
//

import Foundation
import Security

class CertManager: NSObject, FileIOManagerInjector {
    public var certificateName: String = ""
    
    /// 인증서 설치 여부 검사
    public func isCertInstalled() async -> Bool? {
        do {
            // SDP에서 내려받은 인증서를 SecCertificate 객체로 변환.
            let certPath = fileIOManager.certPath
            let data = try Data(contentsOf: certPath)
            
            guard let certificate = readCertFromPem(data: data) else {
                print("Failed to read certificate file.")
                return nil
            }
            // 가져온 인증서의 Cname 받아오기
            certificateName = getCertCommonName(cert: certificate) ?? ""
        
            // 인증서 설치 확인에 필요한 변수들. Apple 공식 사이트에서 찾아옴.
            let certArray: [SecCertificate] = [certificate]
            let policy = SecPolicyCreateBasicX509()
            var optionalTrust: SecTrust?
            let status = SecTrustCreateWithCertificates(certArray as AnyObject, policy, &optionalTrust)
            
            guard status == errSecSuccess else {
                print("get Status is failed.")
                return nil
            }
            guard let trust = optionalTrust else {
                print("unwrap OptionalTrust is failed.")
                return nil
            }
            
            if status == errSecSuccess {
                let copyProperties = SecTrustEvaluateWithError(trust, nil)
                
                // 인증서가 설치되어 있으면 copyProperties 의 return이 true임.
                if copyProperties == true {
                    print("Root certificates is installed. \(certificateName)")
                    return true
                } else {
                    // 인증서 설치 화면으로 넘기도록.
                    print("No root certificates found.")
                    return false
                }
            }
        } catch {
            print("An error occurred during certificate registration. : \(error)")
            return nil
        }
        return nil
    }

    // MARK: - Private utils
    private func readCertFromPem(data: Data) -> SecCertificate? {
        var pemStr = String(decoding: data, as: UTF8.self)
        
        // remove the header string
        let head = "-----BEGIN CERTIFICATE-----"
        let tail = "-----END CERTIFICATE-----"
        pemStr = pemStr.replacingOccurrences(of: head, with: "")
        pemStr = pemStr.replacingOccurrences(of: tail, with: "")
        
        let derStr = Data(base64Encoded: pemStr, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
        
        return SecCertificateCreateWithData(nil, derStr as CFData)
    }
    
    private func getCertCommonName(cert: SecCertificate) -> String? {
        var cfName: CFString? = nil
        let osStatus = SecCertificateCopyCommonName(cert, &cfName)
        if osStatus != errSecSuccess {
            print("SecCertificateCopyCommonName is failed.")
            return nil
        }
    
        return cfName as String?
    }
    
    func tryCertInstall() -> Error?  {
        print("addCert")
        do {
            // SDP에서 내려받은 인증서를 SecCertificate 객체로 변환.
            let certPath = fileIOManager.certPath
            let data = try Data(contentsOf: certPath)

            guard let certificate = readCertFromPem(data: data) else {
                print("Failed to read certificate file.")
                return nil
            }
            let keychain: SecKeychain? = nil
            let status = SecCertificateAddToKeychain(certificate, keychain)
            if status != errSecSuccess {
                print("error \(status) : " + (SecCopyErrorMessageString(status, nil)! as String))
                return NSError(domain: NSOSStatusErrorDomain, code: Int(status), userInfo: ["msg": "SecCertificateAddToKeychain"])
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    // Root 인증서 신뢰 설정 변경
    func changeRootCertificateTrustSettings() -> Error? {
        print("setTrustSetting")
        do {
            // SDP에서 내려받은 인증서를 SecCertificate 객체로 변환.
            let certPath = fileIOManager.certPath //fileIOManager.certPath
            let data = try Data(contentsOf: certPath)

            guard let certificate = readCertFromPem(data: data) else {
                print("Failed to read certificate file.")
                return nil
            }
            let status = SecTrustSettingsSetTrustSettings(certificate, .user, [kSecTrustSettingsResult: NSNumber(value: SecTrustSettingsResult.trustRoot.rawValue)] as CFTypeRef)
            if status != errSecSuccess {
                let message = "error \(status) : " + (SecCopyErrorMessageString(status, nil)! as String)
                print(message)
                return NSError(domain: NSOSStatusErrorDomain, code: Int(status), userInfo: ["msg": message])
            }
        } catch {
            print(error)
        }
        
        
        return nil
        
    }
}
