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
    
    private lazy var remindLabel: UILabel = {
        let remind = UILabel()
        remind.text = "Remind me at a location "
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        remind.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(remind)
        return remind
    }()
    
    private lazy var locationSwich: UISwitch = {
        let swich = UISwitch()
        swich.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(swich)
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
        
        remindLabel.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(16)
            make.bottom.equalTo(contentView).offset(-16)
            make.left.equalTo(contentView).offset(16)
        }
        
        locationSwich.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(16)
            make.bottom.equalTo(contentView).offset(-16)
            make.right.equalTo(contentView).offset(-16)
        }
    }
}
