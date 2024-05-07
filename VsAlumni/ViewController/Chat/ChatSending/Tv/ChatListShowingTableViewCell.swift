//
//  ChatListShowingTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 19/02/24.
//

import UIKit

class ChatListShowingTableViewCell: UITableViewCell {

    @IBOutlet weak var senderImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var senderMessageHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var recieverAudioHeight: NSLayoutConstraint!
    
    @IBOutlet weak var recieverMessageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var recieverImgHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var senderAudioHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var recieverAudioDateLbl: UILabel!
    
    @IBOutlet weak var recieverSliderCount: UILabel!
    
    
    @IBOutlet weak var recieverSlider: UISlider!
    
    @IBOutlet weak var recieverAudioShowView: UIView!
    
    
    @IBOutlet weak var recieverAudioView: UIView!
    
    
    
    @IBOutlet weak var recieverMessgeTextView: UIViewX!
    
    @IBOutlet weak var recieverImgDateLbl: UILabel!
    
    @IBOutlet weak var recieverMessageLbl: UILabel!
    
    @IBOutlet weak var recieverDateLbl: UILabel!
    
    @IBOutlet weak var recieverImg: UIImageView!
    
    @IBOutlet weak var recieverImageView: UIView!
    
    
    @IBOutlet weak var senderMessageView: UIViewX!
    
    @IBOutlet weak var senderMessageDateLbl: UILabel!
    
    @IBOutlet weak var senderImgDateLbl: UILabel!
    
    @IBOutlet weak var senderMessageLbl: UILabel!
    
    @IBOutlet weak var senderOverAllAudioView: UIView!
    
    @IBOutlet weak var senderSlider: UISlider!
    @IBOutlet weak var senderImg: UIImageView!
    
    @IBOutlet weak var senderImageView: UIView!
    
    @IBOutlet weak var senderAudioView: UIView!
    
    @IBOutlet weak var senderSide: UIView!
    
    @IBOutlet weak var recieverSide: UIView!
    
    @IBOutlet weak var senderSliderCount: UILabel!
    
    @IBOutlet weak var senderAudioDateLbl: UILabel!
    
    
    @IBOutlet weak var recieverSideHight: NSLayoutConstraint!
    
    
    @IBOutlet weak var senderSideHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
