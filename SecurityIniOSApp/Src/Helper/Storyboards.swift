//
//  Storyboards.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 04/12/23.
//

import UIKit
import Foundation

class Storyboards{
    
    static let mainStoryboardName = "Main"
    
    class func getMainStoryboards()-> UIStoryboard {
        
        return UIStoryboard(name: mainStoryboardName, bundle: nil )
    }
    
    class func getLoginScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }
    class func getLoginByAlertScreen()->LoginByAlertViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginByAlertViewController") as! LoginByAlertViewController

    }
    class func getFaceIDScreen()->FaceIdViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "FaceIdViewController") as! FaceIdViewController

    }
    class func getTouchIDScreen()->TouchIdViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "TouchIdViewController") as! TouchIdViewController

    }
    class func getTextFileScreen()->TextFileViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "TextFileViewController") as! TextFileViewController

    }

    class func getDataFileScreen()->DataFileViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "DataFileViewController") as! DataFileViewController

    }
    
    class func getKeychainScreen()->KeychainViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "KeychainViewController") as! KeychainViewController
    }
}


