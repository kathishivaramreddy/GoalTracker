//
//  GoalsAddVCViewController.swift
//  GoalTracker
//
//  Created by apple on 7/12/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class GoalsAddVCViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextButton.bindToKeyBoard()
        shortTermButton.isSelected = true
    }
    
    
    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var shortTermButton: UIButton!
    var goalType: GoalType = .shortTerm
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func shortTermPressed(_ sender: UIButton) {
        
        goalType = .shortTerm
        shortTermButton.isSelected = true
        longTermButton.isSelected = false
    }
    
    @IBAction func longTermButtonPressed(_ sender: UIButton) {
        goalType = .longTerm
        longTermButton.isSelected = true
        shortTermButton.isSelected = false
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if goalTextView.text != "" && goalTextView.text != "What is  your goal ?" {
            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoal") as? CreateGoalVC else  { return }
            
            finishGoalVC.initData(goal: goalTextView.text, type: goalType)
            present(finishGoalVC, animated: true, completion: nil)
            
        }
        
        
    }
    
}
