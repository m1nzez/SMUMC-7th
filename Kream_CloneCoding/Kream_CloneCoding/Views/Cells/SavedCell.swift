import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // reuseIdentifier: 코드로 셀을 초기화할 떄 호출
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    //메서드를 오버라이드하여 셀이 재사용되기 전에 초기화된 상태로 만들어줌
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedNameLabel.text = nil
        self.savedPriceLabel.text = nil
        self.savedDescriptionLabel.text = nil
        self.savedBookmarkImageView.image = nil
        //nil = 값이 없음
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Cell 컴포넌트 넣기
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var savedNameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        name.textColor = UIColor.black
        name.textAlignment = .left
        return name
    }()
    
    private lazy var savedDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 9, weight: .light)
        description.textColor = UIColor(hex: "#A1A1A1")
        description.textAlignment = .left
        description.numberOfLines = 2
        return description
    }()
    
    private lazy var savedBookmarkImageView: UIImageView = {
        let bookmark = UIImageView()
        return bookmark
    }()
    
    private lazy var savedPriceLabel: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        price.textColor = .black
        price.textAlignment = .right
        return price
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedNameLabel)
        self.addSubview(savedDescriptionLabel)
        self.addSubview(savedBookmarkImageView)
        self.addSubview(savedPriceLabel)
    }
    
    private func setConstraints(){
        savedImageView.snp.makeConstraints { make in
            make.top.lessThanOrEqualToSuperview().offset(13)
            make.left.equalToSuperview().offset(13)
            make.bottom.lessThanOrEqualToSuperview().offset(-14)
            make.width.height.equalTo(72)
        }
        savedNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(savedImageView.snp.trailing).offset(13)
            make.bottom.equalToSuperview().offset(-67)
            make.height.equalTo(19)
        }
        savedDescriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(savedNameLabel.snp.bottom).offset(0)
            make.leading.equalTo(savedImageView.snp.trailing).offset(13)
            make.trailing.lessThanOrEqualToSuperview().offset(-142)
            make.width.equalTo(153)
            make.height.equalTo(33)
        }
        savedBookmarkImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.leading.lessThanOrEqualTo(savedDescriptionLabel.snp.trailing).offset(362)
            make.trailing.equalToSuperview().offset(-17)
            make.bottom.equalToSuperview().offset(-63)
            make.width.equalTo(14)
            make.height.equalTo(18)
            //top, bottom을 lessThanOrEqual로 설정하면 이상하게 찌그러짐 -> 왜그럴까? 다른 속성들은 안그러는디 ;;
            //그리고 위로 정렬은 안되나.. 아니면 두줄로 표시 이런거...
        }
        savedPriceLabel.snp.makeConstraints{ make in
            make.top.lessThanOrEqualTo(savedBookmarkImageView.snp.bottom).offset(67)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(22)
        }
    }
    

    // SavedModel 타입을 인자로 받아서 값을 변경할 수 있도록 함 (연결해주기)
    // VC에서 셀을 생성하면서 셀의 값을 바꾸면서 불러옴
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedNameLabel.text = model.savedName
        self.savedPriceLabel.text = model.savedPrice
        self.savedDescriptionLabel.text = model.savedDescription
        self.savedBookmarkImageView.image = UIImage(named: model.savedBookmark)
    }
}

