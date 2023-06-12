//
//  UnownedViewController.swift
//  ClosureMemoryLeak
//
//  Created by Apple Computer on 6/11/23.
//

import UIKit

// MARK: - UnownedViewController: UIViewController

class UnownedViewController: UIViewController {
    
    // MARK: Properties
    
    // NOTE: UnownedViewController references LeakyButton
    let leakyButton = LeakyButton()
    var timesTapped = 0
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure view
        view.backgroundColor = .white
        leakyButton.frame = view.frame
        
        // NOTE: Closure WEAK references UnownedViewController (timesTapped)
        leakyButton.onTapClosure = { [unowned self] in
            self.timesTapped += 1
            print("button tapped \(self.timesTapped) times")
        }
        
        view.addSubview(leakyButton)
    }
    
    deinit {
        print("UnownedViewController deinitialized!")
    }
}
