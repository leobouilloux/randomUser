//
//  UserDetailsViewController.swift
//  RandomUser
//
//  Created by Leo Marcotte on 07/10/2020.
//

import MapKit
import UIKit

final class UserDetailsViewController: RxViewController {
    private let viewModel: UserDetailsViewModelInterface
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let userInfoView = UIView()
    private let userImageView = UIImageView()
    private let userInfoSeparatorView = UIView()
    private let nationalityLabel = UILabel()
    private let genderLabel = UILabel()
    private let fullnameLabel = UILabel()

    
    private let birthDateLabel = UILabel()
    private let ageLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let cellLabel = UILabel()

    private let locationShadowView = UIView()
    private let userLocationView = UIView()
    private let locationTitleLabel = UILabel()
    private let mapView = MKMapView()
    private var mapViewHeightConstraint: NSLayoutConstraint?
    private let addressLabel = UILabel()
    private let stateLabel = UILabel()
    private let countryLabel = UILabel()
    
    private let userLoginView = UIView()
    private let credentialsTitleLabel = UILabel()
    private let idLabel = UILabel()
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    
    init(with viewModel: UserDetailsViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupRxBindings()
    }
}

private extension UserDetailsViewController {
    /* SetupView */
    func setupView() {
        view.backgroundColor = .tertiarySystemBackground
        setupScrollView()
    }
    
    func setupScrollView() {
        scrollView.bounces = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        view.addSubview(scrollView)
        
        setupContentView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupContentView() {
        scrollView.addSubview(contentView)

        setupUserInfoView()
        setupUserLoginView()
        setupLocationShadowView()

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupUserInfoView() {
        userInfoView.backgroundColor = .systemBackground
        contentView.addSubview(userInfoView)
        
        setupUserImageView()
        setupUserGenderLabel()
        setupUserNationalityLabel()
        setupFullnameLabel()
        setupUserInfoSeparatorView()
        setupBirthDateLabel()
        setupAgeLabel()
        setupPhoneLabel()
        setupCellLabel()
        setupEmailLabel()
        
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
        
        userInfoView.layer.cornerRadius = 8
        userInfoView.layer.shadowColor = UIColor.black.cgColor
        userInfoView.layer.shadowOffset = CGSize(width: 3, height: 3)
        userInfoView.layer.shadowOpacity = 0.4
        userInfoView.layer.shadowRadius = 10.0
    }
    
    func setupUserImageView() {
        userImageView.backgroundColor = .gray
        userInfoView.addSubview(userImageView)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 8),
            userImageView.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 8),
            userImageView.widthAnchor.constraint(equalToConstant: 90),
            userImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 45
    }
    
