//
//  HomeJustDroppedColletionViewCell.swift
//  Kream_cloneCoding
//
//  Created by 김민지 on 10/29/24.
//

import UIKit

class HomeJustDroppedColletionViewCell: UICollectionViewCell {
    
    static let identifier = "justdroppedIdentifier"
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    let pricedescriptionLabel : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 10, weight: .light)
        description.textColor = UIColor.lightGray
        return description
    }()
    
    let dealPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11.5, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        addComponents()
    }
     
    
    private func addComponents() {
        addSubview(imageView)
        addSubview(brandLabel)
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(pricedescriptionLabel)
        addSubview(dealPriceLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(142)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(4)
        }
        
        productLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(productLabel.snp.bottom).offset(26)
            make.leading.equalToSuperview().offset(4)
            make.width.equalTo(124)
            make.height.equalTo(16)
        }
        
        pricedescriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.top.lessThanOrEqualTo(priceLabel.snp.bottom).offset(2)
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuration(data: HomeJustDroppedModel) {
        imageView.image = data.image
        brandLabel.text = data.brand
        productLabel.text = data.productName
        priceLabel.text = data.productPrice
        pricedescriptionLabel.text = data.dealPrice
    }
}
