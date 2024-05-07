//
//  AlumniMembersListTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 17/10/23.
//

import UIKit

class AlumniMembersListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var memberImg: UIImageView!
    
    @IBOutlet weak var workLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
