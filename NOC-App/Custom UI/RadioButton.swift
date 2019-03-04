//
//  RadioButton.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 3/4/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

// Obtained from https://stackoverflow.com/a/33519147/5025731
class RadioButton: UIButton {
    var alternateButton: Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.borderWidth = 2
        self.backgroundColor = .white
        self.titleLabel?.textColor = UIColor.FlatColor.Gray.WhiteSmoke
        self.tintColor = .clear
        self.makeRoundedCorners(by: 14)
        self.layer.masksToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.titleLabel?.textColor = .white
                self.backgroundColor = UIColor.FlatColor.Blue.PictonBlue
                self.layer.borderColor = UIColor.FlatColor.Blue.PictonBlue.cgColor
            } else {
                self.titleLabel?.textColor = UIColor.FlatColor.Gray.Iron
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.FlatColor.Gray.WhiteSmoke.cgColor
            }
        }
    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
    }
}
