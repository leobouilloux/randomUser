//
//  Provider.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

import Foundation

protocol Provider {
    func getUsers() -> [UserDTO]
    func fetchUsers(completion: @escaping ((Result<[UserDTO], Error>) -> Void))
    func refreshDatabase(completion: @escaping ((Result<[UserDTO], Error>) -> Void))
}
