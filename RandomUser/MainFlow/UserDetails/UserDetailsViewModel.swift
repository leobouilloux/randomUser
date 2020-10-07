//
//  UserDetailsViewModel.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

final class UserDetailsViewModel: UserDetailsViewModelInterface {
    private let provider: Provider
    let user: User
    
    init(provider: Provider, user: User) {
        self.provider = provider
        self.user = user
    }
}
