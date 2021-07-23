//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Natali Mizina on 21.07.2021.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView, UITextViewDelegate {
        
    let avatarImageView = UIImageView()
    let userNameLabel = UILabel()
    let userStatusButton = UIButton()
    let userStatusTextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(avatarImageView)
        self.addSubview(userNameLabel)
        self.addSubview(userStatusButton)
        self.addSubview(userStatusTextView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        avatarImageView.image = UIImage(named: "avatarImage")
        avatarImageView.frame = CGRect(x: safeAreaInsets.left + 16, y: safeAreaInsets.top + 16, width: 150, height: 150)
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        userNameLabel.text = "Cat Danya"
        userNameLabel.frame = CGRect(x: avatarImageView.frame.maxX + 20, y: safeAreaInsets.top + 27, width: self.bounds.width - 32, height: 25)
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textColor = .black
        
        userStatusButton.frame = CGRect(x: safeAreaInsets.left + 16, y: avatarImageView.frame.maxY + 16, width: self.bounds.width - 32, height: 50)
        userStatusButton.setTitle("Show status", for: .normal)
        userStatusButton.setTitleColor(.white, for: .normal)
        userStatusButton.backgroundColor = .systemBlue
        userStatusButton.layer.cornerRadius = 4
        userStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        userStatusButton.layer.shadowRadius = 4
        userStatusButton.layer.shadowColor = UIColor.black.cgColor
        userStatusButton.layer.shadowOpacity = 0.7
        userStatusButton.addTarget(self, action: #selector(onStatusClick), for: .touchUpInside)
        
        userStatusTextView.frame = CGRect(x: avatarImageView.frame.maxX + 20, y: userStatusButton.frame.minY - 59, width: self.bounds.width - 202, height: 25)
        userStatusTextView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userStatusTextView.text = "Waiting for something..."
        userStatusTextView.textColor = .gray
        userStatusTextView.backgroundColor = .clear
        userStatusTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if userStatusTextView.text == "Waiting for something..." {
            userStatusTextView.text = nil
            userStatusTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if userStatusTextView.text.isEmpty {
            userStatusTextView.text = "Waiting for something..."
            userStatusTextView.textColor = .gray
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            self.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            userStatusTextView.resignFirstResponder()
            return false
        }
        return true
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
    
    @objc func onStatusClick() {
        if userStatusTextView.text.isEmpty {
            print("No status")
        } else {
            print(userStatusTextView.text.description)
        }
        self.endEditing(true)
    }
}
