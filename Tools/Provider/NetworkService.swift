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
    static var baseURL: URL {
        guard let url = URL(string: "https://randomuser.me/api/") else { fatalError("Endpoint base url is not valid") }
        return url
    }

    case randomUsers(results: Int = 10)
}

class NetworkService: Service {
    func getUsers(completion: @escaping ((Result<[User], Error>) -> Void)) {
        let parameters: Parameters = [
            "results": 10
        ]
        
        AF.request(Endpoint.baseURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default
        )
            .validate()
            .responseJSON { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let json = try decoder.decode(RandomUserData.self, from: data)
                        completion(.success(json.results))
                    } catch {
                        completion(.failure(NetworkError.jsonDecodeFailed))
                    }
                } else if let error = response.error {
                    print(error.localizedDescription)
                    completion(.failure(NetworkError.errorReceived))
                } else {
                    completion(.failure(NetworkError.noDataReceived))
                }
            }
    }
}
