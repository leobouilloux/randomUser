//
//  MainFactory.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

final class MainFactory {
    func makeUsersListPresentable(with viewModel: UsersListViewModel) -> Presentable {
        return UsersListViewController(with: viewModel)
    }

    func makeUserDetailsPresentable(with viewModel: UserDetailsViewModelInterface) -> Presentable {
        return UserDetailsViewController(with: viewModel)
    }
}
