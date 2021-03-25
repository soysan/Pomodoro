//
//  StudyView.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit
import AVFoundation

class StudyView: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    var avPlayer: AVAudioPlayer!
    
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
        
        minsLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(setLabel.snp.trailing).offset(20)
        })
        secLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(minsLabel.snp.trailing).offset(8)
        })
        sectionLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        })
        setLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        })
        resetButton.snp.makeConstraints({ make in
            make.width.equalTo(70)
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        })
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
