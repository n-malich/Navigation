//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Natali Mizina on 05.08.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: PostVK? {
        didSet {
            if let post = post {
                authorPost.text = post.author
                descriptionPost.text = post.description
                imagePost.image = UIImage(named: post.image)
                
                switch post.likes {
                case 0..<1000:
                    likesPost.text = "Likes: \(post.likes)"
                case 1_000..<1000_000:
                    likesPost.text = "Likes: \(post.likes / 1_000)K"
                case 1_000_000... :
                    likesPost.text = "Likes: \(post.likes / 1_000_000)Kk"
                default:
                    break
                }
                
                switch post.views {
                case 0..<1000:
                    viewsPost.text = "Views: \(post.views)"
                case 1_000..<1000_000:
                    viewsPost.text = "Views: \(post.views / 1_000)K"
                case 1_000_000... :
                    viewsPost.text = "Views: \(post.views / 1_000_000)Kk"
                default:
                    break
                }
            }
        }
    }
    
    var authorPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.tintColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imagePost: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var likesPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var viewsPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var baseInset: CGFloat { return 16 }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupViews()
        setupConstraints()
    }
}

extension PostTableViewCell {
    private func setupViews() {
        addSubview(authorPost)
        addSubview(descriptionPost)
        addSubview(imagePost)
        addSubview(likesPost)
        addSubview(viewsPost)
    }
}

extension PostTableViewCell {
    private func setupConstraints() {
        [
            authorPost.topAnchor.constraint(equalTo: self.topAnchor, constant: baseInset),
            authorPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: baseInset),
            authorPost.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -baseInset),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: baseInset),
            imagePost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            imagePost.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: baseInset),
            descriptionPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: baseInset),
            descriptionPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -baseInset),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: baseInset),
            likesPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: baseInset),
            likesPost.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseInset),
                    
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: baseInset),
            viewsPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -baseInset),
            viewsPost.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -baseInset)
        ]
        .forEach {$0.isActive = true}
    }
}
