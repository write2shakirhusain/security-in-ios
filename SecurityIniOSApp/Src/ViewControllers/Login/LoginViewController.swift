//
//  LoginViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 04/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldUserId: UITextField!
    
    var loginAlertViewCon:UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiConfigure()
    }
    
    func uiConfigure() {
        
        txtFieldUserId.placeholder = "Enter User Id"
        txtFieldUserId.isSecureTextEntry = false
        
        txtFieldPassword.placeholder = "Enter Password"
        txtFieldPassword.isSecureTextEntry = true

    }

    @IBAction func clickedOnLogin(_ sender: Any) {
        validateAndLogin(userId: txtFieldUserId.text, password: txtFieldPassword.text)
    }
    
    func validateAndLogin(userId:String?,password:String?)  {
        
        guard let theUserId = userId, let thePassword = password,theUserId.isEmpty == false && thePassword.isEmpty == false else {
            
            print("Please enter correct Id and password")
          
            return
        }
        
        print("user Id : \(theUserId) \n")
        print("password : \(thePassword)")
        
        cleartText()
        
    }
    
    func cleartText()  {
        txtFieldUserId.text = ""
        txtFieldPassword.text = ""
    }
    
}
