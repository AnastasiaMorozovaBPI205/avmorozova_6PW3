//
//  TableViewController.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//
import UIKit

class TableViewController: UIViewController {

    private var table: UITableView?
    private var alarms: [AlarmTableViewCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        var alarmCell: AlarmTableViewCell
        for _ in 0...200 {
            alarmCell = AlarmTableViewCell()
            
            alarmCell.setupAlarmCell()
            
            alarmCell.setHeight(to: 50)
            
            alarms.append(alarmCell)
        }
        
        alarms.sort{
            ($0.alarmTimeLabel.text! as String) < ($1.alarmTimeLabel.text! as String)
        }
        
        for n in 0...200 {
            if (n % 2 == 0) {
                alarms[n].backgroundColor = .green
            }
        }
        
        
        table?.register(AlarmTableViewCell.self, forCellReuseIdentifier: "alarmCell")
        
        table?.delegate = self
        table?.dataSource = self

    }
    
    private func setupTableView() {
        let table = UITableView(frame: .zero, style: UITableView.Style.plain)
        view.addSubview(table)
        
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        
        table.backgroundColor = .white
        
        self.table = table
    }

}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { alarms.count
    }

    func numberOfSections(in tableView: UITableView) -> Int { 1 }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "alarmCell",
            for: indexPath
        ) as? AlarmTableViewCell

        cell?.setupAlarmCell()
        let alarm = alarms[indexPath.row]
        cell?.backgroundColor = alarm.backgroundColor
        cell?.alarmTimeLabel.text = alarm.alarmTimeLabel.text
        cell?.alarmToggle.isOn = alarm.alarmToggle.isOn
        
        return cell ?? UITableViewCell()
    }
}
