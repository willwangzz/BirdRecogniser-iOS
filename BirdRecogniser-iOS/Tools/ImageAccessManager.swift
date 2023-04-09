//
//  ImageAccessManager.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 9/04/23.
//
//
/// Manage authorization of camera and photo gallery

import Foundation
import UIKit
import AVFoundation

typealias PostAuthorizationBlock = () -> Void

struct ImageAccessManager {
    
    func checkAuthorization(of type: UIImagePickerController.SourceType, success: @escaping PostAuthorizationBlock, failed: @escaping PostAuthorizationBlock) {
        switch type {
        case .camera:
            self.checkCameraAuthorization(success: success, failed: failed)
        case .photoLibrary:
            self.checkPhotoLibraryAuthorization(success: success, failed: failed)
        default:
            failed()
        }
    }
    
    func checkCameraAuthorization(success: @escaping PostAuthorizationBlock, failed: @escaping PostAuthorizationBlock) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if authStatus == .restricted || authStatus == .denied {
            failed()
        } else {
            success()
        }
        switch authStatus {
        case .restricted, .denied:
            failed()
        case .authorized:
            success()
        case .notDetermined:
            requestCameraAuthorization(success: success, failed: failed)
        default:
            failed()
        }
    }
    
    func checkPhotoLibraryAuthorization(success: @escaping PostAuthorizationBlock, failed: @escaping PostAuthorizationBlock) {
        
    }
    
    func requestCameraAuthorization(success: @escaping PostAuthorizationBlock, failed: @escaping PostAuthorizationBlock) {
        
    }
    
    func requestPhotoLibraryAuthorization(success: @escaping PostAuthorizationBlock, failed: @escaping PostAuthorizationBlock) {
        
    }
    
}
