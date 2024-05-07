//
//  AssistListTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 17/10/23.
//

import UIKit

class AssistListTableViewCell: UITableViewCell {
   
    @IBOutlet weak var deleteView: UIView!
    
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var EditDeleteView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
        
        @IBOutlet weak var titleLbl: UILabel!
        
        
        @IBOutlet weak var nameLbl: UILabel!
        
    @IBOutlet weak var validity_dateLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 25

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
