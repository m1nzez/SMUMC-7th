import Foundation

struct SavedModel { // 상수로 모델을 작성
    let savedImage: String
    let savedName: String
    let savedDescription: String
    let savedPrice: String
    let savedBookmark : String
}

// 더미 데이터 작성하기
final class dummySavedModel { // final = 데이터 클래스 수정 하지 못하도록
    public static let savedDatas: [SavedModel] = [ //static = 싱글톤으로 더미 데이터를 사용할 수 있도록
        SavedModel(savedImage: "SavedItem1",savedName: "손오공이 잃어버린 머리띠 반쪽", savedDescription: "손오공이 장난치다가 머리띠 반쪽 잘라서 e어딘가 숨겨둔 역사속 물건!!", savedPrice: "942,192,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem2",savedName: "골드 반지",savedDescription: "결혼 준비하는 당신?! \n 약혼녀에게 이 반지를 선물하는 건 어때요?", savedPrice: "12,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem3",savedName: "하얀 신발", savedDescription: "짝퉁 나이키 신발! \n 정말 푹신푹신해서 걷다가 졸려서 넘어질수도 ", savedPrice: "90,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem4",savedName: "에베레스트 다이아 반지", savedDescription: "에베레스트를 올라가서 다이아 구하고 만든 반지..! 과연 이것을 누가 사갈것인가??", savedPrice: "1,292,999,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem5",savedName: "아디다스 신발", savedDescription: "아디다스처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~", savedPrice: "120,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem6",savedName: "황제 잠옷", savedDescription: "어느 나라의 황제가 입었다던 잠옷 \n 크리스마스 트리같아 보이는 디자인!", savedPrice: "120,000,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem7",savedName: "고장난 기타", savedDescription: "블라블라블라블라 \n  블라브라브랍르ㅏ", savedPrice: "120,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem8",savedName: "하얀 음료", savedDescription: "이 음료를 마시면 건강해져요 근데 어디가 건강해질까요? 한번 마시겠..", savedPrice: "999,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem1",savedName: "아이폰 31981", savedDescription: "이 음료를 마시면 건강해져요 근데 어디가 건강해질까요? 한번 마시겠..", savedPrice: "999,999,000원", savedBookmark: "Bookmark"),
        SavedModel(savedImage: "SavedItem2",savedName: "에어팟 프로", savedDescription: "이 음료를 마시면 건강해져요 근데 어디가 건강해질까요? 한번 마시겠..", savedPrice: "999,999,000원", savedBookmark: "Bookmark")
    ]
}
