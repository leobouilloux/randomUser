//
//  UserDOB.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserDOB: Object, Decodable {
    @objc dynamic var date: String = ""
    @objc dynamic var age: Int = 0
}
