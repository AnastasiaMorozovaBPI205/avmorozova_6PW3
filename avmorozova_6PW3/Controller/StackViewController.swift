//
//  StackViewController.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//

import UIKit

class StackViewController: UIViewController {
    
    private var stack: UIStackView?
    private var scroll: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
        addAlarmView()
    }

    
    private func setupStackView() {
        let scroll = UIScrollView()
        let stack = UIStackView(frame: .zero)
        
        view.addSubview(scroll)
        
        scroll.alwaysBounceVertical = true
        
        scroll.addSubview(stack)
        
        scroll.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to: view, .left, .right)
        
        stack.pin(to: scroll, .top, .left, .right, .bottom)
        
        self.stack = stack
        self.scroll = scroll
    }
    
    private func addAlarmView() {
        
        self.stack?.axis = .vertical
        
        var alarms: [AlarmView] = []
        
        var alarmView: AlarmView
        for _ in 0...15 {
            alarmView = AlarmView()
            
            alarmView.setHeight(to: 50)
            
            let hours = Int.random(in: 0...23)
            let minutes = Int.random(in: 0...59)
            
            alarmView.alarmTimeLabel.text = "\(hours):\(minutes)"
            alarmView.alarmTimeLabel.textColor = .white
            
            if (hours < 10) {
                alarmView.alarmTimeLabel.text = "0\(hours):\(minutes)"
            } else if (minutes < 10) {
                alarmView.alarmTimeLabel.text = "\(hours):0\(minutes)"
            }
            
            if (hours < 10 && minutes < 10) {
                alarmView.alarmTimeLabel.text = "0\(hours):0\(minutes)"
            }
            
            alarms.append(alarmView)
        }
        
        alarms.sort{
            ($0.alarmTimeLabel.text! as String) < ($1.alarmTimeLabel.text! as String)
        }
        
        for n in 0...15 {
            if (n % 2 == 0) {
                alarms[n].backgroundColor = .green
            }
            
            self.stack?.addArrangedSubview(alarms[n])
            alarms[n].pinWidth(to: scroll!.widthAnchor)
        }
    }
}
