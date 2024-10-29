//
//  HomeView.swift
//  Kream
//
//  Created by 이승준 on 10/26/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    //MARK: - Top Area : Search & Notification
    private var topViewContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .yellow
        return view
    }()
    
    public var searchBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "HomeSearchBarBackground")
        button.setTitle("브랜드, 상품, 프로필, 태그 등", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.5)
        button.layer.cornerRadius = 12
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        return button
    }()
    
    public var alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Bell Icon"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        
        return button
    }()
    
    //MARK: - SegmentControl
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        
//        // 텍스트 스타일 설정
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 8 // 원하는 줄 간격 설정
//        paragraphStyle.alignment = .center // 텍스트 정렬 설정
        
        // 배경과 구분선 이미지 제거
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segment.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        segment.apportionsSegmentWidthsByContent = true     // 글자 크기에 맞게 segment 너비 설정
        
        segment.selectedSegmentIndex = 0
        
        // 기본 상태 텍스트 속성 설정
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light), 
        ], for: .normal
        )
        
        // 선택된 상태 텍스트 속성 설정 (볼드체 및 밑줄 추가)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold), 
        ], for: .selected
        )
        
        // 텍스트 속성 간의 간격 조절
        
        
        return segment
    }()
    
    public let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    // MARK: RecomendationView : Ad, CategoryCollectionViews
    private var recomendationViewContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .darkGray
        return view
    }()
    
    private var adImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Advertisement")
        return image
    }()
    
    public var collectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = .init(width: 61, height: 81)
        flow.minimumInteritemSpacing = 12
        flow.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.register(HomeCategoryCollectionViewCell.self,
                            forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
        
        return collection
    }()
    
    private var collectionViewBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(topViewContainer)
        topViewContainer.addSubview(searchBarButton)
        topViewContainer.addSubview(alarmButton)
        
        self.addSubview(segmentedControl)
        self.addSubview(underLineView)
        
        self.addSubview(adImageView)
        self.addSubview(collectionView)
        self.addSubview(collectionViewBottomLine)
                
        topViewContainer.snp.makeConstraints { make in
            make.top.lessThanOrEqualToSuperview().offset(55)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        searchBarButton.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        
        alarmButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(24)
            make.leading.equalTo(searchBarButton.snp.trailing).offset(10)
            make.trailing.equalTo(-3)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(topViewContainer.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(14)
            make.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(segmentedControl.snp.bottom).offset(8)
            make.leading.equalTo(segmentedControl.snp.leading).offset(8) // segmentedControl 기준으로 설정
            make.width.equalTo(28) // 초기 width 값 설정
            make.height.lessThanOrEqualTo(2)
        }
        
        adImageView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(underLineView.snp.bottom)
            make.height.lessThanOrEqualTo(336)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.lessThanOrEqualTo(adImageView.snp.bottom).offset(20)
            make.height.equalTo(182)
        }
        
        collectionViewBottomLine.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(collectionView.snp.bottom).offset(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
