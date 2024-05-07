//
//  ShowProfilVcViewController.swift
//  VsAlumni
//
//  Created by admin on 26/02/24.
//

import UIKit

class ShowProfilVcViewController: UIViewController {

    @IBOutlet weak var ProfileImageView: UIImageView!
    var imageUrls : String!
    
   
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var     NameLabel  : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
//                profileImageView.addGestureRecognizer(tapGesture)
//                profileImageView.isUserInteractionEnabled = true
//        
//        
        nameLabel.text =  NameLabel
        
        ProfileImageView.sd_setImage(with: URL(string: imageUrls), placeholderImage: UIImage(named: "image 2"))
       
        let hideGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
               view.addGestureRecognizer(hideGesture)
        
    }
    
    @objc func dismissKeyboards() {
   //
//               roleChooseView.isHidden = true
        
        dismiss(animated: true)
               view.endEditing(true)
   
           }

}
