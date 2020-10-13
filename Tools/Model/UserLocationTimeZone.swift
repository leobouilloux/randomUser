//
//  UserLocationTimeZone.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserLocationTimeZone: Object, Decodable {
    @objc dynamic var offset: String = ""
    @objc dynamic var timezoneDescription: String = ""
    
    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}
