//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileHeaderView = ProfileHeaderView()
    let newButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(named: "profile"), tag: 1)
        self.tabBarItem = tabBarItem
        
        self.view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        [
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ]
        .forEach {
            $0.isActive = true
        }
        self.view.addSubview(newButton)
        newButton.setTitle("New button", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.backgroundColor = .systemBlue
        newButton.layer.cornerRadius = 4
        newButton.translatesAutoresizingMaskIntoConstraints = false
        [
            newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        .forEach {
            $0.isActive = true
        }
    }
    //Скрытие keyboard при нажатии за пределами TextField в ProfileViewController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            profileHeaderView.endEditing(true)
        }
    }
}
