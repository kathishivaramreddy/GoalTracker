//
//  CreateGoalVC.swift
//  GoalTracker
//
//  Created by apple on 7/12/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

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
        self.goalDescription = goal
        self.goalType = type
    }
    
    
    @IBAction func createGoalButtonPressed(_ sender: UIButton) {
        
        print("in create goal")
        
        if goalPointTextField.text! != "" {
            save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func save(completion: (_ finished:Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletion = Int32(goalPointTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
           try managedContext.save()
            completion(true)
        }catch {
            debugPrint("\(error.localizedDescription)")
            completion(false)
        }
        
        
    }
    
}
