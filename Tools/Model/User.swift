//
//  User.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import Foundation

struct RandomUserData: Decodable {
    var info: RandomUserInfo
    var results: [User]
    
    struct RandomUserInfo: Decodable {
        var seed: String
        var page: Int
        var results: Int
        var version: String
    }
}

struct User: Decodable {
    var gender: String
    var nat: String
    var phone: String
    var cell: String
    var email: String
    
    
    var name: UserName
    var location: UserLocation
    var login: UserLogin
    var dob: UserDOB
    var registered: UserRegistered
    
    var id: UserId
    var picture: UserPicture
    
    struct UserName: Decodable {
        var title: String
        var first: String
        var last: String
    }
    
    struct UserLocation: Decodable {
        var city: String
        var state: String
        var country: String
        var postcode: String
        var street: UserLocationStreet
        var coordinates: UserLocationCoordinates
        var timezone: UserLocationTimeZone
        
        enum CodingKeys: String, CodingKey {
            case city
            case state
            case country
            case postcode
            case street
            case coordinates
            case timezone
        }
                
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.city = try container.decode(String.self, forKey: .city)
            self.state = try container.decode(String.self, forKey: .state)
            self.country = try container.decode(String.self, forKey: .country)
            self.street = try container.decode(UserLocationStreet.self, forKey: .street)
            self.coordinates = try container.decode(UserLocationCoordinates.self, forKey: .coordinates)
            self.timezone = try container.decode(UserLocationTimeZone.self, forKey: .timezone)
            
            do {
                let postcode = try container.decode(Int.self, forKey: .postcode)
                self.postcode = String(postcode)
            } catch DecodingError.typeMismatch {
                self.postcode = try container.decode(String.self, forKey: .postcode)
            }
        }
    
        struct UserLocationStreet: Decodable {
            var number: Int
            var name: String
        }
        
        struct UserLocationCoordinates: Decodable {
            var lattitude: String?
            var longitude: String?
        }
        
        struct UserLocationTimeZone: Decodable {
            var offset: String
            var description: String
        }
    }
    
    struct UserLogin: Decodable {
        var uuid: String
        var username: String
        var password: String
        var salt: String
        var md5: String
        var sha1: String
        var sha256: String
    }

    struct UserDOB: Decodable {
        var date: String
        var age: Int
    }

    struct UserRegistered: Decodable {
        var date: String
        var age: Int
    }

    struct UserId: Decodable {
        var name: String
        var value: String?
    }

    struct UserPicture: Decodable {
        var thumbnail: URL
        var medium: URL
        var large: URL
    }
}


