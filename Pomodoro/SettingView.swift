//
//  SettingView.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit

class SettingView: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let mode_25Button: UIButton = {
        let button = UIButton()
        button.setTitle("25minites / 5minites", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.addTarget(self, action: #selector(mode25), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let mode_50Button: UIButton = {
        let button = UIButton()
        button.setTitle("50minites / 10minites", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.addTarget(self, action: #selector(mode50), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.deepBlue
        
        view.addSubview(resetButton)
        resetButton.backgroundColor = colors.lightBlue
        resetButton.tintColor = colors.white
        
        view.addSubview(mode_25Button)
        mode_25Button.backgroundColor = colors.lightBlue
        mode_25Button.tintColor = colors.white
        
        view.addSubview(mode_50Button)
        mode_50Button.backgroundColor = colors.lightBlue
        mode_50Button.tintColor = colors.white
        
        resetButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        mode_25Button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        mode_25Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mode_25Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -300).isActive = true
        
        mode_50Button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        mode_50Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mode_50Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -300).isActive = true
        
    }
    
    // MARK: - Actions

    @objc
    private func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func mode25() {
        ViewController.is_50mins = false
        mode_25Button.backgroundColor = colors.yellow
        mode_50Button.backgroundColor = colors.lightBlue
    }
    
    @objc
    private func mode50() {
        ViewController.is_50mins = true
        mode_25Button.backgroundColor = colors.lightBlue
        mode_50Button.backgroundColor = colors.yellow
    }
    // MARK: - Helpers
}
