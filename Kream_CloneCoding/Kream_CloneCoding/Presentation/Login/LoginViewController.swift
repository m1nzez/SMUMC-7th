//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 9/23/24.
//

import UIKit

/// 로그인 화면 뷰 컨트롤러
class LoginViewController: UIViewController {
    
    /// 아이디, 비번 지정 변수
    let userInfo: UserInfo = UserInfo(id: "m1nze", pwd: "1111")
    
    /// 앱 실행 단계
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    // MARK: - Property
    
    /// 커스텀으로 작성한 로그인 뷰
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Function
    
    /// 데이터 모델에 지정한 아이디, 비밀번호에 해당 할 경우 로그인 가능하도록 하는 함수
    @objc private func loginFunction() {
        
        let viewController = MainTabBarController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
        
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwdTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        
        // 모델을 통해 텍스트 저장
        userInfo.saveUserDefaults()
        
    }
    
    /// 로그인 뷰 -> TabBarController 루트 뷰 전환 함수
//    private func changeRootView() {
//        let rootVC = MainTabBarController()
//        
//        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
//            window.rootViewController = rootVC
//            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
//    }
}

