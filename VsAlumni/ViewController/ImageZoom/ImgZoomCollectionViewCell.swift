//
//  ImgZoomCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 03/02/24.
//

import UIKit

class ImgZoomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var zoomImgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        // Initialization code
    }

}
