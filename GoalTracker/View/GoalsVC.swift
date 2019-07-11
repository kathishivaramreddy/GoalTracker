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
        
    }


}


extension GoalsVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCellTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}

