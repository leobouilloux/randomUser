//
//  DataProvider.swift
//  RandomUser
//
//  Created by Leo Marcotte on 13/10/2020.
//

import RealmSwift

final class DataProvider: Provider {
    private let realm: Realm
    private let service: Service
    
    init(service: Service) {
        self.service = service
        guard let realm = try? Realm() else { fatalError("Couldn't initiate realm DB") }
        self.realm = realm
    }
    
    func getUsers() -> [UserDTO] {
        return Array(realm.objects(User.self)).compactMap({ UserDTO(with: $0) })
    }
    
    func fetchUsers(completion: @escaping ((Result<[UserDTO], Error>) -> Void)) {
        service.getUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(users):
                do {
                    try self.realm.write {
                        self.realm.add(users)
                    }
                    completion(.success(self.getUsers()))
                } catch {
                    completion(.failure(ProviderError.cannotWriteToDatabase))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func refreshDatabase(completion: @escaping ((Result<[UserDTO], Error>) -> Void)) {
        do {
            try realm.write {
                realm.deleteAll()
            }
            self.fetchUsers(completion: completion)
        } catch {
            completion(.failure(ProviderError.cannotWipeDatabase))
        }
    }
}
