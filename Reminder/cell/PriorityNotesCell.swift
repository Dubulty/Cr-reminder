//
//  cellSix.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//

import UIKit
import SnapKit

class PriorityNotesCell: UITableViewCell {
    
    static let identifier = "PriorityNotesCell"
    
    private lazy var priorityLabel: UILabel = {
        let priority = UILabel()
        priority.text = "Priority"
        priority.font = .systemFont(ofSize: 17, weight: .medium)
        priority.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(priority)
        return priority
    }()
    
    private lazy var segmented: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["None","!","!!","!!!"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(segmented)
        return segmented
    }()
    
    private lazy var notesLabel: UILabel = {
        let notes = UILabel()
        notes.text = "Notes"
        notes.font = .systemFont(ofSize: 17, weight: .medium)
        notes.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(notes)
        return notes
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
extension PriorityNotesCell{
    
    private func setupUI() {
        
        priorityLabel.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(16)
            make.bottom.equalTo(notesLabel.snp.top).offset(-32)
            make.left.equalTo(contentView).offset(16)
        }
        
        segmented.snp.makeConstraints{make in
            make.top.equalTo(contentView).offset(16)
            make.bottom.equalTo(notesLabel.snp.top).offset(-32)
            make.right.equalTo(contentView).offset(-5)
        }
        
        notesLabel.snp.makeConstraints{make in
            make.top.equalTo(priorityLabel.snp.bottom).offset(32)
            make.bottom.equalTo(contentView).offset(-16)
            make.left.equalTo(contentView).offset(16)
        }
    }
}
