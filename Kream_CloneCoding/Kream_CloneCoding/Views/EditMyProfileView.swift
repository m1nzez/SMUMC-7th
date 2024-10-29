//
//  EditMyProfileView.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class EditMyProfileView: UIView {
    
    public lazy var imagePickerView: UIImagePickerController = {
        /// 이미지 피커 컨트롤러 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary   /// 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true         /// 이미지 편집 가능 X
        return picker
    }()
    
    public lazy var profileImageButton: UIButton = {
        let button = UIButton()
        // Setting Image
        let profileImage = UIImage(named: "Ring01")
        button.setImage(profileImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.layer.cornerRadius = 45
        
        return button
    }()
    
    public lazy var maininfoView: UIView = {
        let view = UIView()
        //view.backgroundColor = .ivory
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "유저 이메일"
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        //textField.text = "rofxnaos@gmail.com"
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.font = .systemFont(ofSize: 13)
        textField.layer.borderWidth = 1
        textField.isUserInteractionEnabled = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: -20, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    public lazy var emailEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    public lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        //textField.text = "password"
        textField.placeholder = "새로운 비밀번호를 입력해주세요!"
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.font = .systemFont(ofSize: 13)
        textField.layer.borderWidth = 1
        textField.isUserInteractionEnabled = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: -20, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    public lazy var pwdEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()

    
    init (frame: CGRect, usernemail: String, userpassword: String) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(profileImageButton)
        self.addSubview(maininfoView)
        
        maininfoView.addSubview(titleLabel)
        
        maininfoView.addSubview(emailLabel)
        maininfoView.addSubview(emailTextField)
        maininfoView.addSubview(emailEditButton)
        
        maininfoView.addSubview(pwdLabel)
        maininfoView.addSubview(pwdTextField)
        maininfoView.addSubview(pwdEditButton)

        
        profileImageButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
            $0.height.width.equalTo(90)
        }
        
        maininfoView.snp.makeConstraints{
            $0.top.equalTo(profileImageButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(emailEditButton.snp.leading).offset(-10)
            $0.height.equalTo(30)
        }
        
        emailEditButton.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(30)
        }
        
        pwdLabel.snp.makeConstraints{
            $0.top.equalTo(emailEditButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }
        
        pwdTextField.snp.makeConstraints{
            $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(pwdEditButton.snp.leading).offset(-10)
            $0.height.equalTo(30)
        }
        
        pwdEditButton.snp.makeConstraints{
            $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
