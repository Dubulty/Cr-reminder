//
//  ViewController.swift
//  Reminder
//
//  Created by Андрей on 01.03.2024.
//

import UIKit

class ReminderViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        view.backgroundColor = UIColor(red: 242/255.0, green: 240/255.0, blue: 248/255.0, alpha: 255/255.0)
        
        tableView.register(GetGroceriesCell.self, forCellReuseIdentifier: GetGroceriesCell.identifier)
        tableView.register(DateTimeCell.self, forCellReuseIdentifier: DateTimeCell.identifier)
        tableView.register(LocationReminderCell.self, forCellReuseIdentifier: LocationReminderCell.identifier)
        tableView.register(PriorityNotesCell.self, forCellReuseIdentifier: PriorityNotesCell.identifier)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 248/255.0, alpha: 255/255.0)
        self.navigationItem.title = "Create Reminder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightBarButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarButton))
    }
    
    @objc func refreshButtonTapped(_ sender: UIButton) {
        tableView.reloadData()
    }
    
    func nextView() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

extension ReminderViewController {
    
    @objc private func rightBarButton(){}
    @objc private func leftBarButton(){}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: GetGroceriesCell.identifier, for: indexPath) as! GetGroceriesCell
            return cell
        case 1:
            let cell =  tableView.dequeueReusableCell(withIdentifier: DateTimeCell.identifier, for: indexPath) as! DateTimeCell
            cell.secondViewController = self
            cell.remindSwich.addTarget(self,action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
            return cell
        case 2:
            let cell =  tableView.dequeueReusableCell(withIdentifier: LocationReminderCell.identifier, for: indexPath) as! LocationReminderCell
            return cell
        case 3:
            let cell =  tableView.dequeueReusableCell(withIdentifier: PriorityNotesCell.identifier, for: indexPath) as! PriorityNotesCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 241/255.0, green: 240/255.0, blue: 246/255.0, alpha: 255/255.0)
        return headerView
    }
}
