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
    
    let colors = Colors()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pomodoro Timer"
        label.font = UIFont.boldSystemFont(ofSize: 68)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
//        button.frame = CGRect(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height - 50, width: 100, height: 40)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.deepBlue
        
        view.addSubview(titleLabel)
        titleLabel.textColor = colors.yellow
        
        view.addSubview(startButton)
        startButton.backgroundColor = colors.lightBlue
        startButton.tintColor = colors.white
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    func startTimer() {
        let nextView = StudyView()
        nextView.modalPresentationStyle = .fullScreen
        present(nextView, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
}

