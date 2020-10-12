//
//  UserTableViewCell.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import UIKit

final class UserTableViewCell: RxTableViewCell {
    private let userView = UIView()
    private let userImageView = UIImageView()
    private let nameLabel = UILabel()

    var viewModel: UserTableViewCellViewModelInterface?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
    }

    func setup(with viewModel: UserTableViewCellViewModelInterface) {
        self.viewModel = viewModel

        setupView()
        setupRxBindings(with: viewModel)
    }
}

private extension UserTableViewCell {
    /* View */
    func setupView() {
        backgroundColor = .clear
        setupUserView()
        setupUserImageView()
        setupNameLabel()
    }
    
    func setupUserView() {
        userView.backgroundColor = .systemBackground
        addSubview(userView)
        
        userView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            userView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
//        userView.layer.masksToBounds = true
        userView.layer.cornerRadius = 8
        userView.layer.shadowColor = UIColor.black.cgColor
        userView.layer.shadowOffset = CGSize(width: 3, height: 3)
        userView.layer.shadowOpacity = 0.4
        userView.layer.shadowRadius = 10.0
    }
    
    func setupUserImageView() {
        userImageView.backgroundColor = .tertiarySystemFill
        userImageView.tintColor = .tertiaryLabel
        userView.addSubview(userImageView)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: userView.topAnchor, constant: 8),
            userImageView.bottomAnchor.constraint(equalTo: userView.bottomAnchor, constant: -8),
            userImageView.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalToConstant: 64),
            userImageView.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 32
    }
    
    func setupNameLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        userView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -8),
            nameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor)
        ])
    }

    /* Rx Bindings */
    func setupRxBindings(with viewModel: UserTableViewCellViewModelInterface) {
        bindUserImageView(with: viewModel)
        bindNameLabel(with: viewModel)
    }

    func bindUserImageView(with viewModel: UserTableViewCellViewModelInterface) {
        viewModel.userImage.bind(to: userImageView.rx.image).disposed(by: bag)
    }

    func bindNameLabel(with viewModel: UserTableViewCellViewModelInterface) {
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: bag)
    }
}
