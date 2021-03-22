//
//  Functions.swift
//  Pomorodo
//
//  Created by 山口雅之 on 2021/03/22.
//

import UIKit

struct Functions {
    
    func setButton(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, label: String, bgColor: UIColor, textColor: UIColor, fontSize: CGFloat) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.setTitle(label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.backgroundColor = bgColor
        button.tintColor = textColor
        return button
    }
}
