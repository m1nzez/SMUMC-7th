//
//  File.swift
//  Kream_cloneCoding
//
//  Created by 김민지 on 10/29/24.
//

import UIKit

class HomeChallengeCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "challengeIdentifier"
    
    override init(frame: CGRect){
        super.init(frame:frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 8
        return imageview
    }()
    
    let idLabel : UILabel = {
        let id = UILabel()
        id.font = .systemFont(ofSize: 12, weight: .bold)
        id.textColor = .white
        
        return id
    }()
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(idLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(140)
            make.height.equalTo(14)
            make.leading.equalTo(imageView.snp.leading).inset(10)
        }
    }
    
    // data binding
    public func configuration(data: HomeChallengeModel) {
        imageView.image = data.image
        idLabel.text = data.id
    }
}
