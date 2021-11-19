//
//  ReverseTheWordsUITests.swift
//  ReverseTheWordsUITests
//
//  Created by Серафима  Татченкова  on 19.11.2021.
//

import XCTest

class ReverseTheWordsUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

    }

    func testGameStyleSwitch() throws {
        app.otherElements["card:com.konfetacompany.ReverseTheWords:sceneID:com.konfetacompany.ReverseTheWords-default"].scrollViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        
        let textToReverseTextField = app.textFields["Text to reverse"]
        textToReverseTextField.tap()
        textToReverseTextField.tap()
        app.buttons["Reverse"].tap()
        app.buttons["Clear"].tap()
        
    }
}
