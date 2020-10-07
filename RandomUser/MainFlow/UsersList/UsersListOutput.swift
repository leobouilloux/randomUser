//
//  UsersListOutput.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxCocoa

final class UsersListOutput {
    let userSelected = PublishRelay<User>()
}
