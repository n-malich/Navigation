//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali Mizina on 15.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let headerView = ProfileHeaderView()
    
    let postID = String(describing: PostTableViewCell.self)
    let photosID = String(describing: PhotosTableViewCell.self)
    
    private var arrayOFPosts = PostsVK().postsArray
        
    override func viewDidLoad() {
        super .viewDidLoad()

        setupViews()
        setupConstraints()
    }
}

extension ProfileViewController {
    private func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosID)
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
    }
}

extension ProfileViewController {
    private func setupConstraints() {
        [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        .forEach {$0.isActive = true}
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOFPosts.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.row == 0 {
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: photosID, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: postID, for: indexPath) as! PostTableViewCell
        cell.post = arrayOFPosts[indexPath.row - 1]
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard section == 0 else { return nil }
            return headerView
    }
}
