//
//  UserLocation.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

class UserLocation: Object, Decodable {
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var postcode: String = ""
    @objc dynamic var street: UserLocationStreet?
    @objc dynamic var coordinates: UserLocationCoordinates?
    @objc dynamic var timezone: UserLocationTimeZone?
    
    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
        case postcode
        case street
        case coordinates
        case timezone
    }
            
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
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
}
