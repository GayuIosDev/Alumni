//
//  BirthdayWishesTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 19/01/24.
//

import UIKit

class BirthdayWishesTableViewCell: UITableViewCell {
//    
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var wishesLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 30
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
