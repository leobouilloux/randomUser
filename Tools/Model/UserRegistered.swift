//
//  UserRegistered.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserRegistered: Object, Decodable {
    @objc dynamic var date: String = ""
    @objc dynamic var age: Int = 0
}
