//
//  ViewController.swift
//  GoalTracker
//
//  Created by apple on 7/11/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
    
    var goals = [Goal]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchGoals()
        
        tableView.reloadData()
    }
    

    @IBAction func addGoalButtonPressed(_ sender: UIButton) {
        
        guard let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "GoalsAddVC") else { return }
        present(addGoalVC, animated: true, completion: nil)
    }
    
    func  fetchGoals() {
        fetchFromCoreData { (finished) in
            if finished {
                if  goals.count > 0{
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
    }
}


extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCellTableViewCell else {
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        cell.configureGoalCell(goal: goal)
        return cell
    }
    
    //for editing
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELTE") { (tableViewRowAction, indexPath) in
            self.deleteFromCoreData(at: indexPath)
            self.fetchGoals()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        let addAction = UITableViewRowAction(style: .normal, title: "Progress ↑") { (tableRowAction, indexPath) in
            self.setGoalProgress(at: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        addAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return [deleteAction,addAction]
    }

}

extension GoalsVC {
    
    func setGoalProgress(at indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goalToBeUpdated = goals[indexPath.row]
        
        if goalToBeUpdated.goalProgress < goalToBeUpdated.goalCompletion {
            goalToBeUpdated.goalProgress += 1
        }
        do {
              try managedContext.save()
            
           
        } catch  {
            debugPrint("\(error.localizedDescription)")
            
        }
        
    }
    
    func fetchFromCoreData(completion: (_ complete: Bool) -> ()) {
       guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
             goals = try managedContext.fetch(fetchRequest)
            
            completion(true)
        } catch  {
            debugPrint("\(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    func deleteFromCoreData(at indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
        } catch  {
            debugPrint("\(error.localizedDescription)")
        }
    }
    
}



