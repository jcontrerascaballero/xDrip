//
//  EntriesListViewController.swift
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

protocol EntriesListDisplayLogic: class {
    func displayLoad(viewModel: EntriesList.Load.ViewModel)
}

class EntriesListViewController: UIViewController, EntriesListDisplayLogic {
    var interactor: EntriesListBusinessLogic?
    var router: (NSObjectProtocol & EntriesListRoutingLogic & EntriesListDataPassing)?
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = EntriesListInteractor()
        let presenter = EntriesListPresenter()
        let router = EntriesListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: IB
    @IBOutlet private weak var tableView: UITableView!
    private let tableController = EntriesListTableController()
    private var isEdit = false
    private var sectionViewModels = [EntriesList.SectionViewModel]()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doLoad()
        
        setupUI()
        setupTableView()
    }
    
    // MARK: Do something
    
    private func doLoad() {
        let request = EntriesList.Load.Request()
        interactor?.doLoad(request: request)
    }
    
    @IBAction private func onCancelButtonTap() {
        let request = EntriesList.Cancel.Request()
        interactor?.doCancel(request: request)
    }
    
    @objc private func onEditButtonTap() {
        isEdit.toggle()
        setupRightBarButtonItem()
        tableView.isEditing = isEdit
    }
    
    // MARK: Display
    
    func displayLoad(viewModel: EntriesList.Load.ViewModel) {
        sectionViewModels = viewModel.items
        
        tableController.tableView = tableView
        tableController.reload(with: viewModel.items)
    }
    
    private func setupUI() {
        setupRightBarButtonItem()
        
        view.addBlur()
    }
    
    private func setupRightBarButtonItem() {
        let item = UIBarButtonItem(
            barButtonSystemItem: isEdit ? .done : .edit,
            target: self,
            action: #selector(onEditButtonTap)
        )
        
        navigationItem.rightBarButtonItem = item
    }
    
    private func setupTableView() {
        tableView.delegate = tableController
        tableView.dataSource = tableController
        
        tableController.didDeleteEntry = { [weak self] indexPath in
            guard let self = self else { return }
            
            self.sectionViewModels[indexPath.section].items.remove(at: indexPath.row)
            
            let request = EntriesList.DeleteEntry.Request(index: indexPath.row)
            self.interactor?.doDeleteEntry(request: request)
        }
        
        tableController.didSelectEntry = { [weak self] indexPath in
            guard let self = self else { return }
            let request = EntriesList.ShowSelectedEntry.Request(index: indexPath.row)
            self.interactor?.doShowSelectedEntry(request: request)
        }
    }
}
