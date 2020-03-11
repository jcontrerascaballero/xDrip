//
//  HistoryRootViewController.swift
//  xDrip
//
//  Created by Artem Kalmykov on 11.03.2020.
//  Copyright (c) 2020 Faifly. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HistoryRootDisplayLogic: class {
    func displayLoad(viewModel: HistoryRoot.Load.ViewModel)
}

class HistoryRootViewController: UIViewController, HistoryRootDisplayLogic {
    var interactor: HistoryRootBusinessLogic?
    var router: (NSObjectProtocol & HistoryRootRoutingLogic & HistoryRootDataPassing)?
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = HistoryRootInteractor()
        let presenter = HistoryRootPresenter()
        let router = HistoryRootRouter()
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
        let request = HistoryRoot.Load.Request()
        interactor?.doLoad(request: request)
    }
    
    @IBAction private func onCancelButtonTap() {
        let request = HistoryRoot.Cancel.Request()
        interactor?.doCancel(request: request)
    }
    
    // MARK: Display
    
    func displayLoad(viewModel: HistoryRoot.Load.ViewModel) {
        
    }
}