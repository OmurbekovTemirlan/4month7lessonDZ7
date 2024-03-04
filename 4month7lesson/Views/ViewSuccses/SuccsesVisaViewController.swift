//
//  SuccsesVisaViewController.swift
//  4month7lesson
//
//  Created by Apple on 4.3.2024.
//

import UIKit

class SuccsesViewController: UIViewController {

    private let SuccsesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Отлично"
        lb.textColor = UIColor(hex: "#F3F4F6")
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#628A5C")
        view.addSubview(SuccsesLabel)
        NSLayoutConstraint.activate([
            SuccsesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SuccsesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
