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
        
        return segment
    }()
    
    public let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    // MARK: ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    // contentView : 스크롤할만큼 크기
    let cotentView = UIView()
    
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
    
    public var categoryCollectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = .init(width: 61, height: 81)
        flow.minimumInteritemSpacing = 9
        flow.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(HomeCategoryCollectionViewCell.self,
                            forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private var collectionViewBottomLine1: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    // MARK: JustDroppedCollectionViews
    private lazy var justDroppedLabel: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var justDroppedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        
        return label
    }()
    
    public lazy var justDroppedCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = .init(width: 142, height: 237)
        flow.minimumLineSpacing = 8
        flow.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.register(HomeJustDroppedColletionViewCell.self,
                            forCellWithReuseIdentifier: HomeJustDroppedColletionViewCell.identifier)
        
        return collectionView
    }()
    
    private var collectionViewBottomLine2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BottomLine")
        return line
    }()
    
    // MARK: ChallengeCollectionViews
    private lazy var challengeLabel : UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var challengeDescriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    let challengeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 124, height: 165)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .clear
        collectionview.isScrollEnabled = true
        collectionview.register(HomeChallengeCollectionViewCell.self, forCellWithReuseIdentifier: HomeChallengeCollectionViewCell.identifier)
        return collectionview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    // MARK: Function
    private func addComponents() {
        self.addSubview(topViewContainer)
        topViewContainer.addSubview(searchBarButton)
        topViewContainer.addSubview(alarmButton)
        
        self.addSubview(segmentedControl)
        self.addSubview(underLineView)
        
        self.addSubview(scrollView)
        scrollView.addSubview(cotentView)
        cotentView.addSubview(adImageView)
        cotentView.addSubview(categoryCollectionView)
        cotentView.addSubview(collectionViewBottomLine1)
        
        cotentView.addSubview(justDroppedLabel)
        cotentView.addSubview(justDroppedDescriptionLabel)
        cotentView.addSubview(justDroppedCollectionView)
        cotentView.addSubview(collectionViewBottomLine2)
        
        cotentView.addSubview(challengeLabel)
        cotentView.addSubview(challengeDescriptionLabel)
        cotentView.addSubview(challengeCollectionView)
        
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
            make.top.lessThanOrEqualTo(segmentedControl.snp.bottom).offset(6)
            make.leading.equalTo(segmentedControl.snp.leading).offset(10) // segmentedControl 기준으로 설정
            make.width.equalTo(28) // 초기 width 값 설정
            make.height.lessThanOrEqualTo(2)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        cotentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView) // 스크롤뷰와 동일한 너비 유지
            make.height.equalTo(1500) // 스크롤 가능하도록 콘텐츠 높이 설정
        }
        
        adImageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.width.lessThanOrEqualTo(374)
            make.height.lessThanOrEqualTo(336)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(adImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(182)
        }
        
        collectionViewBottomLine1.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(30)
        }
        
        justDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewBottomLine1.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        justDroppedDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            make.leading.equalTo(justDroppedLabel)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(justDroppedDescriptionLabel.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.width.equalTo(442)
            make.height.equalTo(237)
        }
        
        collectionViewBottomLine2.snp.makeConstraints { make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(2)
        }
        
        challengeLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewBottomLine2.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        challengeDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(challengeLabel.snp.bottom).offset(4)
            make.leading.equalTo(challengeLabel)
        }
        
        challengeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(challengeDescriptionLabel.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.width.equalTo(338)
            make.height.equalTo(165)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
