//
//  KodaboveTests.swift
//  KodaboveTests
//
//  Created by Lobe Musonda on 9/24/22.
//

import XCTest
@testable import Kodabove

final class KodaboveTests: XCTestCase {
    private var networkManager: NetworkManager!
    
    override func setUp() {
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
    }
    
    func test_with_sucessful_response_events_array_is_set() {
        XCTAssertTrue(networkManager.isLoading, "Data should be loading on initialization")
        
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.networkManager.events.count > 0)
            
            expectation.fulfill()
        }
        
        defer {
            XCTAssertFalse(networkManager.isLoading, "No data should be loading")
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_with_sucessful_response_schedule_array_is_set() {
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.networkManager.schedules.count > 0)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
