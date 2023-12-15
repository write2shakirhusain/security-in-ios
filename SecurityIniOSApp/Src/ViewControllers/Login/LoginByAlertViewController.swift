//
//  LoginByAlertViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 14/12/23.
//

import UIKit

class LoginByAlertViewController: UIViewController {
    
    var loginAlertViewCon:UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiConfigure()
    }
    
    func uiConfigure() {
        title = "Login using by Alert"
        setupLoginAlert()
    }
   
    @IBAction func clickedOnLoginAlert(_ sender: Any) {
        showLoginAlert()
    }
        
    func setupLoginAlert() {
        
        loginAlertViewCon = UIAlertController(title: "Login", message: "Please enter login details", preferredStyle: .alert)
        
        loginAlertViewCon?.addTextField{(textFieldUserId) in
            textFieldUserId.placeholder = "Enter User Id"

        }
        
        loginAlertViewCon?.addTextField{(textFieldPassword) in
            textFieldPassword.isSecureTextEntry = true
            textFieldPassword.placeholder = "Enter Password"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {[weak self] cancelAction in
            self?.cleartText()
        }
        
        let login = UIAlertAction(title: "Login", style: .default) {[weak self]  loginAction in
            
            guard let alertVC = self?.loginAlertViewCon else {
                return
            }
            
            let textFieldUserId = alertVC.textFields?[0]
            let textFieldPassword = alertVC.textFields?[1]
            
            self?.validateAndLogin(userId: textFieldUserId?.text, password: textFieldPassword?.text)
            
        }
        
        loginAlertViewCon?.addAction(cancel)
        loginAlertViewCon?.addAction(login)
        
    }
    
    func showLoginAlert() {
        
        guard let alertVCon = loginAlertViewCon else {
            print("*** Alert not created yet ***")
            return
        }
        present(alertVCon, animated: true)
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
       
        guard let alertVC = self.loginAlertViewCon else {
            return
        }

        guard let txtf1 = alertVC.textFields?[0], let txtf2 = alertVC.textFields?[1]  else {
            return
        }
        txtf1.text = ""
        txtf2.text = ""
    }

}
