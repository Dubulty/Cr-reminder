//
//  cellTwo.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//
import UIKit

class CellThree: UITableViewCell {
    
    static let identifier = "CellThree"
    
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
        UIView.addSubview(remind)
        UIView.addSubview(locationSwich)
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
    private lazy var remind: UILabel = {
        let remind = UILabel()
        remind.isHidden = false
        remind.text = "Remind me at a location "
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        return remind
    }()
    
    private lazy var locationSwich: UISwitch = {
        let remindSwich = UISwitch()
        remindSwich.isHidden = false
        return remindSwich
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
        remind.translatesAutoresizingMaskIntoConstraints = false
        locationSwich.translatesAutoresizingMaskIntoConstraints = false
        
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
        
            remind.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 10),
            remind.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor, constant: -15),
            remind.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),

            locationSwich.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 10),
            locationSwich.rightAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.rightAnchor, constant: -16),
            locationSwich.bottomAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.bottomAnchor, constant: -10),
            
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
