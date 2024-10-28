//
//  MainTabBarController.swift
//  UMC_KREAM
//
//  Created by 김민지 on 10/8/24.
//

import UIKit

/// KREAM 탭바컨트롤러
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        appearance()
    }
    
    let homeVC = UINavigationController(rootViewController: HomeViewController())
    let styleVC = UINavigationController(rootViewController: StyleViewController())
    let shopVC = UINavigationController(rootViewController: ShopViewController())
    let savedVC = UINavigationController(rootViewController: SavedViewController())
    let myVC = UINavigationController(rootViewController: MyPageViewController())
    
    /// 탭바 설정 함수(피그마 디자인에 맞춰 5개 구성)
    private func setupTabBar() {
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 1)
        styleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Style"), tag: 2)
        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop.pdf"), tag: 3)
        savedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Saved.pdf"), tag: 4)
        myVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "My.pdf"), tag: 5)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
    }
    
    /// 클릭 시, 검은색으로 칠해지도록 Aprrearance 조정 함수
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
           

}
