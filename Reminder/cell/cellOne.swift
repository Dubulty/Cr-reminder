//
//  cellOne.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//
import UIKit

class CellOne: UITableViewCell {
    
    static let identifier = "CellOne"
    
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
        UIView.addSubview(groceries)
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
    private lazy var groceries: UILabel = {
        let groceries = UILabel()
        groceries.isHidden = false
        groceries.text = "Get Groceries"
        groceries.font = .systemFont(ofSize: 17, weight: .medium)
        return groceries
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
        
        groceries.translatesAutoresizingMaskIntoConstraints = false
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

            // consistent content
            sectionButton.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            sectionButton.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            sectionButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        
            groceries.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 16),
            groceries.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            groceries.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor, constant: -16),
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

