//
//  UserPicture.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserPicture: Object, Decodable {
    @objc dynamic var thumbnail: String
    @objc dynamic var medium: String
    @objc dynamic var large: String
}
