//
//  UserTableViewCellViewModelInterface.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxCocoa

protocol UserTableViewCellViewModelInterface {
    var name: BehaviorRelay<String> { get }
    var userImage: BehaviorRelay<UIImage> { get }
}
