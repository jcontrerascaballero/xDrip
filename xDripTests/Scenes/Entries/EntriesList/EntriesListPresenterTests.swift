//
//  EntriesListPresenterTests.swift
//  xDrip
//
//  Created by Artem Kalmykov on 17.03.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import xDrip
import XCTest

final class EntriesListPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: EntriesListPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupEntriesListPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupEntriesListPresenter() {
        sut = EntriesListPresenter()
    }
    
    // MARK: Test doubles
    
    final class EntriesListDisplayLogicSpy: EntriesListDisplayLogic {
        var displayLoadCalled = false
        
        func displayLoad(viewModel: EntriesList.Load.ViewModel) {
            displayLoadCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentLoad() {
        // Given
        let spy = EntriesListDisplayLogicSpy()
        sut.viewController = spy
        let response = EntriesList.Load.Response()
        
        // When
        sut.presentLoad(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoadCalled, "presentLoad(response:) should ask the view controller to display the result")
    }
}
