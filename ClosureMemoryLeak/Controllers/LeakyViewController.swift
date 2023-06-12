//
//  LeakyViewController.swift
//  ClosureMemoryLeak
//
//  Created by Apple Computer on 6/11/23.
//

import UIKit

// MARK: - LeakyViewController: UIViewController

class LeakyViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: LeakyViewController references LeakyButton
    let leakyButton = LeakyButton()
    var timesTapped = 0
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white
        leakyButton.frame = view.frame
        
        // NOTE: Closure references LeakyViewController (timesTapped)
        leakyButton.onTapClosure = {
            self.timesTapped += 1
            print("button tapped \(self.timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("LeakyViewController deinitialized!")
    }
}
