//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Maitree Bain on 11/12/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swiftTopicsTableView: UITableView!
    

    
    let swiftTopics = ["Basic Operators", "Strings and Characters", "Collection Types", "Control Flow", "Functions",
                       "Closures", "Enumerations", "Structures and Classes", "Properties", "Methods", "Subscripts",
                       "Inheritance", "Initialization", "Deinitialization", "Optional Chaining", "Error Handling",
                       "Type Casting", "Nested Types", "Extensions", "Protocols", "Generics", "Opaque Types",
                       "Automatic Reference Counting", "Memory Safety", "Access Control", "Advanced Operators"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swiftTopicsTableView.dataSource = self
        
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print("segue")
            
            guard let newVC = segue.destination as? newViewController,
                let indexPath = swiftTopicsTableView.indexPathForSelectedRow else {
                return 
            }
            
            newVC.navigationItem.title = swiftTopics[indexPath.row]
        }

    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)
        
        let swiftItem = swiftTopics[indexPath.row]
        
        cell.textLabel?.text = swiftItem
        
        return cell
    }
}