    func setupUserGenderLabel() {
        genderLabel.font = .systemFont(ofSize: 28)
        userInfoView.addSubview(genderLabel)
        
        
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genderLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            genderLabel.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            genderLabel.widthAnchor.constraint(equalToConstant: 32),
            genderLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setupUserNationalityLabel() {
        nationalityLabel.font = .systemFont(ofSize: 28)
        userInfoView.addSubview(nationalityLabel)
        
        nationalityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nationalityLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nationalityLabel.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            nationalityLabel.widthAnchor.constraint(equalToConstant: 32),
            nationalityLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setupFullnameLabel() {
        fullnameLabel.textColor = .label
        fullnameLabel.font = .boldSystemFont(ofSize: 28)
        fullnameLabel.numberOfLines = 0
        fullnameLabel.lineBreakMode = .byTruncatingTail
        userInfoView.addSubview(fullnameLabel)
        
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullnameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            fullnameLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -8),
            fullnameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            fullnameLabel.topAnchor.constraint(greaterThanOrEqualTo: userImageView.topAnchor),
            fullnameLabel.bottomAnchor.constraint(lessThanOrEqualTo: userImageView.bottomAnchor)
        ])
    }
    
    func setupUserInfoSeparatorView() {
        userInfoSeparatorView.backgroundColor = .tertiaryLabel
        userInfoView.addSubview(userInfoSeparatorView)
        
        userInfoSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoSeparatorView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            userInfoSeparatorView.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 8),
            userInfoSeparatorView.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -8),
            userInfoSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupBirthDateLabel() {
        birthDateLabel.textColor = .secondaryLabel
        birthDateLabel.font = .systemFont(ofSize: 18)
        userInfoView.addSubview(birthDateLabel)
        
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthDateLabel.topAnchor.constraint(equalTo: userInfoSeparatorView.bottomAnchor,constant: 16),
            birthDateLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 8),
            birthDateLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: -8)
        ])
    }
    
    func setupAgeLabel() {
        ageLabel.textColor = .secondaryLabel
        ageLabel.font = .systemFont(ofSize: 18)
        userInfoView.addSubview(ageLabel)
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor,constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 8),
            ageLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: -8)
        ])
    }

    func setupPhoneLabel() {
        phoneLabel.textColor = .secondaryLabel
        phoneLabel.font = .systemFont(ofSize: 18)
        userInfoView.addSubview(phoneLabel)
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor,constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 8),
            phoneLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: -8)
        ])
    }
    
    func setupCellLabel() {
        cellLabel.textColor = .secondaryLabel
        cellLabel.font = .systemFont(ofSize: 18)
        userInfoView.addSubview(cellLabel)
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 8),
            cellLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: -8),
            cellLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,constant: 8)
        ])

    }
    
    func setupEmailLabel() {
        emailLabel.textColor = .secondaryLabel
        emailLabel.font = .systemFont(ofSize: 18)
        userInfoView.addSubview(emailLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: -8),
            emailLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor,constant: 8),
            emailLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupLocationShadowView() {
        locationShadowView.backgroundColor = .clear
        contentView.addSubview(locationShadowView)
        
        setupUserLocationView()
        
        locationShadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationShadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            locationShadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            locationShadowView.topAnchor.constraint(equalTo: userLoginView.bottomAnchor, constant: 16),
            locationShadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
        
        locationShadowView.layer.cornerRadius = 8
        locationShadowView.layer.shadowColor = UIColor.black.cgColor
        locationShadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
        locationShadowView.layer.shadowOpacity = 0.4
        locationShadowView.layer.shadowRadius = 10.0
    }
    
    func setupUserLocationView() {
        userLocationView.backgroundColor = .systemBackground
        locationShadowView.addSubview(userLocationView)
        
        setupLocationTitleLabel()
        setupMapView()
        setupAdressLabel()
        setupStateLabel()
        setupCountryLabel()
        
        userLocationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocationView.leadingAnchor.constraint(equalTo: locationShadowView.leadingAnchor),
            userLocationView.trailingAnchor.constraint(equalTo: locationShadowView.trailingAnchor),
            userLocationView.topAnchor.constraint(equalTo: locationShadowView.topAnchor),
            userLocationView.bottomAnchor.constraint(equalTo: locationShadowView.bottomAnchor),
        ])
        
        userLocationView.layer.masksToBounds = true
        userLocationView.layer.cornerRadius = 8
    }

    func setupLocationTitleLabel() {
        locationTitleLabel.textColor = .label
        locationTitleLabel.font = .boldSystemFont(ofSize: 24)
        userLocationView.addSubview(locationTitleLabel)
        
        locationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTitleLabel.leadingAnchor.constraint(equalTo: userLocationView.leadingAnchor,constant: 8),
            locationTitleLabel.trailingAnchor.constraint(equalTo: userLocationView.trailingAnchor,constant: -8),
            locationTitleLabel.topAnchor.constraint(equalTo: userLocationView.topAnchor,constant: 8)
        ])
    }
    
    func setupMapView() {
        mapView.isUserInteractionEnabled = false
        userLocationView.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = mapView.heightAnchor.constraint(equalToConstant: 0)
        mapViewHeightConstraint = heightConstraint
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: userLocationView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: userLocationView.trailingAnchor),
            heightConstraint
        ])
        
        mapView.layer.masksToBounds = true
        mapView.layer.cornerRadius = 8
    }
    
    func setupAdressLabel() {
        addressLabel.textColor = .secondaryLabel
        addressLabel.font = .systemFont(ofSize: 18)
        userLocationView.addSubview(addressLabel)
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: userLocationView.leadingAnchor,constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: userLocationView.trailingAnchor,constant: -8),
            addressLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor,constant: 16)
        ])
    }
    
    func setupStateLabel() {
        stateLabel.textColor = .secondaryLabel
        stateLabel.font = .systemFont(ofSize: 18)
        userLocationView.addSubview(stateLabel)
        
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.leadingAnchor.constraint(equalTo: userLocationView.leadingAnchor,constant: 8),
            stateLabel.trailingAnchor.constraint(equalTo: userLocationView.trailingAnchor,constant: -8),
            stateLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant: 8)
        ])
    }
    
    func setupCountryLabel() {
        countryLabel.textColor = .secondaryLabel
        countryLabel.font = .systemFont(ofSize: 18)
        userLocationView.addSubview(countryLabel)
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryLabel.leadingAnchor.constraint(equalTo: userLocationView.leadingAnchor,constant: 8),
            countryLabel.trailingAnchor.constraint(equalTo: userLocationView.trailingAnchor,constant: -8),
            countryLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor,constant: 8),
            countryLabel.bottomAnchor.constraint(equalTo: userLocationView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupUserLoginView() {
        userLoginView.backgroundColor = .systemBackground
        contentView.addSubview(userLoginView)
        
        setupCredentialsTitleLabel()
        setupIdLabel()
        setupLoginLabel()
        setupPasswordLabel()
        
        userLoginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLoginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userLoginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userLoginView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 16),
        ])
        
        userLoginView.layer.cornerRadius = 8
        userLoginView.layer.shadowColor = UIColor.black.cgColor
        userLoginView.layer.shadowOffset = CGSize(width: 3, height: 3)
        userLoginView.layer.shadowOpacity = 0.4
        userLoginView.layer.shadowRadius = 10.0
    }
    
    func setupCredentialsTitleLabel() {
        credentialsTitleLabel.textColor = .label
        credentialsTitleLabel.font = .boldSystemFont(ofSize: 24)
        userLoginView.addSubview(credentialsTitleLabel)
        
        credentialsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            credentialsTitleLabel.leadingAnchor.constraint(equalTo: userLoginView.leadingAnchor,constant: 8),
            credentialsTitleLabel.trailingAnchor.constraint(equalTo: userLoginView.trailingAnchor,constant: -8),
            credentialsTitleLabel.topAnchor.constraint(equalTo: userLoginView.topAnchor,constant: 8)
        ])
    }
    
    func setupIdLabel() {
        idLabel.textColor = .secondaryLabel
        idLabel.font = .systemFont(ofSize: 18)
        userLoginView.addSubview(idLabel)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: credentialsTitleLabel.bottomAnchor,constant: 16),
            idLabel.leadingAnchor.constraint(equalTo: userLoginView.leadingAnchor,constant: 8),
            idLabel.trailingAnchor.constraint(equalTo: userLoginView.trailingAnchor,constant: -8)
        ])
    }

    func setupLoginLabel() {
        loginLabel.textColor = .secondaryLabel
        loginLabel.font = .systemFont(ofSize: 18)
        userLoginView.addSubview(loginLabel)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: userLoginView.leadingAnchor,constant: 8),
            loginLabel.trailingAnchor.constraint(equalTo: userLoginView.trailingAnchor,constant: -8),
            loginLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor,constant: 8)
        ])
    }
    
    func setupPasswordLabel() {
        passwordLabel.textColor = .secondaryLabel
        passwordLabel.font = .systemFont(ofSize: 18)
        userLoginView.addSubview(passwordLabel)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: userLoginView.leadingAnchor,constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: userLoginView.trailingAnchor,constant: -8),
            passwordLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,constant: 8),
            passwordLabel.bottomAnchor.constraint(equalTo: userLoginView.bottomAnchor,constant: -16)
        ])
    }
    
    
    /* Rx Bindings */
    func setupRxBindings() {
        viewModel.fullname.bind(to: navigationItem.rx.title).disposed(by: bag)
        
        viewModel.userImage.bind(to: userImageView.rx.image).disposed(by: bag)
        viewModel.gender.bind(to: genderLabel.rx.text).disposed(by: bag)
        viewModel.nationalityFlag.bind(to: nationalityLabel.rx.text).disposed(by: bag)
        viewModel.fullname.bind(to: fullnameLabel.rx.text).disposed(by: bag)
        viewModel.birthDate.bind(to: birthDateLabel.rx.text).disposed(by: bag)
        viewModel.age.bind(to: ageLabel.rx.text).disposed(by: bag)
        viewModel.phone.bind(to: phoneLabel.rx.text).disposed(by: bag)
        viewModel.cell.bind(to: cellLabel.rx.text).disposed(by: bag)
        viewModel.email.bind(to: emailLabel.rx.text).disposed(by: bag)
        
        
        viewModel.locationTitle.bind(to: locationTitleLabel.rx.text).disposed(by: bag)
        viewModel.geoCoordinates
            .subscribe(onNext:{ [weak self] coordinates in
                if let coordinates = coordinates {
                    self?.mapViewHeightConstraint?.constant = 200
                    DispatchQueue.main.async {
                        let anotation = MKPointAnnotation()
                        anotation.coordinate = CLLocationCoordinate2D(
                            latitude: coordinates.coordinate.latitude,
                            longitude: coordinates.coordinate.longitude
                        )
                        self?.mapView.addAnnotation(anotation)
                        self?.mapView.centerToLocation(coordinates)
                    }
                } else {
                    self?.mapViewHeightConstraint?.constant = 0
                }
            })
            .disposed(by: bag)
        viewModel.street.bind(to: addressLabel.rx.text).disposed(by: bag)
        viewModel.state.bind(to: stateLabel.rx.text).disposed(by: bag)
        viewModel.country.bind(to: countryLabel.rx.text).disposed(by: bag)
        
        
        viewModel.credentialsTitle.bind(to: credentialsTitleLabel.rx.text).disposed(by: bag)
        viewModel.uuid.bind(to: idLabel.rx.text).disposed(by: bag)
        viewModel.username.bind(to: loginLabel.rx.text).disposed(by: bag)
        viewModel.password.bind(to: passwordLabel.rx.text).disposed(by: bag)
    }
}
