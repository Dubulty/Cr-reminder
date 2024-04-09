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
    
    lazy var sectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
        button.addTarget(self, action: #selector(toggleCellButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentUIView: UIView = {
        let UIView = UIView()
        UIView.addSubview(groceries)
        UIView.translatesAutoresizingMaskIntoConstraints = false
        return UIView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(contentUIView)
        stackView.addArrangedSubview(sectionButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - content
    private lazy var groceries: UILabel = {
        let groceries = UILabel()
        groceries.text = "Get Groceries"
        groceries.font = .systemFont(ofSize: 17, weight: .medium)
        groceries.translatesAutoresizingMaskIntoConstraints = false
        return groceries
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdenrifier: String?){
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
        
        self.contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints{make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
        }
        
        contentUIView.snp.makeConstraints{make in
            make.top.equalTo(stackView)
            make.right.equalTo(stackView)
            make.left.equalTo(stackView)
        }
        
        sectionButton.snp.makeConstraints{make in
            make.bottom.equalTo(stackView)
            make.right.equalTo(stackView)
            make.left.equalTo(stackView)
        }
        
        groceries.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.left.equalTo(contentUIView).offset(16)
        }
    }
    
    @objc func toggleCellButton(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.3, delay: 0, options: .curveEaseIn,
            animations: {
                self.contentUIView.isHidden.toggle()
                self.layoutIfNeeded()
            })
    }
}
