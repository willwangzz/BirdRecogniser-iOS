//
//  BirdRecogniser_iOSUITests.swift
//  BirdRecogniser-iOSUITests
//
//  Created by 王宗正 on 7/04/23.
//

import XCTest

final class BirdRecogniser_iOSUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func launchApp() {
        if app.state != .runningForeground {
            app.launch()
        }
    }
    
    func testClickFromLibraryButton() throws {
        self.launchApp()
        
        app.buttons["From Library, Select your photos from your library, Select your photo"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testClickTakeAPhotoButton() throws {
        self.launchApp()
        
        app.buttons["Take a photo, Take a photo to recognise, Take a photo"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testTabBar() {
        self.launchApp()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Recognise"].tap()
        
        let contributionButton = tabBar.buttons["Contribution"]
        contributionButton.tap()
        tabBar.buttons["About us"].tap()
        contributionButton.tap()
        app.textFields["Bird Name"].tap()
        tabBar.buttons["Recognise"].tap()
    }
    
    func testInputContributionInfo() {
        self.launchApp()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Recognise"].tap()
        
        let contributionButton = tabBar.buttons["Contribution"]
        contributionButton.tap()
        tabBar.buttons["About us"].tap()
        contributionButton.tap()
        app.textFields["Bird Name"].tap()
        app.textFields["Bird Name"].typeText("KIWI")
        
        let birdInformationTextField = app.textViews.firstMatch
        birdInformationTextField.tap()
        birdInformationTextField.typeText("KIWI INFORMATION")
        
        
        app.buttons["contribute-add"].tap()
        app.buttons["From Library, Select your photos from your library, Select your photo"].tap()
        sleep(2)
        app.images["Photo, March 17, 4:15 PM"].firstMatch.tap()
        sleep(2)
        
        app.buttons["Choose"].tap()
        sleep(2)
        
        app.buttons["Contribute New"].tap()
        
//        sleep(5)
        
        XCTAssertNotNil(app.buttons["OK"])
    }
    
    func testSelectAPhoto() {
        self.launchApp()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Recognise"].tap()
        
        app.buttons["From Library, Select your photos from your library, Select your photo"].tap()
        
        sleep(2)
        app.images["Photo, March 17, 4:15 PM"].firstMatch.tap()
        sleep(2)
        
        app.buttons["Choose"].tap()
        sleep(1)
        app.buttons["recognise-button"].tap()
        sleep(1)
        app.buttons["navigation-back"].tap()
        
    }
}
