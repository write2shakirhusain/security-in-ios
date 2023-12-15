//
//  DataFileViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 15/12/23.
//

import UIKit

class DataFileViewController: UIViewController {

  
    let dataFileName = "MyTextFile"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiConfigure()
    }
    
    func uiConfigure() {
        title = "Protect Data File On disk"
    }

    @IBAction func clickedOnDataFile(_ sender: Any) {
        protectDataFile()
    }
    
    func protectDataFile() {
        
        //Create and save file
        let someText = "Hello Guys!"
        let someData = someText.data(using: .utf8)
        
        let urlDocumentDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let urlMyFile = urlDocumentDir.appendingPathComponent(dataFileName)
        
        do {
            
            try someData?.write(to: urlMyFile, options: .completeFileProtection)
            
//            NSData.WritingOptions.completeFileProtection
//            NSData.WritingOptions.completeFileProtectionUnlessOpen
//            NSData.WritingOptions.completeFileProtectionWhenUserInactive
//            NSData.WritingOptions.completeFileProtectionUntilFirstUserAuthentication


            print("File data saved with protection successfully!")

        }
        catch let error as NSError{
            print("*** error : \(error)***")
        }
        
    }

}
