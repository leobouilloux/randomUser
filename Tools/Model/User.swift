//
//  User.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RealmSwift

class User: Object, Decodable {
    @objc dynamic var gender: String = ""
    @objc dynamic var nat: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var cell: String = ""
    @objc dynamic var email: String = ""
    
    @objc dynamic var name: UserName?
    @objc dynamic var location: UserLocation?
    @objc dynamic var login: UserLogin?
    @objc dynamic var dob: UserDOB?
    @objc dynamic var registered: UserRegistered?

    @objc dynamic var id: UserId?
    @objc dynamic var picture: UserPicture?
}


