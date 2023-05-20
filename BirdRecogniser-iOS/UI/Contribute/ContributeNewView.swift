//
//  ContributeNewView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 25/04/23.
//

import SwiftUI

struct ContributeNewView: View {
    
    @Binding var isSubmitted: Bool
    
    @State var birdName: String
    @State var birdInfomation: String
    
    @State var image: UIImage? = nil
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ContributeTitleView()
                Spacer()
                    .frame(height: 43)
                HStack {
                    ContributeBirdImageView(image: self.$image)
                    Spacer()
                        .frame(width: 10)
                    TextField("Bird Name", text: $birdName)
                        .font(Theme.miniHeaderFont.toFont())
                        .frame(height: 88)
                        .addCornerAndShadow()
                }
                Spacer()
                    .frame(height: 43)
                ContributeBirdInfomationView(birdInfomation: $birdInfomation)
                    .frame(maxHeight: .infinity)
                    .addCornerAndShadow()
                
                Spacer()
                    .frame(height: 43)
                Button("Contribute New") {
//                    self.isSubmitted = true
                    submit()
                }
                .padding(.horizontal)
                .addButtonStyle(Theme.actionColor!)
                Spacer()
                    .frame(height: 43)
            }
            .frame(width: geo.size.width)
        }
        .padding(.horizontal, 30.0)
        .addMainGradientBackground()
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

extension ContributeNewView: DataManagerProtocol {
    
    var apiName: String {
        return "MobileSubmissionAPI/submitBird"
    }
    
    private func submit() {
        
        
        guard let url = URL(string: "\(baseURL)\(apiName)") else { return }
        
        let boundary = "Boundary-\(NSUUID().uuidString)"
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["birdName": birdName, "birdInfo": birdInfomation]
        
        urlRequest.httpBody = createBodyWithParameters(parameters: parameters, filePathKey: "birdImage", imageDataKey: image?.resize(to: .init(width: 224, height: 224))?.jpegData(compressionQuality: 1), boundary: boundary)
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard data != nil else { return }
                DispatchQueue.main.async {
                    self.isSubmitted = true
                }
            }
        }
        dataTask.resume()
    }
    
    func createBodyWithParameters(parameters: [String: String], filePathKey: String?, imageDataKey: Data?, boundary: String) -> Data {
        var body = Data()

        for (key, value) in parameters {
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }

        let filename = "image_name.jpg"
        let mimetype = "image/jpg"

        body.appendString("--\(boundary)\r\n")

        if let filePath = filePathKey, let imageData = imageDataKey {
            body.appendString("Content-Disposition: form-data; name=\"\(filePath)\"; filename=\"\(filename)\"\r\n")
            body.appendString("Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageData)
            body.appendString("\r\n")
            body.appendString("--\(boundary)--\r\n")
        }

        return body
    }
}

extension View {
    func addCornerAndShadow() -> some View {
        self
            .padding(.horizontal)
            .background(UIColor.white.toColor())
            .cornerRadius(30)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 20)
    }
}

extension Data {
    mutating func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

struct ContributeNewView_Previews: PreviewProvider {
    
    @State static var isSubmitted = true
    
    static var previews: some View {
        ContributeNewView(isSubmitted: $isSubmitted, birdName: "", birdInfomation: "")
    }
}
