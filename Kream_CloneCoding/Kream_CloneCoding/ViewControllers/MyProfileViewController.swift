
import UIKit
import SnapKit

class MyProfileViewController: UIViewController {
    
    private lazy var myProfileView = MyProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myProfileView
        myProfileView.editProfileButton.addTarget(self, action: #selector(pushEditProfileView), for: .touchUpInside)
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @objc
    private func pushEditProfileView() {
        let editView = EditMyProfileViewController()
        
        // EditMyProfileViewController의 CompletionHanlder를 구현
        // EditMyProfileViewController에서 COmpletionHandler를 호출하면 여기서 구현한 함수가 실행됨
        editView.imageEditCompletionHandler = { [weak self] newImage in
            self?.myProfileView.profileImage.image = newImage
        }
        
        editView.setProfileImage(image: myProfileView.profileImage.image!)
        navigationController?.pushViewController(editView, animated: true)
    }
    
//    private func setProfileImage(image: UIImage) {
//        myProfileView.profileImage.image = image
//    }

}

import SwiftUI
#Preview {
    UINavigationController(rootViewController: MyProfileViewController())
}
