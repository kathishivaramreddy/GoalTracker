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
        
        fetchFromCoreData { (finished) in
            if finished {
                if  goals.count > 0{
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }
    

    @IBAction func addGoalButtonPressed(_ sender: UIButton) {
        
        guard let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "GoalsAddVC") else { return }
        present(addGoalVC, animated: true, completion: nil)
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
    
}

extension GoalsVC {
    
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
    
}



