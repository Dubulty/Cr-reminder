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
        UIView.addSubview(remindSwich)
        UIView.addSubview(Repeat)
        UIView.addSubview(never)
        UIView.addSubview(picker)
        UIView.addSubview(pickerLabel)
        UIView.addSubview(disclosureIndicatorImageView)
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
    
    private lazy var Repeat: UILabel = {
        let Repeat = UILabel()
        Repeat.text = "Repeat"
        Repeat.translatesAutoresizingMaskIntoConstraints = false
        return Repeat
    }()
    
    private lazy var never: UIButton = {
        let never = UIButton()
        never.setTitle("Never", for: .normal)
        never.setTitleColor(.gray, for: .normal)
        never.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        never.translatesAutoresizingMaskIntoConstraints = false
        return never
    }()
    
    private lazy var remind: UILabel = {
        let remind = UILabel()
        remind.text = "Remind me on a day"
        remind.font = .systemFont(ofSize: 17, weight: .medium)
        remind.translatesAutoresizingMaskIntoConstraints = false
        return remind
    }()
    
    private lazy var remindSwich: UISwitch = {
        let remindSwich = UISwitch()
        remindSwich.isOn = true
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
            make.top.equalTo(contentUIView).offset(14)
            make.left.equalTo(contentUIView).offset(16)
            make.bottom.equalTo(pickerLabel.snp.top).offset(-25)
        }
        
        remindSwich.snp.makeConstraints{make in
            make.top.equalTo(contentUIView).offset(14)
            make.bottom.equalTo(pickerLabel.snp.top).offset(-25)
            make.right.equalTo(contentUIView).offset(-16)
        }
        
        pickerLabel.snp.makeConstraints{make in
            make.top.equalTo(remind.snp.bottom).offset(25)
            make.bottom.equalTo(picker.snp.top).offset(-5)
            make.left.equalTo(contentUIView).offset(16)
        }
        
        picker.snp.makeConstraints{make in
            make.top.equalTo(pickerLabel.snp.bottom).offset(1)
            make.bottom.equalTo(Repeat.snp.top).offset(-16)
            make.left.equalTo(contentUIView).offset(16)
        }
        
        Repeat.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(5)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.left.equalTo(contentUIView).offset(16)
        }
        
        never.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(5)
            make.bottom.equalTo(contentUIView).offset(-16)
            make.right.equalTo(disclosureIndicatorImageView.snp.left).offset(-5)
        }
        
        disclosureIndicatorImageView.snp.makeConstraints{make in
            make.top.equalTo(picker.snp.bottom).offset(12)
            make.bottom.equalTo(contentUIView).offset(-22)
            make.left.equalTo(never.snp.right).offset(5)
            make.right.equalTo(contentUIView).offset(-10)
        }
    }
    
    private func updateLabelDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        pickerLabel.text = dateFormatter.string(from: picker.date)
    }
    
    @objc private func pickerValueChanged(_ sender: UIDatePicker){
        updateLabelDate()
    }
    
    @IBAction private func goToNextViewController(_ sender: UIButton){
        secondViewController?.nextView()
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

