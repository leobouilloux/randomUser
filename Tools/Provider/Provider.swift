//
//  Provider.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

import Foundation
import RealmSwift

protocol Provider {
    var realmManager: Realm? { get }
}
