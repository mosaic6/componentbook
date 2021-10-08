//
//  HeaderViewTests.swift
//  Tests iOS
//
//  Created by Joshua Walsh on 9/2/21.
//

import XCTest

class HeaderViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(HeaderView_Previews.capturedPreviews(title: "Header View"))
    }

    func testCaptureScreenshot() {
        let mainScreenScreenshot = XCUIScreen.main.screenshot()

        let app = XCUIApplication()

        app.launch()

        let windowScreenshot = app.windows.firstMatch.screenshot()

        
    }
}
