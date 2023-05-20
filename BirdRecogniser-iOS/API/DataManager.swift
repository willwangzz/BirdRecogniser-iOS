//
//  DataManager.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 20/05/23.
//

import Foundation

class DataManager: NSObject {
    
    static let shared = DataManager()
    
    var session: URLSession?
    
    let baseURL = "https://192.168.1.14:44353/api/"
        
    private override init() {
        super.init()
        session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
}

extension DataManager: URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            let serverTrust = challenge.protectionSpace.serverTrust
            let credential = URLCredential(trust: serverTrust!)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            
        }
    }
}

protocol DataManagerProtocol {
    var apiName: String { get }
}

extension DataManagerProtocol {
    var manager: DataManager {
        return DataManager.shared
    }
    
    var baseURL: String {
        return manager.baseURL
    }
    
    var session: URLSession {
        return manager.session!
    }
    
}
