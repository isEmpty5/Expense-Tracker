//
//  DisplayingOnHomeScreenTableViewController.swift
//  Expense Tracker
//
//  Created by isEmpty on 01.01.2021.
//

import UIKit

final class DisplayingOnHomeScreenTableViewController: UITableViewController {
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            let indexPath = IndexPath(row: UserDefaults.standard.integer(forKey: "DisplayingList"), section: 0)
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = Colors.backgroundColor

    }
}

//MARK: - TableView Delegate & DataSource
extension DisplayingOnHomeScreenTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Displaying.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.backgroundColor = Colors.backgroundColor
        cell.tintColor = .label
        cell.textLabel?.text = Displaying(rawValue: indexPath.row)?.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.setValue(indexPath.row, forKey: "DisplayingList")
        navigationController?.popViewController(animated: true)
    }
}
