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
    
    public lazy var savedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    var isTouched: Bool? {
        didSet {
            if isTouched == true {
                savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            }
            else{
                savedButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    let dealPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textAlignment = .center
        label.textColor = .black
        return label
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
    
    let buyRightNowLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "즉시 구매가"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        addComponents()
    }
     
    
    private func addComponents() {
        addSubview(imageView)
        addSubview(dealPriceLabel)
        addSubview(savedButton)
        self.bringSubviewToFront(dealPriceLabel)
        self.bringSubviewToFront(savedButton)
        
        addSubview(brandLabel)
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(pricedescriptionLabel)
        addSubview(buyRightNowLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(142)
        }
        
        dealPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(8)
            make.trailing.equalTo(imageView.snp.trailing).inset(8)
        }
        
        savedButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).inset(10)
            make.trailing.equalTo(imageView.snp.trailing).inset(10)
            make.width.lessThanOrEqualTo(20)
            make.height.lessThanOrEqualTo(22)
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
        
        buyRightNowLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.top.lessThanOrEqualTo(priceLabel.snp.bottom).offset(2)
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuration(data: HomeJustDroppedModel, isTouched: Bool) {
        imageView.image = data.image
        brandLabel.text = data.brand
        productLabel.text = data.productName
        priceLabel.text = data.productPrice
        dealPriceLabel.text = "거래 \(data.dealPrice)"
        
        self.isTouched = isTouched

    }
}
