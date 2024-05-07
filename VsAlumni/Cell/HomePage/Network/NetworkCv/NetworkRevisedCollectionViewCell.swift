//
//  NetworkRevisedCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 12/03/24.
//

import UIKit

class NetworkRevisedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var instituteNameLbl: UILabel!
    
    @IBOutlet weak var ntworkFullView: UIView!
    
    

    @IBOutlet weak var designationLbl: UILabel!
    
    @IBOutlet weak var batchLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.contentMode = .scaleAspectFill
        profileImg.clipsToBounds = true
        // Initialization code
    }

}
