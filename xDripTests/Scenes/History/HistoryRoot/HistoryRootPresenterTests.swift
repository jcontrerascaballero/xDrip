//
//  HistoryRootPresenterTests.swift
//  xDrip
//
//  Created by Artem Kalmykov on 11.03.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import xDrip
import XCTest

final class HistoryRootPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: HistoryRootPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHistoryRootPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHistoryRootPresenter() {
        sut = HistoryRootPresenter()
    }
    
    // MARK: Test doubles
    
    final class HistoryRootDisplayLogicSpy: HistoryRootDisplayLogic {
        var displayLoadCalled = false
        
        func displayLoad(viewModel: HistoryRoot.Load.ViewModel) {
            displayLoadCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentLoad() {
        // Given
        let spy = HistoryRootDisplayLogicSpy()
        sut.viewController = spy
        let response = HistoryRoot.Load.Response()
        
        // When
        sut.presentLoad(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoadCalled, "presentLoad(response:) should ask the view controller to display the result")
    }
}
