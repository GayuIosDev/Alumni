//
//  CreatBulletPointTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 16/02/24.
//

import UIKit

class CreatBulletPointTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btns: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
