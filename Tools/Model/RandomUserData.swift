//
//  RandomUserData.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import Foundation

struct RandomUserData: Decodable {
    var info: RandomUserInfo
    var results: [User]
    
    struct RandomUserInfo: Decodable {
        var seed: String
        var page: Int
        var results: Int
        var version: String
    }
}
