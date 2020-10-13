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
    
    let output = UsersListOutput()
    
    init(provider: Provider) {
        self.provider = provider
        
        provider.getUsers { [weak self] result in
            switch result {
            case let .success(users):
                let usersDTO = users.compactMap({ UserDTO(with: $0) })
                self?.setupCells(with: usersDTO)
            case let .failure(error):
                print(error.localizedDescription)
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
