//
//  TabBarViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = UINavigationController(rootViewController: StyleViewController())
    private let shopVC =  UINavigationController(rootViewController: ShopViewController())
    private let savedVC = UINavigationController(rootViewController: SavedViewController())
    private let myProfileVC = UINavigationController(rootViewController: MyProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addTabBarIcons()
        appearance()
    }

    private func addTabBarIcons() {
        
        let size = CGSize(width: 30, height: 30)
        
        let homeIcon = UIImage(named: "Home Icon")
        let resizedHomeIcon = homeIcon?.resizeImage(to: size)
        
        let styleIcon = UIImage(named: "Style Icon")
        let resizedStyleIcon = styleIcon?.resizeImage(to: size)
        
        let shopIcon = UIImage(named: "Shop Icon")
        let resizedShopIcon = shopIcon?.resizeImage(to: size)
        
        let savedIcon = UIImage(named: "Saved Icon")
        let resizedSavedIcon = savedIcon?.resizeImage(to: size)
        
        let myIcon = UIImage(named: "My Icon")
        let resizedMyIcon = myIcon?.resizeImage(to: size)
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: resizedHomeIcon, tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: resizedStyleIcon, tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: resizedShopIcon, tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: resizedSavedIcon, tag: 3)
        myProfileVC.tabBarItem = UITabBarItem(title: "MY", image: resizedMyIcon, tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myProfileVC]
    }
    
    // 클릭 시, 검은색으로 칠해지도록 Appearance 조정 함수 - UITabBarAppearance
    // configureWithTransparentBackground : 탭바 모양 속성에 대한 이전 값으로 대체
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black                               // 아이콘 색상
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black] // 제목 텍스트 색상
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black                    // 배지 색상 (알림이나 정보 나타낼떄에 대한 색상값)
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance          // 설정한 외관을 현재 탭 바에 적용
        self.tabBar.backgroundColor = .clear
    }
    
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

import SwiftUI
#Preview {
    UINavigationController(rootViewController: TabBarViewController())
}
