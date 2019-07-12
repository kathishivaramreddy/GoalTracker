//
//  ViewController.swift
//  GoalTracker
//
//  Created by apple on 7/11/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configureGoalCell(description: "Apply for swift jobs", type: .longTerm, progress: 3)
        return cell
    }
    
    
}

