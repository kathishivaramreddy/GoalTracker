//
//  GoalCellTableViewCell.swift
//  GoalTracker
//
//  Created by apple on 7/11/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class GoalCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    
    @IBOutlet weak var goalCompleteView: UIView!
    func configureGoalCell(goal: Goal) {
        
        goalDescriptionLbl.text = goal.goalDescription!
        goalTypeLbl.text = goal.goalType!
        goalProgressLabel.text = String(describing: goal.goalProgress)
    
    
        if goal.goalProgress == goal.goalCompletion {
            goalCompleteView.isHidden = false
        }else{
            goalCompleteView.isHidden = true
        }
    }
    
}
