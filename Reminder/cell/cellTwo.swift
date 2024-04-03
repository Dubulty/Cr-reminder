//
//  cellThree.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//
import UIKit

class CellTwo: UITableViewCell {
    static let identifier = "CellTwo"
    
    var secondViewController: firstViewController?
    
     lazy var sectionButton: UIButton = {
      let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
      button.addTarget(
       self, action: #selector(uttonTapped(_:)), for: .touchUpInside)
      return button
    }()
    
    private lazy var contentUIView: UIView = {
      let UIView = UIView()
        UIView.isHidden = false
        UIView.addSubview(remind)
        UIView.addSubview(remindSwich)
        UIView.addSubview(Repeat)
        UIView.addSubview(never)
        UIView.addSubview(picker)
        UIView.addSubview(pickerLabel)
        UIView.addSubview(disclosureIndicatorImageView)
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
    private lazy var disclosureIndicatorImageView: UIImageView = {
        let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
        disclosureIndicator.isHidden = false
        disclosureIndicator.tintColor = .gray
        return disclosureIndicator
    }()
    
    private lazy var picker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.isHidden = false
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    private lazy var pickerLabel: UILabel = {
        let pickerLabel = UILabel()
        pickerLabel.isHidden = false
        pickerLabel.font = .systemFont(ofSize: 17, weight: .medium)
        pickerLabel.textColor = UIColor(red: 0/255.0, green: 112/255.0, blue: 201/255.0, alpha: 255/255.0)
        return pickerLabel
    }()
    
    private lazy var Repeat: UILabel = {
        let Repeat = UILabel()
        Repeat.isHidden = false
        Repeat.text = "Repeat"
        return Repeat
    }()
    
    private lazy var never: UIButton = {
        let never = UIButton()
        never.isHidden = false
        never.setTitle("Never", for: .normal)
        never.setTitleColor(.gray, for: .normal)
        never.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return never
    }()
    
    private lazy var remind: UILabel = {
        let remind = UILabel()
        remind.text = "Remind me on a day"
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        remind.isHidden = false
        return remind
    }()
    
    private lazy var remindSwich: UISwitch = {
        let remindSwich = UISwitch()
        remindSwich.isOn = true
        remindSwich.isHidden = false
        return remindSwich
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdenrifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdenrifier)
        self.setupUI()
        
        picker.date = Date()
        picker.addTarget(self, action: #selector(pickerValueChanged(_:)), for: .valueChanged)
        updateLabelDate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.contentView.addSubview(stackView)
        picker.translatesAutoresizingMaskIntoConstraints = false
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        Repeat.translatesAutoresizingMaskIntoConstraints = false
        never.translatesAutoresizingMaskIntoConstraints = false
        remind.translatesAutoresizingMaskIntoConstraints = false
        remindSwich.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
            remind.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 14),
            remind.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            remind.bottomAnchor.constraint(equalTo: pickerLabel.topAnchor,constant: -25),
            
            remindSwich.topAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.topAnchor, constant: 14),
            remindSwich.rightAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.rightAnchor, constant: -16),
            remindSwich.bottomAnchor.constraint(equalTo: pickerLabel.layoutMarginsGuide.topAnchor, constant: -25),
            
            pickerLabel.topAnchor.constraint(equalTo: remind.layoutMarginsGuide.bottomAnchor, constant: 25),
            pickerLabel.leftAnchor.constraint(equalTo: contentUIView.layoutMarginsGuide.leftAnchor,constant: 8),
            pickerLabel.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: 5),
            
            picker.topAnchor.constraint(equalTo: pickerLabel.bottomAnchor , constant: 1),
            picker.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            picker.bottomAnchor.constraint(equalTo: Repeat.topAnchor,constant: -16),
            
            Repeat.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 5),
            Repeat.leftAnchor.constraint(equalTo: contentUIView.leftAnchor, constant: 16),
            Repeat.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor, constant: -16),
            
            never.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 5),
            never.rightAnchor.constraint(equalTo: disclosureIndicatorImageView.leftAnchor,constant: -5),
            never.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor, constant: -16),
            
            disclosureIndicatorImageView.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 12),
            disclosureIndicatorImageView.leftAnchor.constraint(equalTo: never.rightAnchor, constant: 5),
            disclosureIndicatorImageView.rightAnchor.constraint(equalTo: contentUIView.rightAnchor,constant: -10),
            disclosureIndicatorImageView.bottomAnchor.constraint(equalTo: contentUIView.bottomAnchor, constant: -22),
        ])
    }
    
    @objc private func uttonTapped(_ sender: UIButton) {
        _ = contentUIView.isHidden
      UIView.animate(
       withDuration: 0.3, delay: 0, options: .curveEaseIn,
        animations: {
          self.contentUIView.subviews.forEach { $0.isHidden = !$0.isHidden }
          self.contentUIView.isHidden = !self.contentUIView.isHidden
      })
    }
    
    func updateLabelDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        pickerLabel.text = dateFormatter.string(from: picker.date)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
        secondViewController?.nextView()
    }
    
    @objc func pickerValueChanged(_ sender: UIDatePicker){
        updateLabelDate()
    }
}


