//
//  UserId.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserId: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var value: String?
}
