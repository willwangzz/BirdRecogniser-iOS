//
//  ImagePicker.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 8/04/23.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode) private var presentationMode
    let sourceType: UIImagePickerController.SourceType
    
    @Binding var image: UIImage? 
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding private var presentationMode: PresentationMode
        let sourceType: UIImagePickerController.SourceType
        
        @Binding var image: UIImage?
        
        init(presentationMode: Binding<PresentationMode>, sourceType: UIImagePickerController.SourceType, image: Binding<UIImage?>) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self._image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            self.image = image
            presentationMode.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, sourceType: sourceType, image: self.$image)
    }
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        picker.modalPresentationStyle = .fullScreen
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
