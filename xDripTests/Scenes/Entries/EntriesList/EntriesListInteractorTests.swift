//
//  EntriesListInteractorTests.swift
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

final class EntriesListInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: EntriesListInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupEntriesListInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupEntriesListInteractor() {
        sut = EntriesListInteractor()
    }
    
    // MARK: Test doubles
    
    final class EntriesListPresentationLogicSpy: EntriesListPresentationLogic {
        var presentLoadCalled = false
        
        func presentLoad(response: EntriesList.Load.Response) {
            presentLoadCalled = true
        }
    }
    
    final class EntriesListRoutingLogicSpy: EntriesListRoutingLogic {
        
    }
    
    // MARK: Tests
    
    func testDoLoad() {
        // Given
        let spy = EntriesListPresentationLogicSpy()
        sut.presenter = spy
        let request = EntriesList.Load.Request()
        
        // When
        sut.doLoad(request: request)
        
        // Then
        XCTAssertTrue(spy.presentLoadCalled, "doLoad(request:) should ask the presenter to format the result")
    }
}