//
//  BreakView.swift
//  Pomodoro
//
//  Created by Masayuki Yamaguchi on 2021/03/22.
//

import AVFoundation
import SnapKit
import UIKit

class BreakView: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    var avPlayer: AVAudioPlayer!
    
    var timer = Timer()
    var currentTime = ViewController.is_50mins ? 600 : 300;
    
    let setLabel: UILabel = {
        let label = UILabel()
        label.text = " / 10"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let minsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let secLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Break"
        label.font = UIFont.boldSystemFont(ofSize: 30)
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
        button.addTarget(self, action: #selector(goToTop(_:)), for: .touchUpInside)
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
        
        view.addSubview(minsLabel)
        minsLabel.text = String(currentTime / 60)
        minsLabel.textColor = colors.white
        
        view.addSubview(secLabel)
        secLabel.text = ": 00"
        secLabel.textColor = colors.white
        
        view.addSubview(resetButton)
        resetButton.backgroundColor = colors.lightBlue
        resetButton.tintColor = colors.white
        
        setPosition()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTime()
        setLabel.text = String(ViewController.setCount) + " / 10"
    }
    
    // MARK: - Actions
    
    @objc
    func goToTop(_ sender: UIButton) {
        self.navigationController?.hidesBarsOnTap = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func fireSound() {
        let pathToSound = Bundle.main.path(forResource: "zihou", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do {
            // MARK: no crash but No factory registered for id
            avPlayer = try AVAudioPlayer(contentsOf: url)
            avPlayer.prepareToPlay()
            avPlayer.play()
        } catch {
            print(error)
        }
    }
    
    func updateTime() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.currentTime -= 1
            
            let currentMin = self.currentTime / 60
            self.minsLabel.text = currentMin < 10 ? "0" + String(currentMin) : String(currentMin);
            let currentSec = self.currentTime % 60
            self.secLabel.text = currentSec < 10 ? ": 0" + String(currentSec) : ": " + String(currentSec);
            
            if self.currentTime == 3 { self.fireSound() }
            
            if self.currentTime == 0 {
                self.currentTime = ViewController.is_50mins ? 600 : 300;
                timer.invalidate()
                ViewController.setCount += 1
                self.goBack()
            }
        })
    }
    
    func goBack() {
        self.navigationController?.hidesBarsOnTap = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func setPosition() {
        minsLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(setLabel.snp.trailing).offset(20)
        })
        secLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(minsLabel.snp.trailing).offset(8)
        })
        setLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        })
        sectionLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        })
        resetButton.snp.makeConstraints({ make in
            make.width.equalTo(70)
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        })
    }
}
