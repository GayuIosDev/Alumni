//
//  AssistNewCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 29/03/24.
//

import UIKit

class AssistNewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var EditDeleteView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var deleteView: UIView!
    
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 25
        // Initialization code
    }

}
