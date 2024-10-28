import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
        myview.manageProfileButton.addTarget(self, action: #selector(ManageProfileViewButtonTap), for: .touchUpInside)
    }
    
    private var myview: MyView = {
        let view = MyView()
        return view
    }()
    
    private var profileImage: UIImage?
    
    @objc
    private func ManageProfileViewButtonTap() {
        let viewController = ManageProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
        //myview의 프로필이미지를 MangageProfileViewController의 변수에 전달
        viewController.receivedProfileImage = myview.profileImage.image
    }
}
