//
//  NoCycleViewController.swift
//  ClosureMemoryLeak
//
//  Created by Apple Computer on 6/11/23.
//

import UIKit

// MARK: - NoCycleViewController: UIViewController

class NoCycleViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: NoCycleViewController references LeakyButton
    let leakyButton = LeakyButton()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white
        leakyButton.frame = view.frame
        
        // NOTE: Closure doesn't need to reference NoCycleViewController; cycle broken!
        var timesTapped = 0
        leakyButton.onTapClosure = {
            timesTapped += 1
            print("button tapped \(timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("NoCycleViewController deinitialized!")
    }
}
