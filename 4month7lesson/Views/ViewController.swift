//
//  ViewController.swift
//  4month7lesson
//
//  Created by Apple on 1.3.2024.
//

import UIKit

class ViewController: UIViewController{

    private let tranferMoneyVisa: UIButton = {
        let btn = UIButton()
        btn.setTitle("Visa", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor(hex: "#E9E3D5"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(tranferMoneyVisaTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(hex: "033043")
        return btn
    }()
    
    private let tranferMoneyElcard: UIButton = {
        let btn = UIButton()
        btn.setTitle("Elcard", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor(hex: "#E9E3D5"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(tranferMoneyElCardTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(hex: "033043")
        return btn
    }()
    
    private let tranferMoneySwift: UIButton = {
        let btn = UIButton()
        btn.setTitle("Swift", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor(hex: "#E9E3D5"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(tranferMoneySwiftTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(hex: "033043")
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "0A7273")
        navBar()
        setupUI()
    }

    private func setupUI(){
        view.addSubview(tranferMoneyVisa)
        view.addSubview(tranferMoneyElcard)
        view.addSubview(tranferMoneySwift)
        NSLayoutConstraint.activate([
            tranferMoneyVisa.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            tranferMoneyVisa.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tranferMoneyVisa.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tranferMoneyVisa.heightAnchor.constraint(equalToConstant: 50),
            
            tranferMoneyElcard.topAnchor.constraint(equalTo: tranferMoneyVisa.bottomAnchor, constant: 40),
            tranferMoneyElcard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tranferMoneyElcard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tranferMoneyElcard.heightAnchor.constraint(equalToConstant: 50),
            
            tranferMoneySwift.topAnchor.constraint(equalTo: tranferMoneyElcard.bottomAnchor, constant: 40),
            tranferMoneySwift.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tranferMoneySwift.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tranferMoneySwift.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        
        }
    private func navBar() {
         
        let titleNavBar = self.navigationController?.navigationBar.topItem
        titleNavBar?.title = "My Bank"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#E9E3D5"),
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)     ]
        }
    
    @objc func tranferMoneyVisaTapped(){
        let vc = VisaViewController()
        navigationController?.pushViewController(vc, animated: true)    }
    
    @objc func tranferMoneyElCardTapped(){
        let vc = ElCardViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tranferMoneySwiftTapped(){
        
        let vc = SwiftViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


