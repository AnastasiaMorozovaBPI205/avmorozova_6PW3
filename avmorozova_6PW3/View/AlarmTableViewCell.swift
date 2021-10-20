//
//  EyeCell.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 20.10.2021.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    public func setupAlarmCell(){
        self.backgroundColor = .magenta
       
        setupAlarmToggle()
        setupAlarmTimeLabel()
    }
   
    public let alarmTimeLabel = UILabel()
    
    
     override func prepareForReuse() {
             super.prepareForReuse()
         self.alarmTimeLabel.text = ""
         self.alarmToggle.isOn = false
     }
    
   private func setupAlarmTimeLabel() {
       self.addSubview(alarmTimeLabel)
    
       let hours = Int.random(in: 0...23)
       let minutes = Int.random(in: 0...59)
    
       alarmTimeLabel.text = "\(hours):\(minutes)"
       alarmTimeLabel.textColor = .white
    
       if (hours < 10) {
           alarmTimeLabel.text = "0\(hours):\(minutes)"
       } else if (minutes < 10) {
           alarmTimeLabel.text = "\(hours):0\(minutes)"
       }
    
       if (hours < 10 && minutes < 10) {
           alarmTimeLabel.text = "0\(hours):0\(minutes)"
       }
       
       alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
   
       alarmTimeLabel.pinLeft(to: self.leadingAnchor, 20)
       alarmTimeLabel.pinTop(to: self.topAnchor, 15)
   }
    
   let alarmToggle = UISwitch()

   private func setupAlarmToggle() {
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
