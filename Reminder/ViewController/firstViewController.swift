//
//  ViewController.swift
//  Reminder
//
//  Created by Андрей on 01.03.2024.
//
import UIKit

class firstViewController: UITableViewController {
    
    @objc private func rightBarButton(){}
    @objc private func leftBarButton(){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        view.backgroundColor = UIColor(red: 242/255.0, green: 240/255.0, blue: 248/255.0, alpha: 255/255.0)
        
        tableView.register(CellOne.self, forCellReuseIdentifier: CellOne.identifier)
        tableView.register(CellTwo.self, forCellReuseIdentifier: CellTwo.identifier)
        tableView.register(CellThree.self, forCellReuseIdentifier: CellThree.identifier)
        tableView.register(CellFour.self, forCellReuseIdentifier: CellFour.identifier)
        
        self.navigationItem.title = "Create Reminder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightBarButton))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarButton))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            switch indexPath.row {
            case 0:
                let cell =  tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! CellOne
                cell.sectionButton.addTarget(self,action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
                cell.selectionStyle = .none
                return cell
            case 1:
                    let cell =  tableView.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath) as! CellTwo
                cell.selectionStyle = .none
                cell.secondViewController = self
                    cell.sectionButton.addTarget(self,action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
                    return cell
            case 2:
                let cell =  tableView.dequeueReusableCell(withIdentifier: "CellThree", for: indexPath) as! CellThree
                cell.selectionStyle = .none
                cell.sectionButton.addTarget(self,action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
                return cell
            case 3:
                    let cell =  tableView.dequeueReusableCell(withIdentifier: "CellFour", for: indexPath) as! CellFour
                cell.selectionStyle = .none
                cell.sectionButton.addTarget(self,action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
                    return cell
            default:
                return UITableViewCell()
            }
        }
    
    @objc func refreshButtonTapped(_ sender: UIButton){
        tableView.reloadData()
    }
    
    func nextView(){
        navigationController?.pushViewController(secondViewController(), animated: true)
    }
}
