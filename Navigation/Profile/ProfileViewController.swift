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
    
    let cellID = String(describing: PostTableViewCell.self)
    
    private var arrayOFPosts = PostsVK().postsArray

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tableView.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
}

extension ProfileViewController {
    private func setupViews(){
        
        view.addSubview(tableView)
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableHeaderView = headerView
        
        tableView.dataSource = self
        tableView.delegate = self
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        let width = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
        var headerFrame = headerView.frame
        headerFrame.size.height = height
        headerFrame.size.width = width
        headerView.frame = headerFrame
        
        tableView.reloadData()
    }
}

extension ProfileViewController {
    private func setupConstraints(){
        [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        .forEach {$0.isActive = true}
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOFPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell
        cell.post = arrayOFPosts[indexPath.row]
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    //Скрытие keyboard при нажатии за пределами TextField
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismissKeyboard()
    }
}
