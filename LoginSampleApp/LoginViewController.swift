//
//  LoginViewController.swift
//  LoginSampleApp
//
//  Created by aCetylAcid on 2015/07/02.
//  Copyright (c) 2015年 zrn-ns.com. All rights reserved.
//

import UIKit
import KeychainAccess

class LoginViewController : UIViewController {
    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func tappedSave(sender: AnyObject) {
        let keychain = Keychain()
        
        keychain["user_id"]   = textFieldId.text
        keychain["user_pass"] = textFieldPassword.text
        
        let alertview = UIAlertView(title: "saved",
                                  message: "ID and Pass are saved.",
                                 delegate: nil,
                        cancelButtonTitle: "OK")
        alertview.show()
    }
    
    @IBAction func tappedClear(sender: AnyObject) {
        let keychain = Keychain()
        
        textFieldId.text       = nil
        textFieldPassword.text = nil
        keychain["user_id"]   = nil
        keychain["user_pass"] = nil
    }
    
    override func viewDidLoad() {
        let keychain = Keychain()
        
        textFieldId.text       = keychain["user_id"]
        textFieldPassword.text = keychain["user_pass"]
    }
}
