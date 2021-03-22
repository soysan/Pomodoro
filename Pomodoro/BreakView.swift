//
//  BreakView.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit

class BreakView: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    
    var timer = Timer()
    var currentTime = 5
    
    let setLabel: UILabel = {
       let label = UILabel()
        label.text = " / 10"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Break"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.yellow
        
        view.addSubview(sectionLabel)
        sectionLabel.textColor = colors.white
        
        view.addSubview(setLabel)
        setLabel.textColor = colors.white
        
        view.addSubview(timeLabel)
        timeLabel.text = String(currentTime)
        timeLabel.textColor = colors.white
        
        view.addSubview(resetButton)
        resetButton.backgroundColor = colors.lightBlue
        resetButton.tintColor = colors.white
        
        timeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: setLabel.trailingAnchor, constant: 20).isActive = true

        setLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        setLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        sectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        sectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        resetButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTime()
        setLabel.text = String(ViewController.setCount) + " / 10"
    }
    
    // MARK: - Actions
    
    @objc
    func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Helpers

    func updateTime() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.currentTime -= 1
            self.timeLabel.text = String(self.currentTime)
            
            if self.currentTime == 0 {
                self.currentTime = 5
                ViewController.setCount += 1
                timer.invalidate()
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
