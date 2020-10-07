//
//  UserDetailsViewController.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

final class UserDetailsViewController: RxViewController {
    private let viewModel: UserDetailsViewModelInterface
    
    init(with viewModel: UserDetailsViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupRxBindings()
    }
}

private extension UserDetailsViewController {
    /* SetupView */
    func setupView() {
        
    }
    
    /* Rx Bindings */
    func setupRxBindings() {
        
    }
}
