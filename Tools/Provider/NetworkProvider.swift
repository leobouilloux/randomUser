//
//  NetworkProvider.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

import Alamofire
import RealmSwift

private enum Endpoint {
    var baseURL: URL {
        guard let url = URL(string: "https://randomuser.me/api/") else { fatalError("Endpoint base url is not valid") }
        return url
    }

    case randomUsers(results: Int = 10)
    
    var urlString: String {
        switch self {
        case let .randomUsers(results): return baseURL.appendingPathComponent("?results=\(results)").absoluteString
        }
    }
}

class NetworkProvider: Provider {
    let realmManager: Realm? = try? Realm()
}
