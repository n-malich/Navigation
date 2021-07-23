//
//  FeedViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Selected post")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray3
        self.navigationItem.title = "Feed"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Feed",
                                  image: UIImage.init(named: "feed"),
                                  tag: 0)
        self.tabBarItem = tabBarItem
        
        let buttonPost = UIButton(frame: CGRect(x: 125, y: 350, width: 200, height: 50))
        buttonPost.setTitle("Open post", for: .normal)
        buttonPost.setTitleColor(.white, for: .normal)
        buttonPost.backgroundColor = .systemBlue
        buttonPost.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonPost.layer.shadowRadius = 4
        buttonPost.layer.shadowColor = UIColor.black.cgColor
        buttonPost.layer.shadowOpacity = 0.7
        buttonPost.addTarget(self, action: #selector(onPostClick), for: .touchUpInside)
        view.addSubview(buttonPost)
    }
    
    @objc func onPostClick () {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
    
}
