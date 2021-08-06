//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Natali Mizina on 05.08.2021.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
   
    let profileView = ProfileHeaderView()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        setupViews()
        setupConstraints()
    }
}

extension ProfileTableHeaderView {
    private func setupViews(){
        
        contentView.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ProfileTableHeaderView {
    private func setupConstraints(){
        [
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ]
        .forEach {$0.isActive = true}
    }
}
    
extension ProfileTableHeaderView {
    //Скрытие keyboard при нажатии за пределами TextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            profileView.endEditing(true)
        }
    }
}
