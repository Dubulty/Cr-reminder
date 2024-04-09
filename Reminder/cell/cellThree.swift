//
//  cellTwo.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//

import UIKit
import SnapKit

class LocationReminderCell: UITableViewCell {
    
    static let identifier = "LocationReminderCell"
    
    lazy var sectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
        button.addTarget(self, action: #selector(toggleCellButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentUIView: UIView = {
        let UIView = UIView()
        UIView.addSubview(remind)
        UIView.addSubview(locationSwich)
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
    private lazy var remind: UILabel = {
        let remind = UILabel()
        remind.text = "Remind me at a location "
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        remind.translatesAutoresizingMaskIntoConstraints = false
        return remind
    }()
    
    private lazy var locationSwich: UISwitch = {
        let swich = UISwitch()
        swich.translatesAutoresizingMaskIntoConstraints = false
        return swich
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
extension LocationReminderCell{
    
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
        
        remind.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.left.equalTo(contentUIView).offset(16)
        }
        
        locationSwich.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.right.equalTo(contentUIView).offset(-16)
        }
    }
    
    @objc private func toggleCellButton(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.3, delay: 0, options: .curveEaseIn,
            animations: {
                self.contentUIView.isHidden.toggle()
                self.layoutIfNeeded()
            })
    }
}
