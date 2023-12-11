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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cardView.layer.cornerRadius = 5.0
        cardView.backgroundColor = .lightGray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
