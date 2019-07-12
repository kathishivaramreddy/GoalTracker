//
//  CreateGoalVC.swift
//  GoalTracker
//
//  Created by apple on 7/12/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goalPointTextField: UITextField!
    @IBOutlet weak var createGoalButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalButton.bindToKeyBoard()
    }
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(goal: String, type: GoalType) {
        
    }
    
    
    @IBAction func createGoalButtonPressed(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
