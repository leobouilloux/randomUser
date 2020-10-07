//
//  UsersListViewController.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

final class UsersListViewController: RxViewController {
    private let viewModel: UsersListViewModelInterface
    
    init(with viewModel: UsersListViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupRxBindings()
    }
}

private extension UsersListViewController {
    /* SetupView */
    func setupView() {
        view.backgroundColor = .blue
    }
    
    /* Rx Bindings */
    func setupRxBindings() {
        
    }
}
