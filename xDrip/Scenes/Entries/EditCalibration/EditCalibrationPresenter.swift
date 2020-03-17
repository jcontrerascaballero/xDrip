//
//  EditCalibrationPresenter.swift
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

protocol EditCalibrationPresentationLogic {
    func presentLoad(response: EditCalibration.Load.Response)
}

final class EditCalibrationPresenter: EditCalibrationPresentationLogic {
    weak var viewController: EditCalibrationDisplayLogic?
    
    // MARK: Do something
    
    func presentLoad(response: EditCalibration.Load.Response) {
        let viewModel = EditCalibration.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}