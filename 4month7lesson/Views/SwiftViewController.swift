//
//  SwiftViewController.swift
//  4month7lesson
//
//  Created by Apple on 2.3.2024.
//

import UIKit

class SwiftViewController: UIViewController, TranferValidation {

    
    private let usereNameLbl: UILabel = {
        let lb = UILabel()
        lb.text = "Тима"
        lb.textColor = UIColor(hex: "#F3F4F6")
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let cardNumberUseraLbl: UILabel = {
        let lb = UILabel()
        lb.text = "4245 1243 6581 5632"
        lb.textColor = UIColor(hex: "#F3F4F6")
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let numberCardLbl: UILabel = {
        let lb = UILabel()
        lb.text = "Номер Карты"
        lb.textColor = UIColor(hex: "#F3F4F6")
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let cashLbl: UILabel = {
        let lb = UILabel()
        lb.text = "99999$"
        lb.textColor = UIColor(hex: "#F3F4F6")
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    private let cardNumberTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите номер карты"
        tf.backgroundColor = UIColor(hex: "#F3F4F6")
        tf.textColor = .black
        tf.font = UIFont.boldSystemFont(ofSize: 16)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(hex: "#0A7273").cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.keyboardType = .numberPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        return tf
    }()
    
    
    
    private let amountTranferTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите сумма"
        tf.backgroundColor = UIColor(hex: "#F3F4F6")
        tf.textColor = .black
        tf.font = UIFont.boldSystemFont(ofSize: 16)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(hex: "#0A7273").cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.keyboardType = .numberPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        return tf
    }()
    
    private let tranferBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Перевести", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor(hex: "#E9E3D5"), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(tranferBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(hex: "#333333")
        return btn
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor =  UIColor(hex: "033043")
        setupUI()
    }
    private func setupUI(){
        
        view.addSubview(usereNameLbl)
        view.addSubview(numberCardLbl)
        view.addSubview(cardNumberUseraLbl)
        view.addSubview(cashLbl)
        view.addSubview(cardNumberTf)
        view.addSubview(amountTranferTf)
        view.addSubview(tranferBtn)
        NSLayoutConstraint.activate([
            
            usereNameLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            usereNameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            numberCardLbl.topAnchor.constraint(equalTo: usereNameLbl.bottomAnchor, constant: 10),
            numberCardLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            cardNumberUseraLbl.topAnchor.constraint(equalTo: numberCardLbl.bottomAnchor, constant: 5),
            cardNumberUseraLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            cashLbl.topAnchor.constraint(equalTo: cardNumberUseraLbl.bottomAnchor, constant: 5),
            cashLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            cardNumberTf.topAnchor.constraint(equalTo: cashLbl.bottomAnchor, constant: 25),
            cardNumberTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardNumberTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardNumberTf.heightAnchor.constraint(equalToConstant: 50),
            
            amountTranferTf.topAnchor.constraint(equalTo: cardNumberTf.bottomAnchor, constant: 40),
            amountTranferTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountTranferTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            amountTranferTf.heightAnchor.constraint(equalToConstant: 50),
            
            
            tranferBtn.topAnchor.constraint(equalTo: amountTranferTf.bottomAnchor, constant: 60),
            tranferBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tranferBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tranferBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func validateTF(_ sender: UITextField){
        
        guard let cardNumberText = cardNumberTf.text else {
            return
        }
        
        guard let amountText = amountTranferTf.text, let amout = Int(amountText) else {
            return
        }
        isValidTranfer(cardNumber: cardNumberText, amount: amout, tranferBtn: tranferBtn, textField: cardNumberTf)
    }
    
    @objc private func tranferBtnTapped(_ sender: UIButton) {
        
        let vc = SuccsesViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
