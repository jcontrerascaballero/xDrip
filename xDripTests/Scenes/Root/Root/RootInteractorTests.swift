//
//  RootInteractorTests.swift
//  xDrip
//
//  Created by Artem Kalmykov on 23.02.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import xDrip
import XCTest

final class RootInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: RootInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupRootInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupRootInteractor() {
        sut = RootInteractor()
    }
    
    // MARK: Test doubles
    
    final class RootPresentationLogicSpy: RootPresentationLogic {
        var presentLoadCalled = false
        var presentAddEntryCalled = false
        
        func presentLoad(response: Root.Load.Response) {
            presentLoadCalled = true
        }
        
        func presentAddEntry(response: Root.ShowAddEntry.Response) {
            presentAddEntryCalled = true
        }
    }
    
    final class RootRoutingLogicSpy: RootRoutingLogic {
        var routeToStatsCalled = false
        var routeToHistoryCalled = false
        var routeToSettingsCalled = false
        
        func routeToStats() {
            routeToStatsCalled = true
        }
        
        func routeToHistory() {
            routeToHistoryCalled = true
        }
        
        func routeToSettings() {
            routeToSettingsCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDoLoad() {
        // Given
        let spy = RootPresentationLogicSpy()
        sut.presenter = spy
        let request = Root.Load.Request()
        
        // When
        sut.doLoad(request: request)
        
        // Then
        XCTAssertTrue(spy.presentLoadCalled, "doLoad(request:) should ask the presenter to format the result")
    }
    
    func testTabBarSelection() {
        // Given
        let presenterSpy = RootPresentationLogicSpy()
        sut.presenter = presenterSpy
        
        let routerSpy = RootRoutingLogicSpy()
        sut.router = routerSpy
        
        // When
        var request = Root.TabSelection.Request(button: .chart)
        sut.doTabSelection(request: request)
        // Then
        XCTAssertTrue(routerSpy.routeToStatsCalled)
        
        // When
        request = Root.TabSelection.Request(button: .history)
        sut.doTabSelection(request: request)
        // Then
        XCTAssertTrue(routerSpy.routeToHistoryCalled)
        
        // When
        request = Root.TabSelection.Request(button: .settings)
        sut.doTabSelection(request: request)
        // Then
        XCTAssertTrue(routerSpy.routeToSettingsCalled)
        
        // When
        request = Root.TabSelection.Request(button: .plus)
        sut.doTabSelection(request: request)
        // Then
        XCTAssertTrue(presenterSpy.presentAddEntryCalled)
    }
}
