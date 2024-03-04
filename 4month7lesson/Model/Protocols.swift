//
//  Protocols.swift
//  4month7lesson
//
//  Created by Apple on 1.3.2024.
//

import UIKit

protocol TranferValidation {
    func isValidTranfer(cardNumber: String, amount: Int, tranferBtn: UIButton, textField: UITextField) -> Bool
    func showFiledTransfer(vc: UIViewController)

}
extension TranferValidation {
    
    
    func isValidTranfer(cardNumber: String, amount: Int, tranferBtn: UIButton, textField: UITextField) -> Bool {
        if let text = textField.text {
            let cleanText = text.replacingOccurrences(of: " ", with: "")
            var formattedText = ""
            for (index, character) in cleanText.enumerated() {
                if index > 0 && index % 4 == 0 {
                    formattedText += " "
                }
                formattedText.append(character)
            }
            textField.text = formattedText
        }
        
        let isValidAmount = amount >= 20
        let cardNumberRegex = #"^\d{4}\s\d{4}\s\d{4}\s\d{4}$"#
        let cardNumberPredicate = NSPredicate(format: "SELF MATCHES %@", cardNumberRegex)
        let isCardNumberValid = cardNumberPredicate.evaluate(with: cardNumber)

        if isValidAmount && isCardNumberValid {
            tranferBtn.isEnabled = true
            tranferBtn.backgroundColor = UIColor(hex: "#186049")
        } else {
            tranferBtn.isEnabled = false
            tranferBtn.backgroundColor = UIColor(hex: "#333333")
        }
        
        return isValidAmount && isCardNumberValid
    }

    
    func showFiledTransfer(vc: UIViewController) {
        let alert = UIAlertController(title: "Ошибка", message: "Перевод не удался", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}

