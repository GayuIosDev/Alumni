//
//  EventListShowingTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 27/01/24.
//

import UIKit
import WebKit
import SDWebImage


class EventListShowingTableViewCell: UITableViewCell,WKNavigationDelegate {

  
    @IBOutlet weak var imgViewTap: UIView!
    @IBOutlet weak var webKitt: WKWebView!
    @IBOutlet weak var imgList: UIImageView!
    
    var profileType : String = "Others_BDay"
    var profileImg : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgList.contentMode = .scaleAspectFill
        imgList.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("EventListShowingTableViewCellprofileType",profileType)
        print("EventListShowingTableViewCellprofileImg",profileImg)

//        if profileType == "Others_BDay" {
//            imgList.sd_setImage(with: URL(string:  profileImg), placeholderImage: UIImage(named: "sample_black_screen"))
//        }

//        imgList.image = UIImage(named: "sample_black_screen")
        webKitt.isHidden = true
        imgList.layer.cornerRadius = 20
       

    }
    
}
