//
//  RootInteractor.swift
//  xDrip
//
//  Created by Artem Kalmykov on 23.02.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RootBusinessLogic {
    func doLoad(request: Root.Load.Request)
}

protocol RootDataStore {
    
}

final class RootInteractor: RootBusinessLogic, RootDataStore {
    var presenter: RootPresentationLogic?
    
    // MARK: Do something
    
    func doLoad(request: Root.Load.Request) {
        let response = Root.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
