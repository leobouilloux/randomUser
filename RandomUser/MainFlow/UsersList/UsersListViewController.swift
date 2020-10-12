//
//  UsersListViewController.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

final class UsersListViewController: RxViewController {
    private let viewModel: UsersListViewModelInterface
    
    private let tableView = UITableView()
    
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

extension UsersListViewController: UITableViewDelegate {
    /* SetupView */
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .tertiarySystemBackground
        tableView.register(cell: UserTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    /* Rx Bindings */
    private func setupRxBindings() {
        bindTableView()
    }
    
    private func bindTableView() {
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: bag)
        viewModel.dataSource
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items) { [weak self] _, row, cellType in
                let indexPath = IndexPath(row: row, section: 0)

                return self?.cell(for: cellType, indexPath: indexPath) ?? UITableViewCell()
            }
            .disposed(by: bag)
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let item = self?.viewModel.dataSource.value[safeIndex: indexPath.row] else { return }
                switch item {
                case let .user(value: user): self?.viewModel.output.userSelected.accept(user)
                }
            })
            .disposed(by: bag)

    }

    /* Helpers */
    private func cell(for cellType: UsersListCellType, indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        switch cellType {
        case let .user(value: user):
            let newCell = UserTableViewCell()
            newCell.setup(with: UserTableViewCellViewModel(user: user))
            cell = newCell
        }
        return cell
    }
}
