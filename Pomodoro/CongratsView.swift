//
//  CongratsView.swift
//  Pomodoro
//
//  Created by 山口雅之 on 2021/03/26.
//

import SnapKit
import UIKit

class Congrats: UIViewController {
    
    // MARK: - Properties
    
    let colors = Colors()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Congratulations!!!"
        label.font = UIFont.boldSystemFont(ofSize: 68)
        return label
    }()
    
    let paraLabel: UILabel = {
        let label = UILabel()
        label.text = "You have done all 10 sets of studying!!!"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let para2Label: UILabel = {
        let label = UILabel()
        label.text = "Now you must take a rest. See you later."
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.deepBlue
        
        view.addSubview(titleLabel)
        titleLabel.textColor = colors.white
        
        view.addSubview(paraLabel)
        paraLabel.textColor = colors.white
        
        view.addSubview(para2Label)
        para2Label.textColor = colors.white
        
        setPosition()
    }
    
    // MARK: - Helpers
    
    func setPosition() {
        titleLabel.snp.makeConstraints({ make in
            make.centerY.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
        })
        paraLabel.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        })
        para2Label.snp.makeConstraints({ make in
            make.top.equalTo(paraLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        })
    }
}
