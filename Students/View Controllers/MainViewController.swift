//
//  MainViewController.swift
//  Students
//
//  Created by Lambda_School_Loaner_34 on 8/26/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //properties
    private let networkClient = NetworkClient()
    private var studentsTableViewController: StudentsTableViewController!
    private var students: [Student] = []
    
    //outlets
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) in
            if let error = error {
                NSLog("Error loading students; \(error)")
                return
            }
            //switch to main thread
            DispatchQueue.main.async {
                self.students = students ?? []
            }
        }
    }
    
    private func updateSort() {
        let assortedStudents: [Student]
        if sortSelector.selectedSegmentIndex == 0 {
            assortedStudents = students.sorted { $0.firstName < $1.firstName }
        } else {
            assortedStudents = students.sorted {
                ($0.lastName ?? "") < ($1.lastName ?? "")
            }
        }
        studentsTableViewController.students = sortedStudents
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            studentsTableViewController = (segue.destination as! StudentsTableViewController)
            
        }
    }

}
