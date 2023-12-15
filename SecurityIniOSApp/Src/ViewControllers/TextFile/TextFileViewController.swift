//
//  TextFileViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 15/12/23.
//

import UIKit

class TextFileViewController: UIViewController {

    let textFileName = "MyTextFile"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiConfigure()
    }
    
    func uiConfigure() {
        title = "Protect Text File On disk"
    }

    @IBAction func clickedOnTextFile(_ sender: Any) {
        protectTextFile()
    }
    
    func protectTextFile() {
        //Create and save file
        let someText = "Hello Guys!"
        let urlDocumentDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let urlMyFile = urlDocumentDir.appending(component: textFileName).appendingPathExtension("txt")
        
        do {
            try someText.write(to: urlMyFile, atomically: true, encoding: .utf8)
            //Adjust file attributes to add protection
            var fileAttributes:[FileAttributeKey:Any] = [:]
            fileAttributes[FileAttributeKey.protectionKey] = FileProtectionType.complete
            
//            FileProtectionType.complete
//            FileProtectionType.completeUnlessOpen
//            FileProtectionType.completeWhenUserInactive
//            FileProtectionType.completeUntilFirstUserAuthentication

            try FileManager.default.setAttributes(fileAttributes, ofItemAtPath: urlMyFile.absoluteString)
            print("File saved with protection successfully!")

        }
        catch let error as NSError{
            print("*** error : \(error)***")
        }
        
    }

}
