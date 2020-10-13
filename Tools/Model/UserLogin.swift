//
//  UserLogin.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserLogin: Object, Decodable {
    @objc dynamic var uuid: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var salt: String = ""
    @objc dynamic var md5: String = ""
    @objc dynamic var sha1: String = ""
    @objc dynamic var sha256: String = ""
}
