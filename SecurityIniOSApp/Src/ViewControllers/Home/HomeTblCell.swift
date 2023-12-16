//
//  HomeTblCell.swift
//  SecurityIniOSApp
//
//  Created by Shakir Husain on 04/12/23.
//

import UIKit

class HomeTblCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var lblName: UILabel!
    var defaultColor:UIColor?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cardView.layer.cornerRadius = 5.0
        defaultColor = cardView.backgroundColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(item:SDMSecurityItem)  {
        
        lblName.text = item.name
        switch item.type {
        
        
        case .PasswordInTextField:
            cardView.backgroundColor = defaultColor
           
        case .PasswordInAlert:
            cardView.backgroundColor = defaultColor

        case .TouchId:
            cardView.backgroundColor = defaultColor

        case .FaceId:
            cardView.backgroundColor = defaultColor

        case .TextFile:
            cardView.backgroundColor = defaultColor

        case .DataFile:
            cardView.backgroundColor = defaultColor

        case .KeyChainAdd:
            cardView.backgroundColor = defaultColor

        case .KeyChainRetrieve:
            cardView.backgroundColor = defaultColor

        case .KeyChainUpdate:
            cardView.backgroundColor = defaultColor

        case .KeyChainDelete:
            cardView.backgroundColor = defaultColor

        }
    }
    
}
