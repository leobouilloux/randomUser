//
//  Assets.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

enum Assets {
    enum SplashScreen {
        static var avatar = UIImage(named: "avatar") ?? UIImage()
    }

    enum Icons {
        static var error = UIImage(systemName: "exclamationmark.circle.fill") ?? UIImage()
        static var warning = UIImage(systemName: "exclamationmark.triangle.fill") ?? UIImage()
        static var success = UIImage(systemName: "checkmark.circle.fill") ?? UIImage()
        static var info = UIImage(systemName: "info.circle.fill") ?? UIImage()

        static var chevronLeft = UIImage(systemName: "chevron.backward") ?? UIImage()
        static var close = UIImage(systemName: "xmark") ?? UIImage()
    }
}
