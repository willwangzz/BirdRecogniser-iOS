//
//  BirdRecogniser_iOSUITests.swift
//  BirdRecogniser-iOSUITests
//
//  Created by 王宗正 on 7/04/23.
//

import XCTest

final class BirdRecogniser_iOSUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func testClickFromLibraryButton() throws {
        app.buttons["From Library, Select your photos from your library, Select your photo"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testClickTakeAPhotoButton() throws {
        app.buttons["Take a photo, Take a photo to recognise, Take a photo"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testInputContributionInfo() {
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Recognise"].tap()
        
        let contributionButton = tabBar.buttons["Contribution"]
        contributionButton.tap()
        tabBar.buttons["About us"].tap()
        contributionButton.tap()
        app.textFields["Bird Name"].tap()
        app.textFields["Bird Name"].typeText("KIWI")
        
        let birdInformationTextField = app.textFields["Bird Information"]
        birdInformationTextField.tap()
        birdInformationTextField.typeText("KIWI INFORMATION")
        
        let updatePhotoTextField = app.textFields["Update Photo"]
        updatePhotoTextField.tap()
        updatePhotoTextField.typeText("UPLOAD IMAGE")
        app.buttons["Contribute New"].tap()
        
    }
    
//    func testSelectAPhoto() {
//
//        let app = XCUIApplication()
//        let tabBar = app.tabBars["Tab Bar"]
//        tabBar.buttons["About us"].tap()
//        tabBar.buttons["Contribution"].tap()
//        tabBar.buttons["Recognise"].tap()
//        app.buttons["From Library, Select your photos from your library, Select your photo"].tap()
//
//
//    }
    
    func testSelectAPhoto() {
        XCUIApplication().buttons["From Library, Select your photos from your library, Select your photo"].tap()

        
    }
}
