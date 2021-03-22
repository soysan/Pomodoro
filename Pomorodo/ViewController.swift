//
//  ViewController.swift
//  Pomorodo
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - ScreenDirection
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    // MARK: - Properties
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    // MARK: - Helpers
}

