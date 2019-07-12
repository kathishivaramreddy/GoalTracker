//
//  GoalsAddVCViewController.swift
//  GoalTracker
//
//  Created by apple on 7/12/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class GoalsAddVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyBoard()
    }
    
    
    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
