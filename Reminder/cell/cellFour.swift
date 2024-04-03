//
//  cellSix.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//
import UIKit

class CellFour: UITableViewCell {

    static let identifier = "CellFour"
    
     lazy var sectionButton: UIButton = {
      let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
      button.addTarget(
       self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      return button
    }()
    
    private lazy var contentUIView: UIView = {
      let UIView = UIView()
        UIView.isHidden = false
        UIView.addSubview(priority)
        UIView.addSubview(notes)
        UIView.addSubview(segmented)
      return UIView
    }()

    private lazy var stackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .vertical
      stackView.addArrangedSubview(contentUIView)
      stackView.addArrangedSubview(sectionButton)
      return stackView
    }()

    // MARK: - content
    private lazy var priority: UILabel = {
        let priority = UILabel()
        priority.isHidden = false
        priority.text = "Priority"
        priority.font = .systemFont(ofSize: 17, weight: .medium)
        return priority
    }()
    
    private lazy var segmented: UISegmentedControl = {
        let manuArray = ["None","!","!!","!!!"]
        let segmented = UISegmentedControl(items: manuArray)
        segmented.isHidden = false
        return segmented
    }()
    
    private lazy var notes: UILabel = {
        let notes = UILabel()
        notes.isHidden = false
        notes.text = "Notes"
        notes.font = .systemFont(ofSize: 17, weight: .medium)
        return notes
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdenrifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdenrifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.contentView.addSubview(stackView)
        priority.translatesAutoresizingMaskIntoConstraints = false
        segmented.translatesAutoresizingMaskIntoConstraints = false
        notes.translatesAutoresizingMaskIntoConstraints = false
        
        contentUIView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        sectionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentUIView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            contentUIView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            contentUIView.topAnchor.constraint(equalTo: stackView.topAnchor),

            sectionButton.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            sectionButton.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            sectionButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        
            // consistent content
            priority.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 5),
            priority.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            priority.bottomAnchor.constraint(equalTo: notes.topAnchor,constant: -18),

            segmented.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 5),
            segmented.rightAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.rightAnchor,constant: -5),
            segmented.bottomAnchor.constraint(equalTo: notes.topAnchor,constant: -18),
            
            notes.topAnchor.constraint(equalTo: priority.layoutMarginsGuide.bottomAnchor, constant: 18),
            notes.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            notes.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor,constant: -18),
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        _ = contentUIView.isHidden
      UIView.animate(
       withDuration: 0.3, delay: 0, options: .curveEaseIn,
        animations: {
          self.contentUIView.subviews.forEach { $0.isHidden = !$0.isHidden }
          self.contentUIView.isHidden = !self.contentUIView.isHidden
      })
    }
}

