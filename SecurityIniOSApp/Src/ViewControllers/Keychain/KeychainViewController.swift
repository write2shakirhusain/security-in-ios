//
//  KeychainViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 15/12/23.
//

import UIKit

class KeychainViewController: UIViewController {

    let server = "www.demo.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiConfigure()
    }
    
    func uiConfigure() {
        title = "Keychain Store Screen"
    }

    @IBAction func clickedOnSaveData(_ sender: Any) {
        
        let credential  = UserCredential(userId: "Shakir", password: "Abcd@123")
        
        do{
            try saveCredentialInKeychain(credential: credential)
        }
        catch let error as NSError{
            print("*** Error : \(error) ***")
        }
    }
   
    func saveCredentialInKeychain(credential:UserCredential) throws {
        
        let  account = credential.userId
        let passwordData = credential.password.data(using: .utf8)
        
        //create query Dictionary
        var addQuery:[String:Any] = [:]
       
        addQuery[kSecClass as String] = kSecClassInternetPassword
        addQuery[kSecAttrAccount as String] = account
        addQuery[kSecAttrServer as String] = server
        addQuery[kSecValueData as String] = passwordData
        
        let status = SecItemAdd(addQuery as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("*** Status : \(status) ***")
            throw KeychainError.unhabledError
        }
        print("Credential has been saved successfully!")

    }
    
    @IBAction func clickedOnRetrieveData(_ sender: Any) {
        do{
            try retrieveCredentialFromKeychain(server: server)
        }
        catch let error as NSError{
            print("*** Error : \(error) ***")
        }
    }
    
    func retrieveCredentialFromKeychain(server:String) throws {
        //create search query Dictionary
        var searchQuery:[String:Any] = [:]
       
        searchQuery[kSecClass as String] = kSecClassInternetPassword
        searchQuery[kSecAttrServer as String] = server
        searchQuery[kSecMatchLimit as String] = kSecMatchLimitOne
        searchQuery[kSecReturnAttributes as String] = true
        searchQuery[kSecReturnData as String] = true
        
        //perform keychain search
        var item:CFTypeRef?
        let status = SecItemCopyMatching(searchQuery as CFDictionary, &item)
        
        //check to make sure search was successful
        guard status != errSecItemNotFound else {
            print("Status : \(status)");throw KeychainError.noPassword
        }
        guard status == errSecSuccess else {
            print("Status : \(status)");throw KeychainError.unhabledError
        }
        
        //access credential from item
        guard let foundItem = item as? [String:Any],
        let passwordData = foundItem[kSecValueData as String] as? Data,
        let passwordStr = String(data: passwordData, encoding: .utf8),
        let userId = foundItem[kSecAttrAccount as String] as? String
        else {
            throw KeychainError.unhabledError
        }
        print("userId  = \(userId)")
        print("password Str = \(passwordStr)")


    }

    @IBAction func clickedOnUpdateData(_ sender: Any) {
       
        let credential  = UserCredential(userId: "Shakir", password: "Xyz@1234")
        
        do{
            try updateCredentialInKeychain(credential: credential)
        }
        catch let error as NSError{
            print("*** Error : \(error) ***")
        }
    }
    
    func updateCredentialInKeychain(credential:UserCredential) throws{
        
        //create Search query Dictionanry
        var searchQuery:[String:Any] = [:]
        searchQuery[kSecClass as String] = kSecClassInternetPassword
        searchQuery[kSecAttrServer as String] = server
        
        //prepare new attributes and Data
        let newuserId = credential.userId
        let newpasswordData = credential.password.data(using: .utf8)
        
        //Create new details Attribute Dictionary
        var newDetailQuery:[String:Any] = [:]
        newDetailQuery[kSecAttrAccount as String] = newuserId
        newDetailQuery[kSecValueData as String] = newpasswordData
        let status = SecItemUpdate(searchQuery as CFDictionary, newDetailQuery as CFDictionary)
        
        guard status != errSecItemNotFound else {
            print("Status : \(status)");throw KeychainError.noPassword
        }
        
        guard status == errSecSuccess else {
            print("Status : \(status)");throw KeychainError.unhabledError
        }
        print("Credential has been updated successfully!")

    }

    @IBAction func clickedOnDeleteData(_ sender: Any) {
        
        
        do{
            try deleteCredentialFromKeychain(server: server)
        }
        catch let error as NSError{
            print("*** Error : \(error) ***")
        }
    }

    func deleteCredentialFromKeychain(server:String)throws {
       
        //create Search query Dictionanry
        var searchQuery:[String:Any] = [:]
        searchQuery[kSecClass as String] = kSecClassInternetPassword
        searchQuery[kSecAttrServer as String] = server
        
        //delete Item and check status
        let status = SecItemDelete( searchQuery as CFDictionary)
        guard status == errSecItemNotFound || status == errSecSuccess else {
            print("Status : \(status)");throw KeychainError.unhabledError
        }
        print("Credential has been deleted successfully!")

    }

}

//Data Model
struct UserCredential {
    var userId:String
    var password:String
}

//Enum for expected errors
enum KeychainError :Error {
    
    case noPassword
    case unexpectedPasswordData
    case unhabledError
}
