import UIKit
import SnapKit

class SavedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left

        return label
    }()
    
    public lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 \(dummySavedModel.savedDatas.count)개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var tableView: UITableView = {
            let table = UITableView()
            table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
            table.separatorStyle = .singleLine
            //table.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()
    
    private func setViews() {
            self.addSubview(titleLabel)
            self.addSubview(countLabel)
            self.addSubview(tableView)
        }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(45)
        }
        countLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(13)
            $0.height.equalTo(22)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(12)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(0)
        }
    }
}
