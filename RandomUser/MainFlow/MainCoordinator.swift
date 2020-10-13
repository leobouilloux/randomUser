//
//  MainCoordinator.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import RxSwift

final class MainCoordinator: BaseCoordinator {
    private let factory: MainFactory
    private let coordinatorFactory: CoordinatorFactory
    private let provider: Provider
    private let bag = DisposeBag()

    init(router: Router, factory: MainFactory, coordinatorFactory: CoordinatorFactory, provider: Provider) {
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
        self.provider = provider
        super.init(router: router)
    }

    override func start(with option: DeepLinkOption? = nil, presentationType: PresentationType = .root) {
        setupRoot(presentationType: presentationType)
    }
}

private extension MainCoordinator {
    func setupRoot(presentationType: PresentationType) {
        let viewModel = UsersListViewModel(provider: provider)
        viewModel.output.userSelected.subscribe(onNext: { [weak self] user in
            self?.showUserDetails(user: user, presentationType: .push)
        })
        .disposed(by: bag)

        let presentable = factory.makeUsersListPresentable(with: viewModel)
        router.navigate(to: presentable, with: presentationType)
    }

    func showUserDetails(user: UserDTO, presentationType: PresentationType) {
        let viewModel = UserDetailsViewModel(provider: provider, user: user)

        let presentable = factory.makeUserDetailsPresentable(with: viewModel)
        router.navigate(to: presentable, with: presentationType)
    }

    /* Outputs */
    private func bindOutputs() {
        
    }
}
