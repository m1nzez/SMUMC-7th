
import UIKit

class LoginView: UIView {
    
    public lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "KREAM LOGO")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var emailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.text = nil
        textField.placeholder = "예)kream@kream.co.kr"
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.font = .systemFont(ofSize: 15)
        
        // leftView에 패딩 추가
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    public lazy var pwdLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    public lazy var pwdTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 303).isActive = true
        textField.text = nil
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.font = .systemFont(ofSize: 15)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: -20, width: 20, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    public lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(named: "LoginButtonGray")
        button.layer.cornerRadius = 8
        return button
    }()
    
    public lazy var customerLoginStack: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField, pwdLabel, pwdTextField, loginButton])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        return stackView
    }()
    
    public lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        
        button.layer.borderColor = UIColor(named: "SocialLogin")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    public lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .default)
        let appleLogo = UIImage(systemName: "apple.logo", withConfiguration: config)
        button.setImage(appleLogo, for: .normal)
        button.imageView?.tintColor = .black
        
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        button.contentHorizontalAlignment = .leading
        button.contentVerticalAlignment = .center
        
        button.layer.borderColor = UIColor(named: "SocialLogin")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        
        return button
    }()
    
    public lazy var socialLoginStack: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 22
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(imageView)
        
        self.addSubview(customerLoginStack)
        customerLoginStack.addSubview(emailTextField)
        customerLoginStack.addSubview(pwdTextField)
        customerLoginStack.addSubview(loginButton)
        
        self.addSubview(socialLoginStack)
        socialLoginStack.addSubview(kakaoLoginButton)
        socialLoginStack.addSubview(appleLoginButton)
        
        appleLoginButton.addSubview(appleLoginButton.imageView!)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor, constant: 140),
            //imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 187),
            
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            
            customerLoginStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 87),
            customerLoginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            customerLoginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            emailTextField.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            pwdTextField.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            pwdTextField.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            pwdTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            socialLoginStack.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -50),
            socialLoginStack.topAnchor.constraint(lessThanOrEqualTo: customerLoginStack.bottomAnchor, constant: 87),
            socialLoginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            socialLoginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.socialLoginStack.leadingAnchor),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.socialLoginStack.trailingAnchor),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleLoginButton.leadingAnchor.constraint(equalTo: self.socialLoginStack.leadingAnchor),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.socialLoginStack.trailingAnchor),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

