//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Natali Mizina on 09.08.2021.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private var photos = PhotosVK().photosArray

    let titlePhotos: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrowRightPhotos: UIImageView = {
       let image = UIImageView(image: UIImage(systemName: "arrow.forward"))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagePhotos1: UIImageView = {
        let image = UIImageView()
        image.image = PhotosVK().photosArray[0]
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagePhotos2: UIImageView = {
        let image = UIImageView()
        image.image = PhotosVK().photosArray[1]
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagePhotos3: UIImageView = {
        let image = UIImageView()
        image.image = PhotosVK().photosArray[2]
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagePhotos4: UIImageView = {
        let image = UIImageView()
        image.image = PhotosVK().photosArray[3]
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let photosStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var baseInset: CGFloat { return 12 }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupViews()
        setupConstraints()
    }
}

extension PhotosTableViewCell {
    private func setupViews() {
        
        contentView.addSubview(titlePhotos)
        contentView.addSubview(arrowRightPhotos)
        contentView.addSubview(photosStack)
        
        photosStack.addArrangedSubview(imagePhotos1)
        photosStack.addArrangedSubview(imagePhotos2)
        photosStack.addArrangedSubview(imagePhotos3)
        photosStack.addArrangedSubview(imagePhotos4)
    }
}

extension PhotosTableViewCell {
    private func setupConstraints() {
        [
            titlePhotos.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            titlePhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            
            arrowRightPhotos.centerYAnchor.constraint(equalTo: titlePhotos.centerYAnchor),
            arrowRightPhotos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            arrowRightPhotos.heightAnchor.constraint(equalTo: titlePhotos.heightAnchor),
            arrowRightPhotos.widthAnchor.constraint(equalTo: arrowRightPhotos.heightAnchor),
            
            
            photosStack.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: baseInset),
            photosStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            photosStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -baseInset),
            photosStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset),
            photosStack.heightAnchor.constraint(equalToConstant: (contentView.frame.size.width - baseInset * 2 - 8 * 3) / 4)
            
        ]
        .forEach {$0.isActive = true}
    }
}
