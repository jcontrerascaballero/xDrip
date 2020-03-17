//
//  EditCalibrationViewController.swift
//  xDrip
//
//  Created by Artem Kalmykov on 17.03.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EditCalibrationDisplayLogic: class {
    func displayLoad(viewModel: EditCalibration.Load.ViewModel)
}

class EditCalibrationViewController: UIViewController, EditCalibrationDisplayLogic {
    var interactor: EditCalibrationBusinessLogic?
    var router: (NSObjectProtocol & EditCalibrationRoutingLogic & EditCalibrationDataPassing)?
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = EditCalibrationInteractor()
        let presenter = EditCalibrationPresenter()
        let router = EditCalibrationRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: IB
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doLoad()
    }
    
    // MARK: Do something
    
    private func doLoad() {
        let request = EditCalibration.Load.Request()
        interactor?.doLoad(request: request)
    }
    
    // MARK: Display
    
    func displayLoad(viewModel: EditCalibration.Load.ViewModel) {
        
    }
}