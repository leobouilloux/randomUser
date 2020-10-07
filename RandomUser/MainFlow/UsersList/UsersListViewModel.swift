//
//  UsersListViewModel.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

final class UsersListViewModel: UsersListViewModelInterface {
    private let provider: Provider
    
    let output = UsersListOutput()
    
    init(provider: Provider) {
        self.provider = provider
    }
}
