//
//  SplashScreenCoordinatorFactory.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//  Copyright © 2020 Leo Marcotte. All rights reserved.
//

extension CoordinatorFactory {
    func makeSplashScreenCoordinator(
        with provider: Provider,
        navController: NavigationController? = nil,
        coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
        ) -> SplashScreenCoordinator {
        let coordinator = SplashScreenCoordinator(router: router(navController),
                                               factory: SplashScreenFactory(),
                                               coordinatorFactory: coordinatorFactory,
                                               provider: provider)
        return coordinator
    }
}
