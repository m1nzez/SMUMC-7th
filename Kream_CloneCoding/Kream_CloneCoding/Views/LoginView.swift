import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) { //? optional
        var hexColor = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexColor = hexColor.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexColor).scanHexInt64(&rgb)

        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class LoginView: UIView {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var kreamlogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        imageView.contentMode = .scaleAspectFit //똑같은 크기로 넣음
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholder = "예) kream@kream.co.kr"
        //attribute 딕셔너리를 정의해서 폰트 스타일, 색상 바꾸기
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(hex: "#C1C1C1")?.cgColor ?? UIColor.gray.cgColor
        ]
        
        //placeholder이랑 attribute를 연결시켜줌 : attribute를 placeholder에 적용시키기
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        //위치 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textfield.frame.height))
            textfield.leftView = paddingView
            textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 15
        textfield.layer.borderColor = UIColor(hex: "#A2A2A2")?.cgColor
        
        return textfield
    }()
    
    public var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var passwordTextField: UITextField = {
        let textfield = UITextField()
        let placeholder = "비밀번호를 입력해주세요"
        //attribute 딕셔너리를 정의해서 폰트 스타일, 색상 바꾸기
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(hex: "#C1C1C1")?.cgColor ?? UIColor.gray.cgColor
        ]
        
        //placeholder이랑 attribute를 연결시켜줌 : attribute를 placeholder에 적용시키기
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textfield.frame.height))
            textfield.leftView = paddingView
            textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 15
        textfield.layer.borderColor = UIColor(hex: "#A2A2A2")?.cgColor
        textfield.isSecureTextEntry = true
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    public var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(hex: "#D3D3D3")
        button.layer.borderColor = UIColor(hex: "#D3D3D3")?.cgColor
        
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(hex: "#D3D3D3")?.cgColor
        
        let image = UIImage(systemName: "message.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        button.setImage(image, for: .normal)
        
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold) //폰트 사이즈. 두꼐
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    public var appleLoginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(hex: "#D3D3D3")?.cgColor
        
        let image = UIImage(systemName: "apple.logo")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold) // 폰트 사이즈, 두꼐
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public func addComponent() {
        self.addSubview(kreamlogo)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            
            kreamlogo.topAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 86),
            kreamlogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kreamlogo.widthAnchor.constraint(equalToConstant: 287),
            kreamlogo.heightAnchor.constraint(equalToConstant: 75),
            
            emailLabel.topAnchor.constraint(lessThanOrEqualTo: kreamlogo.bottomAnchor, constant: 87),
            emailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            emailTextField.topAnchor.constraint(lessThanOrEqualTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            emailTextField.widthAnchor.constraint(lessThanOrEqualToConstant: 303),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            passwordTextField.topAnchor.constraint(lessThanOrEqualTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            passwordTextField.widthAnchor.constraint(lessThanOrEqualToConstant: 303),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(lessThanOrEqualTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            loginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 303),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            kakaoLoginButton.topAnchor.constraint(lessThanOrEqualTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            kakaoLoginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 298),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleLoginButton.topAnchor.constraint(lessThanOrEqualTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            appleLoginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 298),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
