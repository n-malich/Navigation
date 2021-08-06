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
                    viewsPost.text = "Likes: \(post.views)"
                case 1_000..<1000_000:
                    viewsPost.text = "Likes: \(post.views / 1_000)K"
                case 1_000_000... :
                    viewsPost.text = "Likes: \(post.views / 1_000_000)Kk"
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupViews()
        setupConstraints()
        // Configure the view for the selected state
    }
}

extension PostTableViewCell {
    private func setupViews() {
        contentView.addSubview(authorPost)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(imagePost)
        contentView.addSubview(likesPost)
        contentView.addSubview(viewsPost)
    }
}

extension PostTableViewCell {
    private func setupConstraints() {
        [
            authorPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 16),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            imagePost.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                    
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            viewsPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        .forEach {$0.isActive = true}
    }
}
