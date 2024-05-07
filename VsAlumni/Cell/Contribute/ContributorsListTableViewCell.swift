//
//  ContributorsListTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 12/10/23.
//

import UIKit

class ContributorsListTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
