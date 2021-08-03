//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = {
        let profile = ProfileHeaderView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    let someButton: UIButton = {
        let button = UIButton()
        button.setTitle("Some button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
}

extension ProfileViewController {
    private func setupViews(){
        
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(someButton)
    }
}

extension ProfileViewController {
    private func setupConstraints(){
        [
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            someButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            someButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            someButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            someButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        .forEach {$0.isActive = true}
    }
}
    
extension ProfileViewController {
    //Скрытие keyboard при нажатии за пределами TextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            profileHeaderView.endEditing(true)
        }
    }
}
