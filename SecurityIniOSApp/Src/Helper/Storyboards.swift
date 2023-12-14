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
    class func getFaceIDScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }
    class func getTouchIDScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }
    class func getTextFileScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }

    class func getDataFileScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }
    
    class func getKeychainScreen()->LoginViewController{
        
        return getMainStoryboards().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

    }
}


