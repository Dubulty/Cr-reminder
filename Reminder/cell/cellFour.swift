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
    
    lazy var sectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
        button.addTarget(self, action: #selector(toggleCellButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var contentUIView: UIView = {
        let UIView = UIView()
        UIView.addSubview(priority)
        UIView.addSubview(notes)
        UIView.addSubview(segmented)
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
    private lazy var priority: UILabel = {
        let priority = UILabel()
        priority.text = "Priority"
        priority.font = .systemFont(ofSize: 17, weight: .medium)
        priority.translatesAutoresizingMaskIntoConstraints = false
        return priority
    }()
    
    private lazy var segmented: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["None","!","!!","!!!"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    private lazy var notes: UILabel = {
        let notes = UILabel()
        notes.text = "Notes"
        notes.font = .systemFont(ofSize: 17, weight: .medium)
        notes.translatesAutoresizingMaskIntoConstraints = false
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
        
        priority.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(notes.snp.top).offset(-32)
            make.left.equalTo(contentUIView).offset(16)
        }
        
        segmented.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(notes.snp.top).offset(-32)
            make.right.equalTo(contentUIView).offset(-5)
        }
        
        notes.snp.makeConstraints{make in
            make.top.equalTo(priority.snp.bottom).offset(32)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.left.equalTo(contentUIView).offset(16)
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
