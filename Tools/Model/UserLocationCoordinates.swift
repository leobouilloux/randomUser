//
//  UserLocationCoordinates.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserLocationCoordinates: Object, Decodable {
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?
}
