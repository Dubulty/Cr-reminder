//
//  cellThree.swift
//  Reminder
//
//  Created by Андрей Коновалов on 04.03.2024.
//

import UIKit
import SnapKit

class DateTimeCell: UITableViewCell {
    
    static let identifier = "DateTimeCell"
    
    var secondViewController: ReminderViewController?
    
    private lazy var secondaryView: UIView = {
        let UIView = UIView()
        UIView.addSubview(repeatLabel)
        UIView.addSubview(neverButton)
        UIView.addSubview(picker)
        UIView.addSubview(pickerLabel)
        UIView.addSubview(disclosureIndicatorImageView)
        UIView.translatesAutoresizingMaskIntoConstraints = false
        return UIView
    }()
    
    private lazy var mainContentView: UIView = {
        let UIView = UIView()
        UIView.addSubview(remindLabel)
        UIView.addSubview(remindSwich)
        UIView.translatesAutoresizingMaskIntoConstraints = false
        return UIView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(mainContentView)
        stackView.addArrangedSubview(secondaryView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - content
    private lazy var disclosureIndicatorImageView: UIImageView = {
        let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
        disclosureIndicator.tintColor = .gray
        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        return disclosureIndicator
    }()
    
    private lazy var picker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.date = Date()
        picker.addTarget(self, action: #selector(pickerValueChanged(_:)), for: .valueChanged)
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var pickerLabel: UILabel = {
        let pickerLabel = UILabel()
        pickerLabel.font = .systemFont(ofSize: 17, weight: .medium)
        pickerLabel.textColor = UIColor(red: 0/255.0, green: 112/255.0, blue: 201/255.0, alpha: 255/255.0)
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        return pickerLabel
    }()
    
    private lazy var repeatLabel: UILabel = {
        let Repeat = UILabel()
        Repeat.text = "Repeat"
        Repeat.translatesAutoresizingMaskIntoConstraints = false
        return Repeat
    }()
    
    private lazy var neverButton: UIButton = {
        let never = UIButton()
        never.setTitle("Never", for: .normal)
        never.setTitleColor(.gray, for: .normal)
        never.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        never.translatesAutoresizingMaskIntoConstraints = false
        return never
    }()
    
    private lazy var remindLabel: UILabel = {
        let remind = UILabel()
        remind.text = "Remind me on a day"
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        remind.translatesAutoresizingMaskIntoConstraints = false
        return remind
    }()
    
    lazy var remindSwich: UISwitch = {
        let remindSwich = UISwitch()
        remindSwich.addTarget(self, action: #selector(toggleCellButton(_:)), for: .touchUpInside)
        remindSwich.translatesAutoresizingMaskIntoConstraints = false
        return remindSwich
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdenrifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdenrifier)
        self.setupUI()
        selectionStyle = .none
        
        updateLabelDate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DateTimeCell{
    
    private func setupUI() {
        
        self.contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints{make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
        }
        
        remindLabel.snp.makeConstraints{make in
            make.top.equalTo(mainContentView).offset(14)
            make.left.equalTo(mainContentView).offset(16)
            make.bottom.equalTo(mainContentView).offset(-16)
        }
        
        remindSwich.snp.makeConstraints{make in
            make.top.equalTo(mainContentView).offset(14)
            make.right.equalTo(mainContentView).offset(-16)
            make.bottom.equalTo(mainContentView).offset(-16)
        }
        
        pickerLabel.snp.makeConstraints{make in
            make.top.equalTo(secondaryView)
            make.bottom.equalTo(picker.snp.top).offset(-5)
            make.left.equalTo(secondaryView).offset(16)
        }
        
        picker.snp.makeConstraints{make in
            make.top.equalTo(pickerLabel.snp.bottom).offset(1)
            make.bottom.equalTo(repeatLabel.snp.top).offset(-16)
            make.left.equalTo(secondaryView).offset(16)
        }
        
        repeatLabel.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(5)
            make.bottom.equalTo(secondaryView).offset(-16)
            make.left.equalTo(secondaryView).offset(16)
        }
        
        neverButton.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(5)
            make.bottom.equalTo(secondaryView).offset(-16)
            make.right.equalTo(disclosureIndicatorImageView.snp.left).offset(-5)
        }
        
        disclosureIndicatorImageView.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(12)
            make.bottom.equalTo(secondaryView).offset(-22)
            make.left.equalTo(neverButton.snp.right).offset(5)
            make.right.equalTo(secondaryView).offset(-10)
        }
    }
    
    private func updateLabelDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        pickerLabel.text = dateFormatter.string(from: picker.date)
    }
    
    @objc private func pickerValueChanged(_ sender: UIDatePicker){
        updateLabelDate()
    }
    
    @IBAction private func goToNextViewController(_ sender: UIButton) {
        secondViewController?.nextView()
    }
    
    @objc private func toggleCellButton(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.3, delay: 0, options: .curveEaseIn,
            animations: {
                self.secondaryView.isHidden.toggle()
                self.layoutIfNeeded()
            })
    }
}

