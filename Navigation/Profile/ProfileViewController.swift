//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(named: "profile"), tag: 1)
        self.tabBarItem = tabBarItem
        
        self.view.addSubview(self.profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }
}
