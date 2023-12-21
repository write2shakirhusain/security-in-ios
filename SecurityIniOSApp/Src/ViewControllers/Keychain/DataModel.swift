//
//  DataModel.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 17/12/23.
//

import Foundation

//Data Model
struct SDMUserCredential {
    var userId:String
    var password:String
}

//Enum for expected errors
enum KeychainError :Error {
    
    case noPassword
    case unexpectedPasswordData
    case unhabledError
}
//Enum for Operation of Keychain
enum CrudOperation {
    
    case Add
    case Retrieve
    case Update
    case Delete
}
