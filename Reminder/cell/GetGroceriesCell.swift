//
//  cellOne.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//

import UIKit
import SnapKit

class GetGroceriesCell: UITableViewCell {
    
    static let identifier = "GetGroceriesCell"
    
    private lazy var groceriesLabel: UILabel = {
        let groceries = UILabel()
        groceries.text = "Get Groceries"
        groceries.font = .systemFont(ofSize: 17, weight: .medium)
        groceries.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(groceries)
        return groceries
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdenrifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdenrifier)
        self.setupUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GetGroceriesCell {
    
    private func setupUI() {
        
        groceriesLabel.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(16)
            make.bottom.equalTo(contentView).offset(-16)
            make.left.equalTo(contentView).offset(16)
        }
    }
}
