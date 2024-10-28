import UIKit

class BaseViewController: UITabBarController {
    let homeVC = HomeViewController()
    let styleVC = StyleViewController()
    let shopVC = ShopViewController()
    let savedVC = SavedViewController()
    let myVC = UINavigationController(rootViewController: MyViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named:"Home"),tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named:"Style"),tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named:"Shop"),tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named:"Saved"),tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named:"My"),tag: 4)
        
        //내 viewController 들을 배열안의 vc들로 설정할게
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
    }
}
