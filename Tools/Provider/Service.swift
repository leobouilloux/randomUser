//
//  Service.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import Foundation

protocol Service {
    func getUsers(completion: @escaping ((Result<[User], Error>) -> Void))
}
