//
//  BirdRecogniser_iOSTests.swift
//  BirdRecogniser-iOSTests
//
//  Created by 王宗正 on 7/04/23.
//

import XCTest
@testable import BirdRecogniser_iOS
import SwiftUI

final class BirdRecogniser_iOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRecogniseToolSingleton() throws {
        let recogniseTool = BirdRecognitionTool.shared
        let recogniseTool1 = BirdRecognitionTool.shared
        
        XCTAssertEqual(Unmanaged.passUnretained(recogniseTool).toOpaque(), Unmanaged.passUnretained(recogniseTool1).toOpaque())
    }
    
    func testRecogniseToolRecognise() async throws {
        let testImage = UIImage(named: "WILD TURKEY4.jpg")
        XCTAssertNotNil(testImage)
        let recogniseTool = BirdRecognitionTool.shared
        let result = await recogniseTool.recognise(bird: testImage!)
        XCTAssertNotNil(result)
        XCTAssertLessThanOrEqual(3, result!.count)
    }
    
    func testImageResize() throws {
        let testImage = UIImage(named: "testImage.png")
        XCTAssertNotNil(testImage)
        let resizedImage = testImage!.resize(to: .init(width: 224, height: 224))
        XCTAssertNotNil(resizedImage)
        XCTAssertEqual(CGSize(width: 224, height: 224), resizedImage!.size)
    }
    
    func testUIColorFromString() throws {
        let whiteColor = UIColor(hex: "#FFFFFF")
        XCTAssertNotNil(whiteColor)
        
        let color = UIColor(hex: "#11111111")
        XCTAssertNotNil(color)
    }
    
    func testUIColorToColor() throws {
        let whiteColor = UIColor.white
        XCTAssertNoThrow(whiteColor.toColor())
    }
    
    func testUIFontToFont() throws {
        let uifont = UIFont.systemFont(ofSize: 10)
        XCTAssertNoThrow(uifont.toFont())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
