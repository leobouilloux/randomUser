//
//  UserLocationStreet.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserLocationStreet: Object, Decodable {
    @objc dynamic var number: Int = 0
    @objc dynamic var name: String = ""
}
