//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Natali Mizina on 21.07.2021.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
        
    let avatarImageView = UIImageView()
    let fullNameLabel = UILabel()
    let setStatusButton = UIButton()
    let userStatusLabel = UILabel()
    let userStatusTextField = UITextField()
    private var statusText = String()

    override func willMove(toSuperview newSuperview: UIView?) {
        self.addSubview(avatarImageView)
        avatarImageView.image = UIImage(named: "avatarImage")
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        [
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        ]
        .forEach {
            $0.isActive = true
        }
        self.addSubview(fullNameLabel)
        fullNameLabel.text = "Cat Danya"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        ]
        .forEach {
            $0.isActive = true
        }
        self.addSubview(setStatusButton)
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(onSetStatus), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        [
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 44),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        .forEach {
            $0.isActive = true
        }
        self.addSubview(userStatusTextField)
        userStatusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        userStatusTextField.text = "Waiting for something..."
        userStatusTextField.textColor = .gray
        userStatusTextField.backgroundColor = .white
        userStatusTextField.layer.cornerRadius = 12
        userStatusTextField.layer.borderColor = UIColor.black.cgColor
        userStatusTextField.layer.borderWidth = 1
        userStatusTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        userStatusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        userStatusTextField.delegate = self
        userStatusTextField.translatesAutoresizingMaskIntoConstraints = false
        [
            userStatusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            userStatusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userStatusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            userStatusTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        .forEach {
            $0.isActive = true
        }
        self.addSubview(userStatusLabel)
        userStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userStatusLabel.text = "Set up status"
        userStatusLabel.textColor = .gray
        userStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        [
            userStatusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            userStatusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userStatusLabel.bottomAnchor.constraint(equalTo: userStatusTextField.topAnchor, constant: -16)
        ]
        .forEach {
            $0.isActive = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if userStatusTextField.text == "Waiting for something..." {
            userStatusTextField.text = nil
            userStatusTextField.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = userStatusTextField.text, text.isEmpty {
            userStatusTextField.text = "Waiting for something..."
            userStatusTextField.textColor = .gray
            userStatusLabel.text = "Set up status"
        }
    }
    //Скрытие keyboard при нажатии за пределами TextField в ProfileHeaderView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            self.endEditing(true)
        }
    }
    //Скрытие keyboard при нажатии клавиши Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userStatusTextField.resignFirstResponder()
        return true
    }

    @objc func statusTextChanged() {
        if let text = userStatusTextField.text {
            statusText = text
        }
    }
    
    @objc func onSetStatus() {
        if statusText.isEmpty {
            statusText = "Set up status"
        }
        userStatusLabel.text = statusText
        self.endEditing(true)
    }
}
