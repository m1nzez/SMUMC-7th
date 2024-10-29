//
//  MyProfileView.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class MyProfileView: UIView {
    
    var username = "m1nze.z"
    var followers = "329"
    var following = "20"
    
    private lazy var mainInfoView: UIView = {
        let view = UIView()
        //view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - Setting & Camera Buttons
    
    public lazy var settingButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default)
        let gearImage = UIImage(systemName: "gearshape", withConfiguration: config)
        button.setImage(gearImage, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    public lazy var cameraButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default)
        let gearImage = UIImage(systemName: "camera", withConfiguration: config)
        button.setImage(gearImage, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    // MARK: - Profile image, name, ...
    private lazy var infoSubView: UIView = {
        let view = UIView()
        //view.backgroundColor = .gray
        return view
    }()
    
    public lazy var profileImage: UIImageView = {
        let imageVW = UIImageView()
        let profileImage = UIImage(named: "ProfileImage")
        imageVW.contentMode = .scaleAspectFill
        imageVW.clipsToBounds = true
        imageVW.layer.cornerRadius = 45
        imageVW.image = profileImage
        return imageVW
    }()
    
    private lazy var userNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(username)"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 \(followers)"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 \(followers)"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    
    // MARK: - Profile Buttons
    
    public lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderColor = UIColor(named: "SocialLogin")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    public lazy var shareProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderColor = UIColor(named: "SocialLogin")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addProfileComponents()
    }
    
    
    // MARK: Upper Buttons Function
    private func addProfileComponents() {
        self.addSubview(mainInfoView)
        
        mainInfoView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(200)
        }
        
        mainInfoView.addSubview(settingButton)
        mainInfoView.addSubview(cameraButton)
        mainInfoView.addSubview(infoSubView)
        infoSubView.addSubview(profileImage)
        infoSubView.addSubview(userNicknameLabel)
        infoSubView.addSubview(followerLabel)
        infoSubView.addSubview(followingLabel)
        mainInfoView.addSubview(editProfileButton)
        mainInfoView.addSubview(shareProfileButton)
        
        settingButton.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints{
            $0.top.trailing.equalToSuperview()
        }
        
        infoSubView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
            $0.top.equalTo(cameraButton.snp.bottom).offset(20)
        }
        
        profileImage.snp.makeConstraints{
            $0.leading.equalTo(infoSubView.snp.leading)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        userNicknameLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImage.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        followerLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImage.snp.trailing).offset(20)
            $0.top.equalTo(userNicknameLabel.snp.bottom).offset(10)
        }
        
        followingLabel.snp.makeConstraints{
            $0.leading.equalTo(followerLabel.snp.trailing).offset(5)
            $0.top.equalTo(userNicknameLabel.snp.bottom).offset(10)
        }
        
        editProfileButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalToSuperview().dividedBy(2.1)
        }
        
        
        shareProfileButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalToSuperview().dividedBy(2.1)
        }

        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

import SwiftUI
#Preview {
    MyProfileViewController()
}

