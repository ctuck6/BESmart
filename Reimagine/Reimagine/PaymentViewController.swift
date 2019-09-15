//
//  paymentViewController.swift
//  Reimagine
//
//  Created by Jeremy Kearse on 9/15/19.
//  Copyright © 2019 Cameron Tucker. All rights reserved.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController ,UITextFieldDelegate
{
    var price : [Double] = []
    @IBOutlet weak var price_tag: UILabel!
    
    @IBOutlet weak var CardNumerEntry: UITextField!
    @IBOutlet weak var roundedButton: UIButton!
    @IBOutlet weak var PaymentButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let the_label = "$" + String(price[0])
        price_tag?.text = the_label
        customizeButton01(buttonName: PaymentButton)
    }
    
    func customizeButton01(buttonName:UIButton)
    {
        let c1GreenColor = (UIColor(red: 23, green: 45, blue: 15, alpha: 1.0))
        let c2GreenColor = (UIColor(red: -23, green: -48, blue: -12, alpha: 1.0))
        buttonName.backgroundColor = UIColor.yellow
        buttonName.layer.cornerRadius = 7
        buttonName.layer.borderWidth = 0.8
        buttonName.layer.borderColor = c1GreenColor.cgColor
        
        buttonName.layer.shadowColor = c2GreenColor.cgColor
        buttonName.layer.shadowOpacity = 0.8
        buttonName.layer.shadowRadius = 12
        buttonName.layer.shadowOffset = CGSize(width: 1, height: 1)
        
    }
    @IBAction func confirmPay(_ sender: Any) {
        let alertController = UIAlertController(title: "Payment Confirmed", message: "", preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
}
