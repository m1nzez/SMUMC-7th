//
//  ViewController.swift
//  Kream
//
//  Created by 이승준 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let userDefaults = UserDefaults.standard

    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.appleLoginButton.addTarget(self, action: #selector(appleLoginTapped), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginTapped), for: .touchUpInside)
        view.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return view
    }()
    
    private let navigationVC = UINavigationController(rootViewController: TabBarViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUserdefaults()
        self.view = loginView
    }
    
    @objc
    private func loginTapped() {
        self.saveUserDefaults()
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
    }
    
    private func saveUserDefaults() {
        guard let email = loginView.emailTextField.text, let pwd = loginView.pwdTextField.text, email != "", pwd != "" else {
            print("내용을 입력해 주세요.")
            return
        }
        
        userDefaults.set(email, forKey: "user_email")
        userDefaults.set(pwd, forKey: "user_pwd")
    }
    
    private func loadUserdefaults() {
        guard let email = userDefaults.string(forKey: "user_email"),
              let pwd = userDefaults.string(forKey: "user_pwd") else {
            print("There is no Value for user_email, user_pwd")
            return
        }
        loginView.emailTextField.text = email
        loginView.pwdTextField.text = pwd
    }
    
    @objc
    private func appleLoginTapped() {
        print("appleLoginTapped")
    }
    
    @objc
    private func kakaoLoginTapped() {
        print("kakaoLoginTapped")
    }
    
}
