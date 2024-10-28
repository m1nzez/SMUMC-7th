import UIKit

class LoginViewController: UIViewController {
    
    private let userInfoModel = UserInfoModel() //모델이랑 연결해주기

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
        loginButtonTap()
    }

    //loginview 연결시켜주기
    private lazy var loginview: LoginView = {
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return view
    }()
    
    
    // 버튼 누르면 화면 전환
    @objc
    func loginButtonTap() {
        let viewController = BaseViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
        
        //버튼 이메일, 패스워드 저장
        guard let email = loginview.emailTextField.text, !email.isEmpty else { return }
        guard let password = loginview.passwordTextField.text, !password.isEmpty else { return }
        
        //모델을 통해 텍스트 저장
        userInfoModel.saveEmail(email)
        userInfoModel.savePassword(password)

    }
        
}
    
    

