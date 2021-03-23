//
//  StudyView.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit

class StudyView: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    
    var timer = Timer()
//    var currentTime = ViewController.is_50mins ? 3000 : 1500;
    var currentTime = 5

    let setLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Concentration"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        // MARK: Breakの方もだがresetを押すとwindow hierarchyエラーになる。(データを消せないか？）
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colors.deepBlue
        
        view.addSubview(sectionLabel)
        sectionLabel.textColor = colors.white
        
        view.addSubview(setLabel)
        setLabel.textColor = colors.white
        
        view.addSubview(minsLabel)
        minsLabel.text = String(currentTime / 60)
        minsLabel.textColor = colors.white
        
        view.addSubview(secLabel)
        secLabel.text = ": 00"
        secLabel.textColor = colors.white
        
        view.addSubview(resetButton)
        resetButton.backgroundColor = colors.lightBlue
        resetButton.tintColor = colors.white
        
        minsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        minsLabel.leadingAnchor.constraint(equalTo: setLabel.trailingAnchor, constant: 20).isActive = true
        
        secLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        secLabel.leadingAnchor.constraint(equalTo: minsLabel.trailingAnchor, constant: 8).isActive = true
        
        sectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        sectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        setLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        setLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        resetButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setLabel.text = String(ViewController.setCount) + " / 10"
        updateTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            
            let currentMin = self.currentTime / 60
            self.minsLabel.text = currentMin < 10 ? "0" + String(currentMin) : String(currentMin);
            let currentSec = self.currentTime % 60
            self.secLabel.text = currentSec < 10 ? ": 0" + String(currentSec) : ": " + String(currentSec);
            
            if self.currentTime == 0 {
//                self.currentTime = ViewController.is_50mins ? 3000 : 1500;
                self.currentTime = 5
                timer.invalidate()
                let nextView = BreakView()
                nextView.modalPresentationStyle = .fullScreen
                nextView.modalTransitionStyle = .crossDissolve
                self.present(nextView, animated: true, completion: nil)
            }
        })
    }
}
