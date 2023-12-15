//
//  HomeViewController.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 04/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var securityItems:[SDMSecurityItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureApp()
    }

    func configureApp()  {
        
        configureData()
        configureUI()
    }
    
    func configureData() {
        
        let item1 = SDMSecurityItem(name: "Secure Password In Text Field", type: .PasswordInTextField)
        securityItems.append(item1)
       
        let item2 = SDMSecurityItem(name: "Secure Password In Alert", type: .PasswordInAlert)
        securityItems.append(item2)

        let item3 = SDMSecurityItem(name: "Secure App Using Touch ID", type: .TouchId)
        securityItems.append(item3)
       
        let item4 = SDMSecurityItem(name: "Secure App Using Face ID", type: .FaceId)
        securityItems.append(item4)

        let item5 = SDMSecurityItem(name: "Secure Text File", type: .TextFile)
        securityItems.append(item5)
        
        let item6 = SDMSecurityItem(name: "Secure Data File", type: .DataFile)
        securityItems.append(item6)

        let item7 = SDMSecurityItem(name: "Secure Data In Keychain", type: .KeyChain)
        securityItems.append(item7)


        
    }
    
    func configureUI()  {
        tblView.delegate = self
        tblView.dataSource = self
            title = "Home Screen"
    }
    

}



extension HomeViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return securityItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tblView.dequeueReusableCell(withIdentifier: "HomeTblCell") as? HomeTblCell else {
            
            return UITableViewCell()
        }
        
        let item = securityItems[indexPath.row]
        cell.lblName.text = item.name
        
        return cell
    }
}

extension HomeViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = securityItems[indexPath.row]
       
        
        switch selectedItem.type {
        
            
            case .PasswordInTextField:
            let nextViewCon = Storyboards.getLoginScreen() 
                gotoSelectedScreen(selectedScreen: nextViewCon)

        case .PasswordInAlert:
            let nextViewCon = Storyboards.getLoginByAlertScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

            case .TouchId:
                let nextViewCon = Storyboards.getTouchIDScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

            case .FaceId:
            let nextViewCon = Storyboards.getFaceIDScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

            case .TextFile:
                let nextViewCon = Storyboards.getTextFileScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

            case .DataFile:
                let nextViewCon = Storyboards.getDataFileScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

            case .KeyChain:
                let nextViewCon = Storyboards.getKeychainScreen()
                gotoSelectedScreen(selectedScreen: nextViewCon)

        }
        

    }
    
    func gotoSelectedScreen(selectedScreen:UIViewController) {
        navigationController?.pushViewController(selectedScreen, animated: true)

    }
}

//DATA Model

struct SDMSecurityItem {
    
    var name:String
    var type:SecurityType
    
}

enum SecurityType {

    
    case PasswordInTextField
    case PasswordInAlert
    case TouchId
    case FaceId
    case TextFile
    case DataFile
    case KeyChain
}

