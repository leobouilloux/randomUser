//
//  UserDetailsViewModel.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import MapKit
import RxCocoa
import RxSwift

final class UserDetailsViewModel: UserDetailsViewModelInterface {
    private let provider: Provider
    private let bag = DisposeBag()

    let fullname: BehaviorRelay<String>
    let gender: BehaviorRelay<String>
    let nationalityFlag: BehaviorRelay<String>
    let email: BehaviorRelay<String>
    let phone: BehaviorRelay<String>
    let cell: BehaviorRelay<String>
    let birthDate: BehaviorRelay<String>
    let age: BehaviorRelay<String>
    let userImage = BehaviorRelay<UIImage>(value: Assets.Image.defaultAvatar)
    
    let locationTitle: BehaviorRelay<String>
    let geoCoordinates: BehaviorRelay<CLLocation?>
    let street: BehaviorRelay<String>
    let country: BehaviorRelay<String>
    let state: BehaviorRelay<String>
    
    let credentialsTitle: BehaviorRelay<String>
    let uuid: BehaviorRelay<String>
    let username: BehaviorRelay<String>
    let password: BehaviorRelay<String>
    
    
    init(provider: Provider, user: UserDTO) {
        self.provider = provider

        self.fullname = BehaviorRelay<String>(value: user.fullname )
        self.gender = BehaviorRelay<String>(value: user.gender )
        self.nationalityFlag = BehaviorRelay<String>(value: user.nationality)
        self.email = BehaviorRelay<String>(value: user.email)
        self.phone = BehaviorRelay<String>(value: user.phone)
        self.cell = BehaviorRelay<String>(value: user.cell)
        self.birthDate = BehaviorRelay<String>(value: user.birthDate)
        self.age = BehaviorRelay<String>(value: user.age)

        self.locationTitle = BehaviorRelay<String>(value: Loc.UserDetails.locationTitle)
        self.geoCoordinates = BehaviorRelay<CLLocation?>(value: user.location?.geoCoordinates ?? CLLocation(latitude: 0, longitude: 0))
        self.street = BehaviorRelay<String>(value: user.location?.street ?? "")
        self.country = BehaviorRelay<String>(value: user.location?.country ?? "")
        self.state = BehaviorRelay<String>(value: user.location?.state ?? "")

        self.credentialsTitle = BehaviorRelay<String>(value: Loc.UserDetails.credentialsTitle)
        self.uuid = BehaviorRelay<String>(value: user.loginInfos?.uuid ?? "")
        self.username = BehaviorRelay<String>(value: user.loginInfos?.username ?? "")
        self.password = BehaviorRelay<String>(value: user.loginInfos?.password ?? "")
        
        if let url = user.largeImageURL {
            self.loadImage(from: url)
        }
    }
    
    func loadImage(from url: URLRequest) {
        URLSession.shared.rx
            .response(request: url)
            .subscribe(onNext: { [weak self] response in
                let image = UIImage(data: response.data) ?? Assets.Image.defaultAvatar
                self?.userImage.accept(image)
            })
            .disposed(by: bag)
    }
}
