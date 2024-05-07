//
//  NetworkListTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit

class NetworkListTableViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var batchLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var designationLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        profileImg.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
