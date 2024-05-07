//
//  EventInsideImageCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 20/02/24.
//

import UIKit
import WebKit


class EventInsideImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgTapVew: UIView!
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var webKitView: WKWebView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 20

        // Initialization code
    }

}
