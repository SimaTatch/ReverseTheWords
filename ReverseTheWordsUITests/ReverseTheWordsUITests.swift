

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
        
        let app = XCUIApplication()
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.children(matching: .staticText).matching(identifier: "Reverse Words").element(boundBy: 0).tap()
        element.tap()
        
        let reverseWordsStaticText = element.children(matching: .staticText).matching(identifier: "Reverse Words").element(boundBy: 1)
        reverseWordsStaticText.tap()
        reverseWordsStaticText.tap()
        app.staticTexts["This application will reverse your words. Please type text below "].tap()
        element.tap()
        
        let textToReverseTextField = app.textFields["Text to reverse"]
        textToReverseTextField.tap()
        textToReverseTextField.tap()
        
        let resultStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Result"]/*[[".buttons[\"Result\"].staticTexts[\"Result\"]",".staticTexts[\"Result\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        resultStaticText.tap()
        
        let customButton = app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        customButton.tap()
        
        let textToIgnoreTextField = app.textFields["Text to ignore"]
        textToIgnoreTextField.tap()
        textToIgnoreTextField.tap()
        resultStaticText.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Default"]/*[[".segmentedControls.buttons[\"Default\"]",".buttons[\"Default\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textToReverseTextField.swipeLeft()
        resultStaticText.tap()
        customButton.tap()
        resultStaticText.tap()
        textToIgnoreTextField.tap()
        resultStaticText.tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
        element2.tap()
                        
    }
}
