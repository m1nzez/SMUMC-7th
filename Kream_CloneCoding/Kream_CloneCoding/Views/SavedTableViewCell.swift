//
//  SavedTableViewCell.swift
//  Kream
//
//  Created by 이승준 on 10/6/24.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
        self.nameLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        let bookmarkIcon = UIImage(named: "bookmark.icon")
        button.setImage(bookmarkIcon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 0)
        return button
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.5)
        label.textColor = .gray
        label.numberOfLines = 2
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        let attributedString = NSMutableAttributedString(string: "Your text")

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 3 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .socialLogin
        return view
    }()
    
    //MARK: - Set Components
    private func setViews() {
        self.addSubview(containerView)
        self.addSubview(underLineView)
        containerView.addSubview(mainImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(bookmarkButton)
        containerView.addSubview(priceLabel)
        containerView.addSubview(descriptionLabel)
    }
    
    private func setConstraints() {
        let outbound = 12
        let containerHeight = 72
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(outbound)
            make.height.equalTo(containerHeight)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(containerHeight)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(mainImageView.snp.trailing).offset(12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.trailing).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.width.equalTo(180)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    public func configure(with product: Product) {
        mainImageView.image = product.image
        nameLabel.text = product.name
        priceLabel.text = setPriceLabel(price : product.price)
        descriptionLabel.text = product.desription
    }
    
    private func setPriceLabel(price row: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: row)) else {
            return "??? 원"
        }
        return formattedNumber + "원"
    }
    
}

import SwiftUI
#Preview {
    SavedViewController()
}
