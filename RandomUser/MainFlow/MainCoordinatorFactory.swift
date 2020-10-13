//
//  MainCoordinatorFactory.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

extension CoordinatorFactory {
    func makeMainCoordinator(
        with provider: Provider,
        navController: NavigationController? = nil,
        coordinatorFactory: CoordinatorFactory = CoordinatorFactory()
        ) -> MainCoordinator {
        let coordinator = MainCoordinator(router: router(navController),
                                               factory: MainFactory(),
                                               coordinatorFactory: coordinatorFactory,
                                               provider: provider)
        return coordinator
    }
}
