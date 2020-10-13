//
//  UserTableViewCellViewModel.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxCocoa
import RxSwift

final class UserTableViewCellViewModel: UserTableViewCellViewModelInterface {
    let name: BehaviorRelay<String>
    let userImage: BehaviorRelay<UIImage>
    private let bag = DisposeBag()
    
    init(user: UserDTO) {
        self.name = BehaviorRelay<String>(value: user.fullname)
        self.userImage = BehaviorRelay<UIImage>(value: Assets.Image.defaultAvatar)
        
        if let url = user.mediumImageURL {
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
