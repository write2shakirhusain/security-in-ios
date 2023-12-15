//
//  TouchIdViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 15/12/23.
//

import UIKit
import LocalAuthentication

class TouchIdViewController: UIViewController {

    var context  = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func uiConfigure() {
        title = "Touch Id Screen"
    }
    
    @IBAction func clickedOnTochId(_ sender: Any) {
        authenticateTouchId()
    }
    
    func checkTouchIdAvailibility()->Bool  {
        var toReturn = false
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) && context.biometryType == .touchID{
            toReturn = true
        }
        return toReturn
    }
    
    func authenticateTouchId() {
        
        if checkTouchIdAvailibility() {
            let reason = "Please authenticate your Touch Id"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){(success,error) in
                if success == true {
                    print("Success")
                }else{
                    print("*** error : \(String(describing: error)) ***")
                }
                
            }
            
        }else{
            print("*** Touch Id not found in this device! ***")
        }
    }
}
