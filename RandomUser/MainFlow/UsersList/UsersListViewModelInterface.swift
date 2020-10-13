//
//  UsersListViewModelInterface.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxCocoa

protocol UsersListViewModelInterface {
    var dataSource: BehaviorRelay<[UsersListCellType]> { get }
    var errorMessage: PublishRelay<String> { get }
    
    var output: UsersListOutput { get }
    
    var isLoading: Bool { get }
    
    func fetchUsers()
    func resetUsers()
}
