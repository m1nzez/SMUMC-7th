import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .white
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
        
    }
    
}

