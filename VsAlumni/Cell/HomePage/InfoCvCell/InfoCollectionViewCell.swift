//
//  InfoCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 18/04/24.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var imageViews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageViews.contentMode = .scaleAspectFill
        // Initialization code
    }

}
