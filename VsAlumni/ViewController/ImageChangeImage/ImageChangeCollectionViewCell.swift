//
//  ImageChangeCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 10/04/24.
//

import UIKit

class ImageChangeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 10
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        // Initialization code
    }

}
