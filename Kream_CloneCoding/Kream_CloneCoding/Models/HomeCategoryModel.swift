
import UIKit

struct HomeCategoryModel {
    let title: String
    let image: UIImage?
}

extension HomeCategoryModel {
    static let data: [HomeCategoryModel] = [
        HomeCategoryModel(title: "크림 드로우", image: UIImage(named: "Category Image 0")),
        HomeCategoryModel(title: "실시간 차트", image: UIImage(named: "Category Image 1")),
        HomeCategoryModel(title: "남성 추천", image: UIImage(named: "Category Image 2")),
        HomeCategoryModel(title: "여성 추천", image: UIImage(named: "Category Image 3")),
        HomeCategoryModel(title: "색다른 추천", image: UIImage(named: "Category Image 4")),
        HomeCategoryModel(title: "정가 아래", image: UIImage(named: "Category Image 5")),
        HomeCategoryModel(title: "윤세 24AW", image: UIImage(named: "Category Image 6")),
        HomeCategoryModel(title: "올해의 베스트", image: UIImage(named: "Category Image 7")),
        HomeCategoryModel(title: "10월 베네핏", image: UIImage(named: "Category Image 8")),
        HomeCategoryModel(title: "아크네 선물", image: UIImage(named: "Category Image 9")),
    ]
}
