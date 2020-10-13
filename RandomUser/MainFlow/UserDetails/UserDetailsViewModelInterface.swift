//
//  UserDetailsViewModelInterface.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import MapKit
import RxCocoa

protocol UserDetailsViewModelInterface {
    var fullname: BehaviorRelay<String> { get }
    var gender: BehaviorRelay<String> { get }
    var nationalityFlag: BehaviorRelay<String> { get }
    var email: BehaviorRelay<String> { get }
    var phone: BehaviorRelay<String> { get }
    var cell: BehaviorRelay<String> { get }
    var birthDate: BehaviorRelay<String> { get }
    var age: BehaviorRelay<String> { get }
    var userImage: BehaviorRelay<UIImage> { get }

    var locationTitle: BehaviorRelay<String> { get }
    var geoCoordinates: BehaviorRelay<CLLocation?> { get }
    var street: BehaviorRelay<String> { get }
    var country: BehaviorRelay<String> { get }
    var state: BehaviorRelay<String> { get }

    var credentialsTitle: BehaviorRelay<String> { get }
    var uuid: BehaviorRelay<String> { get }
    var username: BehaviorRelay<String> { get }
    var password: BehaviorRelay<String> { get }
}
