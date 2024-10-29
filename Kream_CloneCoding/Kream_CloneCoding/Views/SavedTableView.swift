//
//  SavedTableView.swift
//  Kream
//
//  Created by 이승준 on 10/6/24.
//

import UIKit
import SnapKit

class SavedTableView: UIView {
    
    var total: Int

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private lazy var totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 \(total)개"
        return label
    }()
    
    lazy var savedTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        table.separatorStyle = .none
        table.register(
            SavedTableViewCell.self,
            forCellReuseIdentifier: SavedTableViewCell.identifier)
        return table
    }()
    
    init(frame: CGRect, total: Int) {
        self.total = total
        super.init(frame: frame)
        self.setViews()
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.addSubview(titleLabel)
        self.addSubview(totalNumberLabel)
        self.addSubview(savedTableView)
    }
    
    private func addComponents() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(13)
        }
        
        totalNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(13)
        }
        
        savedTableView.snp.makeConstraints { make in
            make.top.equalTo(totalNumberLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    public func setTotalNumberLabel(_ number: Int) {
        self.total = number
    }
    
}
