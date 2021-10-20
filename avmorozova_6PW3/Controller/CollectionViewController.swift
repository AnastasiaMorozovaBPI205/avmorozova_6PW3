//
//  CollectionViewController.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//

import UIKit

class CollectionViewController: UIViewController {

    private var collection: UICollectionView?
    private var alarms: [AlarmCollectionViewCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        var alarmCell: AlarmCollectionViewCell
        for _ in 0...200 {
            alarmCell = AlarmCollectionViewCell()
            
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
        
        
        collection?.register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: "alarmCollectionViewCell")
        
        collection?.dataSource = self
        collection?.delegate = self
    }

    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: 60, height: 60)
        layoutFlow.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        
        collection.backgroundColor = .white
        
        self.collection = collection
    }

}

extension CollectionViewController: UICollectionViewDelegate {
    @objc(collectionView:numberOfItemsInSection:) func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alarms.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alarmCollectionViewCell", for: indexPath as IndexPath) as! AlarmCollectionViewCell
            
        cell.setupAlarmCell()
        let alarm = alarms[indexPath.row]
        cell.backgroundColor = alarm.backgroundColor
        cell.alarmTimeLabel.text = alarm.alarmTimeLabel.text
        cell.alarmToggle.isOn = alarm.alarmToggle.isOn
        
        return cell
    }
}
