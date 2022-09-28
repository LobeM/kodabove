//
//  KodaboveUITests.swift
//  KodaboveUITests
//
//  Created by Lobe Musonda on 9/24/22.
//

import XCTest

final class KodaboveUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_open_events_tab() {
        app.tabBars.buttons["Events"].tap()
        XCTAssert(app.navigationBars["Events"].exists)
    }
    
    func test_open_schedule_tab() {
        app.tabBars.buttons["Schedule"].tap()
        XCTAssert(app.navigationBars["Schedule"].exists)
    }
    
    func test_schedule_list_is_loading() {
        app.tabBars.buttons["Schedule"].tap()
        XCTAssert(app.navigationBars["Schedule"].exists)
        
        let scheduleList = app.otherElements["scheduleList"]
        XCTAssertTrue(scheduleList.waitForExistence(timeout: 5), "The List should be visible")
    }
    
    func test_select_event_item() {
        app.tabBars.buttons["Events"].tap()
        XCTAssert(app.navigationBars["Events"].exists)
        
        let eventList = app.otherElements["eventsList"]
        XCTAssertTrue(eventList.waitForExistence(timeout: 5), "The List should be visible")
        
        let eventCount = eventList.buttons.count
        XCTAssertTrue(eventCount > 0)
        
        let firstEvent = eventList.buttons.element(boundBy: 0)
        XCTAssertTrue(firstEvent.exists)
        firstEvent.tap()
        
        XCTAssert(app.navigationBars["Playback"].exists)
    }
    
    func test_back_button_from_playback() {
        app.tabBars.buttons["Events"].tap()
        XCTAssert(app.navigationBars["Events"].exists)
        
        let eventList = app.otherElements["eventsList"]
        XCTAssertTrue(eventList.waitForExistence(timeout: 5), "The List should be visible")
        
        let eventCount = eventList.buttons.count
        XCTAssertTrue(eventCount > 0)
        
        let firstEvent = eventList.buttons.element(boundBy: 0)
        XCTAssertTrue(firstEvent.exists)
        firstEvent.tap()
        
        XCTAssert(app.navigationBars["Playback"].exists)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssert(app.navigationBars["Events"].exists)
    }
}
