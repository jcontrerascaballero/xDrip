//
//  EditFoodEntryRouterTests.swift
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

final class EditFoodEntryRouterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: EditFoodEntryRouter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = EditFoodEntryRouter()
    }
    
    private func createSpy() -> ViewControllerSpy {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        archiver.finishEncoding()
        let data = archiver.encodedData
        let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data)
        return ViewControllerSpy(coder: unarchiver)!
    }
    
    // MARK: Test doubles
    
    final class ViewControllerSpy: EditFoodEntryViewController {
    }
    
    // MARK: Tests
}