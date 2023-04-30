//
//  BirdRecogniser_iOSTests.swift
//  BirdRecogniser-iOSTests
//
//  Created by 王宗正 on 7/04/23.
//

import XCTest
@testable import BirdRecogniser_iOS

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
    
    func testRecogniseToolRecognise() throws {
        let testImage = UIImage(named: "WILD TURKEY4.jpg")
        XCTAssertNotNil(testImage)
        let recogniseTool = BirdRecognitionTool.shared
        let result = recogniseTool.recognise(bird: testImage!)
        XCTAssertNotNil(result)
        XCTAssertLessThanOrEqual(3, result!.count)
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
