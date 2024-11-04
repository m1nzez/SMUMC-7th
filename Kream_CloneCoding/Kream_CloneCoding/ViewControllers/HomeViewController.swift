
import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        
        view.categoryCollectionView.tag = 1
        view.justDroppedCollectionView.tag = 2
        view.challengeCollectionView.tag = 3
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setUpDelete()
    }
    
    // 세그먼트에 대한 값 설정
    private func setupAction() {
        homeView.segmentedControl.addTarget(self, action: #selector(changeSegmentedControlLineView(_:)), for: .valueChanged
        )
    }
    
    private func setUpDelete() {
        homeView.categoryCollectionView.delegate = self
        homeView.categoryCollectionView.dataSource = self
        
        homeView.justDroppedCollectionView.delegate = self
        homeView.justDroppedCollectionView.dataSource = self
        
        homeView.challengeCollectionView.delegate = self
        homeView.challengeCollectionView.dataSource = self

    }
    
    // 선택된 세그먼트에 맞춰 underLineView의 위치를 애니메이션으로 이동
    @objc
    private func changeSegmentedControlLineView(_ segment: UISegmentedControl) {
        let selectedSegmentIndex = homeView.segmentedControl.selectedSegmentIndex                    // 세그먼트의 인덱스값 가져옴
        let selectedSegmentFrame = homeView.segmentedControl.subviews[selectedSegmentIndex].frame    // 선택된 세그먼트의 프레임 가져옴
                
        // 세그먼트의 텍스트 가져오기
        let segmentTitle = homeView.segmentedControl.titleForSegment(at: selectedSegmentIndex) ?? ""
        
        // 텍스트 크기 계산 (세그먼트에 설정된 폰트와 동일한 속성 사용)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ]
        let textWidth = (segmentTitle as NSString).size(withAttributes: textAttributes).width // 텍스트 너비 계산
        
        // 세그먼트 프레임 안에서 텍스트 시작점 계산
        let segmentWidth = selectedSegmentFrame.width
        let textStartX = (segmentWidth - textWidth) / 2 // 세그먼트 내 텍스트 시작점 (중앙에서 텍스트 길이의 절반 만큼 왼쪽으로 이동)

        // 세그먼트의 시작점에 텍스트 시작점을 더한 값이 underLineView의 정확한 시작점이 됨
        let leadingDistance = selectedSegmentFrame.origin.x + textStartX
                
        UIView.animate(withDuration: 0.2, animations: {
            self.homeView.underLineView.snp.updateConstraints {
                $0.leading.equalTo(self.homeView.segmentedControl.snp.leading).offset(leadingDistance)
                $0.width.equalTo(textWidth) // underLineView의 너비도 업데이트
            }
            self.homeView.layoutIfNeeded() // 레이아웃 업데이트
        })
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return HomeCategoryModel.data.count
        }
        if collectionView.tag == 2 {
            return HomeJustDroppedModel.data.count
        }
        if collectionView.tag == 3 {
            return HomeChallengeModel.data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as? HomeCategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = HomeCategoryModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        else if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeJustDroppedColletionViewCell.identifier, for: indexPath) as? HomeJustDroppedColletionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = HomeJustDroppedModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        else if collectionView.tag == 3 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeChallengeCollectionViewCell.identifier, for: indexPath) as? HomeChallengeCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = HomeChallengeModel.data[indexPath.row]
            cell.configuration(data: data)
            return cell
        }
        return UICollectionViewCell()
    }
}

