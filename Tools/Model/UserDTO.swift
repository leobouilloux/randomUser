//
//  UserDTO.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import Foundation
import MapKit

class UserDTO {
    let fullname: String
    let gender: String
    var largeImageURL: URLRequest?
    var mediumImageURL: URLRequest?
    let nationality: String
    let email: String
    let phone: String
    let cell: String
    let location: UserLocationDTO?
    let loginInfos: UserLoginDTO?
    let birthDate: String
    let age: String
    
    struct UserLoginDTO {
        let uuid: String
        let username: String
        let password: String
        
        init(with userLogin: UserLogin) {
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
        
        init(with userLocation: UserLocation) {
            if
                let latitudeStr = userLocation.coordinates?.latitude,
                let longitudeStr = userLocation.coordinates?.longitude,
                let latitude = CLLocationDegrees(latitudeStr),
                let longitude = CLLocationDegrees(longitudeStr) {
                self.geoCoordinates = CLLocation(latitude: latitude, longitude: longitude)
            } else {
                self.geoCoordinates = nil
            }
            self.street = "🏠 \(userLocation.street?.number ?? 0), \(userLocation.street?.name ?? "")"
            self.state = "🏠 \(userLocation.postcode), \(userLocation.state)"
            self.country = "🌍 \(userLocation.country)"
        }
    }
    
    init(with user: User) {
        if let userLocation = user.location {
            self.location = UserLocationDTO(with: userLocation)
        } else {
            self.location = nil
        }
        if let userLogin = user.login {
            self.loginInfos = UserLoginDTO(with: userLogin)
        } else {
            self.loginInfos = nil
        }

        if let userName = user.name {
            self.fullname = "\(userName.first) \(userName.last)"
        } else {
            self.fullname = ""
        }
        
        
        switch user.gender {
        case "male": gender = "👨"
        case "female": gender = "👩"
        default: gender = "🧑" // neutral sex
        }
        
        if
            let userPicture = user.picture,
            let largeImageURL = URL(string: userPicture.large),
            let mediumImageURL = URL(string: userPicture.medium) {
            self.largeImageURL = URLRequest(url: largeImageURL)
            self.mediumImageURL = URLRequest(url: mediumImageURL)
        }
        self.email = "📧 \(user.email)"
        self.phone = "📞 \(user.phone)"
        self.cell = "📱 \(user.cell)"
        self.nationality = getEmojiFlag(with: user.nat)
        
        if let userDOB = user.dob {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let inputDate = inputFormatter.date(from: userDOB.date) ?? Date()
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MM/yyyy"
            let outputDate =  outputFormatter.string(from: inputDate)
            
            self.birthDate = "👶 \(outputDate)"
            self.age = "🎂 \(Loc.UserDetails.yearsOld(p1: "\(userDOB.age)"))"
        } else {
            self.birthDate = ""
            self.age = ""

        }
        
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
