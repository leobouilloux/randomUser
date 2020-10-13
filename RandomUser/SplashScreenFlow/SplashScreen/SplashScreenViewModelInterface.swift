//
//  SplashScreenViewModelInterface.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

import RxCocoa

protocol SplashScreenViewModelInterface {
    var title: BehaviorRelay<String> { get }
    var avatarImage: BehaviorRelay<UIImage> { get }
    var caption: BehaviorRelay<String> { get }

    var output: SplashScreenOutput { get }
}
