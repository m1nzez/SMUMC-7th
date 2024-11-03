//
//  HomeCategoryCollectionViewCell.swift
//  Kream
//
//  Created by 이승준 on 10/27/24.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "categoryIdentifier"
    
    let container: UIView = {
        let view = UIView()
        return view
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 30.5
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11.5, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(titleLabel)
        
        container.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
            make.width.equalTo(61)
            make.height.equalTo(81)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            // make.centerX.equalTo(container.snp.centerX)
        }
    }
    
    public func configuration(data: HomeCategoryModel) {
        imageView.image = data.image
        titleLabel.text = data.title
    }

    
}
