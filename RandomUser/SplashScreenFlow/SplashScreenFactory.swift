//
//  SplashScreenFactory.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

final class SplashScreenFactory {
    func makeSplashScreenPresentable(with viewModel: SplashScreenViewModelInterface) -> Presentable {
        return SplashScreenViewController(with: viewModel)
    }
}
