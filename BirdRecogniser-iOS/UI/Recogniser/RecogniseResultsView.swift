//
//  RecogniseResultsView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 11/05/23.
//

import SwiftUI
import Alamofire

struct RecogniseResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var image: UIImage?
    
    @State var birdRecognitionResults: [BirdRecognisitionResult]?
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                if let _ = image {
                    Image(uiImage: image!)
                        .resizable()
                        .frame(width: geo.size.width - 60, height: (geo.size.width - 60) * (image?.size.height ?? 1) / (image?.size.width ?? 1))
                        .cornerRadius(30)
                        .padding(.horizontal, 30)
                }
                if let results = birdRecognitionResults {
                    ForEach(Array(results.enumerated()), id: \.offset) { index, result in
                        RecogniseResultDetailView(birdResult: result, showBottomLine: (index != results.count - 1))
                    }
                }
                
            }
        }
        .navigationTitle("Result")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.image = nil
        }, label: {
            Image("navigation-back")
        }))
        .addMainGradientBackground()
        .onAppear {
            Task {
                await recogniseImage()
            }
        }
    }
    
    private func recogniseImage() async {
        guard let birdImage = image else { return }
        let recognitionTool = BirdRecognitionTool.shared
        let result = await recognitionTool.recognise(bird: birdImage)
        self.birdRecognitionResults = result
        if let birdsName = result?.map({ $0.name }) {
            self.getInformation(of: birdsName)
        }
    }
}

extension RecogniseResultsView: DataManagerProtocol {
    
    var apiName: String {
        return "RecogniseAPI/birdsinfo"
    }
    
    private func getInformation(of birdsName: [String]) {
        guard birdsName.count > 0 else {
            return
        }
        guard let nameString = birdsName.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            return
        }
        
        let params = "?birdNames=\(nameString)"
        
        guard let url = URL(string: "\(baseURL)\(apiName)\(params)") else { return }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        var newResults = [BirdRecognisitionResult]()
                        let array = try JSONDecoder().decode([BirdGeneralInformation].self, from: data)
                        if let oldResults = birdRecognitionResults, array.count > 0 {
                            for oldResult in oldResults {
                                let generalInfo = array.first(where: { $0.predictedLabel == oldResult.name })?.generalInfo
                                var newResult = oldResult
                                newResult.information = generalInfo
                                newResults.append(newResult)
                            }
                            birdRecognitionResults = newResults
                        }
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

struct RecogniseResultsView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "EMU0.jpg")
    
    static var previews: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                RecogniseResultsView(image: $image)
            }
        } else {
            RecogniseResultsView(image: $image)
        }
        
    }
}
