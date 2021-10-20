//
//  AlarmView.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//

import UIKit

class AlarmView: UIView {
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .magenta
        
        setupAlarmToggle()
        setupAlarmTimeLabel()
      }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }
    
    public let alarmTimeLabel = UILabel()
    
    private func setupAlarmTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
        alarmTimeLabel.text = dateString
            
        self.addSubview(alarmTimeLabel)
        
        alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    
        alarmTimeLabel.pinLeft(to: self.leadingAnchor, 20)
        alarmTimeLabel.pinTop(to: self.topAnchor, 15)
    }

    private func setupAlarmToggle() {
        let alarmToggle = UISwitch()
        self.addSubview(alarmToggle)

        alarmToggle.translatesAutoresizingMaskIntoConstraints = false
        alarmToggle.pinRight(to: self.trailingAnchor, 20)
        alarmToggle.pinTop(to: self.topAnchor, 10)
       
        alarmToggle.addTarget(self, action: #selector(alarmToggleSwitched),for: .valueChanged)
    }
    
    @objc
     func alarmToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            
        } else {
            
        }
     }

}
