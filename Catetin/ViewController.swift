//
//  ViewController.swift
//  Catetin
//
//  Created by Richard Mulyadi
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var tasks = [String]()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemCyan
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        self.title = "Tasks to do"
        tableView.delegate = self
        tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        updateTasks()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
        
        floatingButton.frame = CGRect(x: view.frame.size.width - 100,
                                      y: view.frame.size.height - 100,
                                      width: 60, height: 60)
    }
    
    private func animate(){
        UIView.animate(withDuration: 1.5, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            self.imageView.alpha = 0
        })
    }
//
//        UIView.animate(withDuration: 1.5, animations: {
//            self.imageView.alpha = 0
//        }, completion: { done in
//            if done {
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
//                    let viewController = ViewController()
//                    viewController.modalTransitionStyle = .crossDissolve
//                    viewController.modalPresentationStyle = .fullScreen
//                    self.present(viewController, animated: true)
//                })
//            }
//        })
//        }
        
//        let viewController = HomeViewController()
//        viewController.modalTransitionStyle = .crossDissolve
//        present(viewController, animated: true)
    
    func updateTasks(){
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//
//        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
//
//        if thisTask.completed ==  true {thisTask.completed = false}
//        else {thisTask.completed = true}
//        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
//    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath)
        cell.textLabel?.text = tasks[IndexPath.row]
        return cell
    }
}
        

