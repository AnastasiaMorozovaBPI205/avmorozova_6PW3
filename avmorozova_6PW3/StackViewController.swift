//
//  StackViewController.swift
//  avmorozova_6PW3
//
//  Created by Anastasia on 11.10.2021.
//

import UIKit

class StackViewController: UIViewController {
    
    private var stack: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }

    
    private func setupStackView() {
        let stack = UIStackView(frame: .zero)
        view.addSubview(stack)
        
        stack.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        stack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        stack.pin(to: view, .left, .right)
        
        stack.backgroundColor = .white
        
        self.stack = stack
    }

}
