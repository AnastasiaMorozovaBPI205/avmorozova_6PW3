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
