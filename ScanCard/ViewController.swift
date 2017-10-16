//
//  ViewController.swift
//  ScanCard
//
//  Created by Mateusz Kopacz on 15.10.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {
    
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    @IBOutlet weak var cardDateNumber: UILabel!
    
    @IBOutlet weak var CardCCVLabel: UILabel!
    
    
    @IBAction func scanButton(_ sender: UIButton) {
        
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.modalPresentationStyle = .formSheet
        present(cardIOVC!, animated: true, completion: nil)
        
        
    }
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        
        print("User Canceled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        
        if let info = cardInfo {
            
            let cardNumber = info.cardNumber
            let cardDate = "\(info.expiryMonth)/\(info.expiryYear)"
            let cardCVV = info.cvv
            
            paymentViewController.dismiss(animated: true, completion: nil)
            
            cardNumberLabel.text = "Card Number: \(cardNumber!)"
            cardDateNumber.text = "Exp Date: \(cardDate)"
            CardCCVLabel.text = "CCV: \(cardCVV!) "
            
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        CardIOUtilities.preload()
    }


}

