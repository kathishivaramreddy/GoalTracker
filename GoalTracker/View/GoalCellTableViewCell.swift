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
    
    
    func configureGoalCell(description: String, type: GoalType, progress:Int) {
        
        goalDescriptionLbl.text = description
        goalTypeLbl.text = type.rawValue
        goalProgressLabel.text = String(describing: progress)
    }
    
}
