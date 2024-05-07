//
//  ProfessionalTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 02/01/24.
//

import UIKit

class ProfessionalTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var saveViews: UIViewX!
    @IBOutlet weak var RemoveView: UIViewX!
    @IBOutlet weak var companyName: UITextField!
    
    @IBOutlet weak var btns: UIButton!
    @IBOutlet weak var desingnationTextField: UITextField!
    @IBOutlet weak var noImg: UIImageView!
    
    @IBOutlet weak var yesImg: UIImageView!
    @IBOutlet weak var noView: UIView!
    @IBOutlet weak var yesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
    
}
