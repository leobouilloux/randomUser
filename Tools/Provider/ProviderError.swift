//
//  ProviderError.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import Foundation

enum ProviderError: Error {
    case cannotWriteToDatabase
    case cannotWipeDatabase

    var userFriendlyErrorMessage: String {
        switch self {
        case .cannotWriteToDatabase: return Loc.Error.cannotWriteToDatabase
        case .cannotWipeDatabase: return Loc.Error.cannotWipeDatabase
        }
    }
}
