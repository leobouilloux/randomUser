//
//  Loc.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import Foundation

enum Loc {
    enum Error {
        static var noDataReceived = NSLocalizedString("error.noDataReceived", comment: "")
        static var jsonDecodeFailed = NSLocalizedString("error.jsonDecodeFailed", comment: "")
        static var errorReceived = NSLocalizedString("error.errorReceived", comment: "")
        static var cannotWriteToDatabase = NSLocalizedString("error.cannotWriteToDatabase", comment: "")
        static var cannotWipeDatabase = NSLocalizedString("error.cannotWipeDatabase", comment: "")
    }

    enum SplashScreen {
        static var title = NSLocalizedString("splashScreen.title", comment: "")
        static var avatarCaption = NSLocalizedString("splashScreen.avatarCaption", comment: "")
    }
    
    enum UsersList {
        static var refresh = NSLocalizedString("UsersList.refresh", comment: "")
    }
    
    enum UserDetails {
        static var locationTitle = NSLocalizedString("UserDetails.locationTitle", comment: "")
        static var credentialsTitle = NSLocalizedString("UserDetails.credentialsTitle", comment: "")
        
        static func yearsOld(p1: String) -> String {
            return String(format: NSLocalizedString("UserDetails.yearsOld", comment: ""), p1)
        }
    }
}
