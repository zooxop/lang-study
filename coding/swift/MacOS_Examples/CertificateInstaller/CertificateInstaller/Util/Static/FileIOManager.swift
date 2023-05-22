//
//  FileIOManager.swift
//  CertificateInstaller
//
//  Created by 문철현 on 2023/05/22.
//

import Foundation

protocol FileIOManagerInjector {
    var fileIOManager: FileIOManager { get }
}

extension FileIOManagerInjector {
    var fileIOManager: FileIOManager {
        return sharedFileIOManager
    }
}

fileprivate let sharedFileIOManager: FileIOManager = FileIOManager()

class FileIOManager {
    
    // 파일 저장 경로
    var applicationSupportDirectory: URL = URL(fileURLWithPath: "")
    var dirPath: URL = URL(fileURLWithPath: "")
    var certPath: URL = URL(fileURLWithPath: "")
    var vpnClientPath: URL = URL(fileURLWithPath: "")
    
    fileprivate init() {
        #if os(iOS)
        self.dirPath = self.applicationSupportDirectory
        #else
        self.dirPath = Bundle.main.bundleURL.appendingPathComponent("Contents/External")
        #endif
        self.certPath = self.dirPath.appendingPathComponent("cert.crt")
        
        print("dirPath : \(self.dirPath)\n")
    }
    
    // MARK: - public
    public func getSupportDirectory(subPath: String) -> URL? {
        do {
            // get directory path of data
            let fileManager = FileManager()
            let documentsDirectory = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
            let dataPath = documentsDirectory.appendingPathComponent(subPath)
            
            // check exist and create
            if fileManager.fileExists(atPath: dataPath.path) == false {
                try fileManager.createDirectory(at: dataPath, withIntermediateDirectories: true, attributes: nil)
            }
            print(dataPath.description)
            
            return dataPath
            
        } catch {
            print("\(error)")
            return nil
        }
    }

    public func saveFile(url: URL, contents: String) -> Error? {
        do {
            try contents.write(to: url, atomically: false, encoding: .utf8)
            return nil
        } catch {
            print("\(error)")
            return error
        }
    }
    
    // MARK: - private
    private func openFile(url: URL) -> Data? {
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("\(error)")
            return nil
        }
    }

    private func removeFile(url: URL) -> Error? {
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print("\(error)")
            return error
        }
        
        return nil
    }

    private func existFile(url: URL) -> Bool {
        return FileManager.default.fileExists(atPath: url.path)
    }
}
