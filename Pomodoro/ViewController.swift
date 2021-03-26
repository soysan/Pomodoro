//
//  ViewController.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - ScreenDirection
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    // MARK: - Properties
    
    let colors = Colors()
    
    static var setCount = 1
    static var is_50mins = false
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pomodoro Timer"
        label.font = UIFont.boldSystemFont(ofSize: 68)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.addTarget(self, action: #selector(goToNext(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let modeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Mode Setting", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
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
        
        setPosition()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ViewController.setCount = 1
    }
    
    // MARK: - Actions
    
    @objc
    func goToNext(_ sender: UIButton) {
        let nextView = StudyView()
        self.navigationController?.hidesBarsOnTap = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @objc
    func goToSetting(_ sender: UIButton) {
        let nextView = SettingView()
        nextView.modalPresentationStyle = .fullScreen
        nextView.modalTransitionStyle = .crossDissolve
        present(nextView, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func setPosition() {
        titleLabel.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
        })
        startButton.snp.makeConstraints({ make in
            make.width.equalTo(200)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        })
        modeButton.snp.makeConstraints({ make in
            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
        })
    }
}

