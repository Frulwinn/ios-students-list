//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Lambda_School_Loaner_34 on 8/26/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        cell.textLabel?.text = students[indexPath.row].name

        return cell
    }
}
