//
//  UsersListViewModel.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxCocoa

final class UsersListViewModel: UsersListViewModelInterface {
    private let provider: Provider
    let dataSource = BehaviorRelay<[UsersListCellType]>(value: [])
    let errorMessage = PublishRelay<String>()

    var isLoading: Bool = false
    
    let output = UsersListOutput()
    
    init(provider: Provider) {
        self.provider = provider
        
        let users = provider.getUsers()
        if  users.isEmpty {
            self.fetchUsers()
        } else {
            self.setupCells(with: users)
        }
    }
    
    func resetUsers() {
        provider.refreshDatabase { [weak self] result in
            switch result {
            case let .success(users): self?.setupCells(with: users)
            case let .failure(error):
                switch error {
                case let error as NetworkError: self?.errorMessage.accept(error.userFriendlyErrorMessage)
                case let error as ProviderError: self?.errorMessage.accept(error.userFriendlyErrorMessage)
                default: print(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchUsers() {
        isLoading = true
        provider.fetchUsers { [weak self] result in
            self?.isLoading = false
            switch result {
            case let .success(users):
                self?.setupCells(with: users)
            case let .failure(error):
                switch error {
                case let error as NetworkError: self?.errorMessage.accept(error.userFriendlyErrorMessage)
                case let error as ProviderError: self?.errorMessage.accept(error.userFriendlyErrorMessage)
                default: print(error.localizedDescription)
                }
            }
        }
    }
}

private extension UsersListViewModel {
    func setupCells(with users: [UserDTO]) {
        let cells: [UsersListCellType] = users.compactMap({ UsersListCellType.user(value: $0) })
        self.dataSource.accept(cells)
    }
}
