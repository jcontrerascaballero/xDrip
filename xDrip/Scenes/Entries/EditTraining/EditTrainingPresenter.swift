//
//  EditTrainingPresenter.swift
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

protocol EditTrainingPresentationLogic {
    func presentLoad(response: EditTraining.Load.Response)
}

final class EditTrainingPresenter: EditTrainingPresentationLogic {
    weak var viewController: EditTrainingDisplayLogic?
    
    // MARK: Do something
    
    func presentLoad(response: EditTraining.Load.Response) {
        let viewModel = EditTraining.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
