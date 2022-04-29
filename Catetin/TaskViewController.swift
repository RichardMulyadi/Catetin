//
//  TaskViewController.swift
//  Catetin
//
//  Created by Richard Mulyadi
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your Task"
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
//        let newCount = ViewController().count - 1
//
//         UserDefaults().setValue(newCount, forKey: "count")
//         UserDefaults().setValue(nil, forKey: "task\(currentPosition)")
    }

}
