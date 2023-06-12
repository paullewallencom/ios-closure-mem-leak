//
//  MainViewController.swift
//  ClosureMemoryLeak
//
//  Created by Apple Computer on 6/11/23.
//

import UIKit

// MARK: - MainViewController: UIViewController

class MainViewController: UIViewController {

    @IBAction func pushLeakyVC(_ sender: Any) {
        navigationController?.pushViewController(LeakyViewController(), animated: true)
    }
    
    @IBAction func pushUnownedVC(_ sender: Any) {
        navigationController?.pushViewController(UnownedViewController(), animated: true)
    }
    
    @IBAction func pushNoCycleVC(_ sender: Any) {
        navigationController?.pushViewController(NoCycleViewController(), animated: true)
    }
}
