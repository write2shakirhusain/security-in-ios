//
//  FaceIdViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 15/12/23.
//

import UIKit
import LocalAuthentication

class FaceIdViewController: UIViewController {

    var context  = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    func configureUI() {
        title = "Face Id Screen"
    }
    
    @IBAction func clickedOnFaceId(_ sender: Any) {
        authenticateTFaceId()
    }
    
    func checkFaceIdAvailibility()->Bool  {
        var toReturn = false
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) && context.biometryType == .faceID{
            toReturn = true
        }
        return toReturn
    }
    
    func authenticateTFaceId() {
        
        if checkFaceIdAvailibility() {
            let reason = "Please authenticate your Face Id"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){(success,error) in
                if success == true {
                    print("Success")
                }else{
                    print("*** error : \(String(describing: error)) ***")
                }
                
            }
            
        }else{
            print("*** Face Id not found in this device! ***")
        }
    }
}
