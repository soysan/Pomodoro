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
        label.frame = CGRect(x: 200, y: 100, width: 300, height: 100)
        label.text = "Pomodoro Timer"
        label.font = UIFont.boldSystemFont(ofSize: 68)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startTimer(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let modeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setTitle("Mode Setting", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goToSetting(_:)), for: .touchUpInside)
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
        
        view.addSubview(modeButton)
        modeButton.backgroundColor = colors.lightBlue
        modeButton.tintColor = colors.white
        
        titleLabel.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
//        titleLabel.heightAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 2).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -60).isActive = true
        
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        modeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        modeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        modeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Actions
    
    @objc
    func startTimer(_ sender: UIButton) {
        let nextView = StudyView()
        nextView.modalPresentationStyle = .fullScreen
        nextView.modalTransitionStyle = .crossDissolve
        present(nextView, animated: true, completion: nil)
    }
    
    @objc
    func goToSetting(_ sender: UIButton) {
        let nextView = SettingView()
        nextView.modalPresentationStyle = .fullScreen
        nextView.modalTransitionStyle = .crossDissolve
        present(nextView, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
}
