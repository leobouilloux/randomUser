//
//  UserName.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserName: Object, Decodable {
    @objc dynamic var title: String = ""
    @objc dynamic var first: String = ""
    @objc dynamic var last: String = ""
}
