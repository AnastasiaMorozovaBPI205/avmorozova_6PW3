//
//  TableViewController.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//
import UIKit

class TableViewController: UIViewController {

    private var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        table?.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 300 }

    func numberOfSections(in tableView: UITableView) -> Int { 1 }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell

        cell?.setupEye()
        return cell ?? UITableViewCell()
    }
}
