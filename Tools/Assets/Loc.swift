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
    }

    enum SplashScreen {
        static var title = NSLocalizedString("splashScreen.title", comment: "")
        static var avatarCaption = NSLocalizedString("splashScreen.avatarCaption", comment: "")
    }
}
