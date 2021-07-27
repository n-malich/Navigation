//
//  FeedViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Selected post")
    let stackView = UIStackView()
    let buttonOnPost1 = UIButton()
    let buttonOnPost2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray3
        self.navigationItem.title = "Feed"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Feed", image: UIImage.init(named: "feed"), tag: 0)
        self.tabBarItem = tabBarItem
        
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        [
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        .forEach {
            $0.isActive = true
        }
        stackView.addArrangedSubview(buttonOnPost1)
        buttonOnPost1.setTitle("Open post 1", for: .normal)
        buttonOnPost1.setTitleColor(.white, for: .normal)
        buttonOnPost1.backgroundColor = .systemBlue
        buttonOnPost1.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonOnPost1.layer.shadowRadius = 4
        buttonOnPost1.layer.shadowColor = UIColor.black.cgColor
        buttonOnPost1.layer.shadowOpacity = 0.7
        buttonOnPost1.addTarget(self, action: #selector(onPostClick), for: .touchUpInside)
        buttonOnPost1.translatesAutoresizingMaskIntoConstraints = false
        [
            buttonOnPost1.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonOnPost1.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonOnPost1.heightAnchor.constraint(equalToConstant: 50),
            buttonOnPost1.widthAnchor.constraint(equalToConstant: 200)
        ]
        .forEach {
            $0.isActive = true
        }
        stackView.addArrangedSubview(buttonOnPost2)
        buttonOnPost2.setTitle("Open post 2", for: .normal)
        buttonOnPost2.setTitleColor(.white, for: .normal)
        buttonOnPost2.backgroundColor = .systemBlue
        buttonOnPost2.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonOnPost2.layer.shadowRadius = 4
        buttonOnPost2.layer.shadowColor = UIColor.black.cgColor
        buttonOnPost2.layer.shadowOpacity = 0.7
        buttonOnPost2.addTarget(self, action: #selector(onPostClick), for: .touchUpInside)
        buttonOnPost2.translatesAutoresizingMaskIntoConstraints = false
        [
            buttonOnPost2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonOnPost2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonOnPost2.heightAnchor.constraint(equalTo: buttonOnPost1.heightAnchor, multiplier: 1),
            buttonOnPost2.widthAnchor.constraint(equalTo: buttonOnPost1.widthAnchor, multiplier: 1)
        ]
        .forEach {
            $0.isActive = true
        }
    }
    
    @objc func onPostClick () {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
