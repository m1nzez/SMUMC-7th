import UIKit
import SnapKit

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var settings: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "gearshape")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var camera: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "camera")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var name: UILabel = {
        let label = UILabel()
        label.text = "danajlim"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var followerCount: UILabel = {
        let label = UILabel()
        label.text = "팔로워 733"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var followingCount: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public var manageProfileButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        
        button.setTitle("프로필 관리", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var shareProfileButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        
        button.setTitle("프로필 공유", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public func addComponent() {
        
        self.addSubview(settings)
        self.addSubview(camera)
        self.addSubview(profileImage)
        self.addSubview(name)
        self.addSubview(followerCount)
        self.addSubview(followingCount)
        self.addSubview(manageProfileButton)
        self.addSubview(shareProfileButton)
        
        settings.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(32.5)
            make.top.equalToSuperview().offset(75)
            make.width.height.equalTo(25)
        }
        
        camera.snp.makeConstraints { make in
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-32.5)
            make.top.equalToSuperview().offset(75)
            make.width.height.equalTo(25)
        }
        
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(settings.snp.bottom).offset(26)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(32.5)
            make.width.height.equalTo(90)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.top).offset(21)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.width.equalTo(115)
            make.height.equalTo(23)
        }
        
        followerCount.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(6)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.width.equalTo(58)
            make.height.equalTo(19)
        }
        
        followingCount.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(6)
            make.leading.equalTo(followerCount.snp.trailing).offset(8)
            make.width.equalTo(57)
            make.height.equalTo(19)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(26)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(32.5)
            make.width.lessThanOrEqualTo(157)
            make.height.equalTo(26)
            make.trailing.equalTo(shareProfileButton.snp.leading).offset(-14)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(26)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-32.5)
            make.width.lessThanOrEqualTo(157)
            make.height.equalTo(26)
            make.leading.equalTo(manageProfileButton.snp.trailing).offset(14)
        }
    }
}
