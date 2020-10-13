//
//  UsersListCellType.swift
//  RandomUser
//
//  Created by Leo Marcotte on 12/10/2020.
//

enum UsersListCellType {
    case user(value: UserDTO)

    var identifier: String {
        switch self {
        case .user: return UserTableViewCell.identifier
        }
    }
}
