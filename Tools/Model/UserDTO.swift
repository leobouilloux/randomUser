//
//  UserDTO.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import Foundation
import MapKit

struct UserDTO {
    let fullname: String
    let gender: String
    let largeImageURL: URLRequest
    let mediumImageURL: URLRequest
    let nationality: String
    let email: String
    let phone: String
    let cell: String
    let location: UserLocationDTO
    let loginInfos: UserLoginDTO
    let birthDate: String
    let age: String
    
    struct UserLoginDTO {
        let uuid: String
        let username: String
        let password: String
        
        init(with userLogin: User.UserLogin) {
            self.uuid = "🆔 \(userLogin.uuid)"
            self.username = "🧑‍💻 \(userLogin.username)"
            self.password = "🔐 \(userLogin.password)"
        }
    }
    
    struct UserLocationDTO {
        let geoCoordinates: CLLocation?
        let street: String
        let country: String
        let state: String
        
        init(with userLocation: User.UserLocation) {
            if let latitudeStr = userLocation.coordinates.latitude,
               let longitudeStr = userLocation.coordinates.longitude,
               let latitude = CLLocationDegrees(latitudeStr),
               let longitude = CLLocationDegrees(longitudeStr) {
                self.geoCoordinates = CLLocation(latitude: latitude, longitude: longitude)
            } else {
                self.geoCoordinates = nil
            }
            self.street = "🏠 \(userLocation.street.number), \(userLocation.street.name)"
            self.state = "🏠 \(userLocation.postcode), \(userLocation.state)"
            self.country = "🌍 \(userLocation.country)"
        }
    }
    
    init(with user: User) {
        self.location = UserLocationDTO(with: user.location)
        self.loginInfos = UserLoginDTO(with: user.login)
        
        self.fullname = "\(user.name.first) \(user.name.last)"
        
        switch user.gender {
        case "male": gender = "👨"
        case "female": gender = "👩"
        default: gender = "🧑" // neutral sex
        }
        
        self.largeImageURL = URLRequest(url: user.picture.large)
        self.mediumImageURL = URLRequest(url: user.picture.medium)
        self.email = "📧 \(user.email)"
        self.phone = "📞 \(user.phone)"
        self.cell = "📱 \(user.cell)"
        self.nationality = getEmojiFlag(with: user.nat)
        
        self.birthDate = "👶 \(user.dob.date)"
        self.age = "🎂 \(user.dob.age)"
    }
}

fileprivate func getEmojiFlag(with countryCode: String) -> String {
    return countryCode
        .unicodeScalars
        .map({ 127397 + $0.value })
        .compactMap(UnicodeScalar.init)
        .map(String.init)
        .joined()
}
