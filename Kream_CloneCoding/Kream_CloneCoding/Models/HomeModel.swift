//
//  HomeModel.swift
//  Kream_cloneCoding
//
//  Created by 김민지 on 11/3/24.
//

import UIKit

struct HomeCategoryModel {
    let title: String
    let image: UIImage?
}

struct HomeJustDroppedModel {
    let image: UIImage?
    let brand: String
    let productName: String
    let productPrice: String
    let dealPrice: String
}

struct HomeChallengeModel {
    let image: UIImage?
    let id : String
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

extension HomeJustDroppedModel {
    static let data: [HomeJustDroppedModel] = [
        HomeJustDroppedModel(image: UIImage(named: "JustDropped Image 0"), brand: "MLB",
                             productName: "정키라이너 뉴욕양키스", productPrice: "139,000", dealPrice: "12.8만"),
        HomeJustDroppedModel(image: UIImage(named: "JustDropped Image 1"), brand: "Jordan",
                             productName: "Jordan 1 Retro High OG Yellow Ochre", productPrice: "139,000", dealPrice: "15.6만"),
        HomeJustDroppedModel(image: UIImage(named: "JustDropped Image 2"), brand: "Human Made",
                             productName: "Human Made x Kaws Varsity Jacket #1 Black", productPrice: "139,000", dealPrice: "230.6만")
    ]
}

extension HomeChallengeModel {
    static let data: [HomeChallengeModel] = [
        HomeChallengeModel(image: UIImage(named: "Challenge Image 0"), id: "@katarinabluu"),
        HomeChallengeModel(image: UIImage(named: "Challenge Image 1"), id: "@imwinter"),
        HomeChallengeModel(image: UIImage(named: "Challenge Image 2"), id: "@thousand_woo"),
    ]
}

