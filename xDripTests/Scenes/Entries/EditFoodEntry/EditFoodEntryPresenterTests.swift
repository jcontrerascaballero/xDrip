//
//  EditFoodEntryPresenterTests.swift
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

final class EditFoodEntryPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: EditFoodEntryPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupEditFoodEntryPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupEditFoodEntryPresenter() {
        sut = EditFoodEntryPresenter()
    }
    
    // MARK: Test doubles
    
    final class EditFoodEntryDisplayLogicSpy: EditFoodEntryDisplayLogic {
        var displayLoadCalled = false
        
        func displayLoad(viewModel: EditFoodEntry.Load.ViewModel) {
            displayLoadCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentLoad() {
        // Given
        let spy = EditFoodEntryDisplayLogicSpy()
        sut.viewController = spy
        let response = EditFoodEntry.Load.Response()
        
        // When
        sut.presentLoad(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoadCalled, "presentLoad(response:) should ask the view controller to display the result")
    }
}
