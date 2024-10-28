import UIKit

class ManageProfileView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addComponent()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public lazy var profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var userEmailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        //위치 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textfield.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        
        textfield.isUserInteractionEnabled = false

        return textfield
    }()
    
    public lazy var userEmailEditButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var userPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var userPasswordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        //위치 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textfield.frame.height))
            textfield.leftView = paddingView
            textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        textfield.isSecureTextEntry = true
        textfield.isUserInteractionEnabled = false
        
        return textfield
    }()
    
    public lazy var userPasswordEditButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    public func addComponent() {
        self.addSubview(profileImage)
        self.addSubview(profileInfoLabel)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailTextField)
        self.addSubview(userEmailEditButton)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(userPasswordEditButton)
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 수평 중앙 정렬
            make.top.equalToSuperview().offset(144)
            make.width.height.equalTo(90) //크기 설정
        }
        profileInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.top.equalTo(profileImage.snp.bottom).offset(20)
        }
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
        }
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.width.lessThanOrEqualTo(23)
            make.height.equalTo(32)
        }
        userEmailEditButton.snp.makeConstraints{ make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.leading.equalTo(userEmailTextField.snp.trailing).offset(9)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        userPasswordLabel.snp.makeConstraints{ make in
            make.top.equalTo(userEmailEditButton.snp.bottom).offset(23)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
        }
        userPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(userPasswordLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.width.lessThanOrEqualTo(23)
            make.height.equalTo(32)
        }
        userPasswordEditButton.snp.makeConstraints{ make in
            make.top.equalTo(userPasswordLabel.snp.bottom).offset(4)
            make.leading.equalTo(userPasswordTextField.snp.trailing).offset(9)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        }
    }
    
    

