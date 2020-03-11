//
//  HomePresenterTests.swift
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

final class HomePresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: HomePresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupHomePresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHomePresenter() {
        sut = HomePresenter()
    }
    
    // MARK: Test doubles
    
    final class HomeDisplayLogicSpy: HomeDisplayLogic {
        var displayLoadCalled = false
        
        func displayLoad(viewModel: Home.Load.ViewModel) {
            displayLoadCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentLoad() {
        // Given
        let spy = HomeDisplayLogicSpy()
        sut.viewController = spy
        let response = Home.Load.Response()
        
        // When
        sut.presentLoad(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoadCalled, "presentLoad(response:) should ask the view controller to display the result")
    }
}
