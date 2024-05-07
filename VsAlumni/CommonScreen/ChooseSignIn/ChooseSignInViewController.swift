//
//  ChooseSignInViewController.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import UIKit

class ChooseSignInViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func instituteAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "SchoolSideSchoolDetailStoryboard", bundle: nil)
                        let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolDetailViewController
                        self.present(viewController, animated: true)
             
        
    }
    
    
    
    @IBAction func alumniAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "RegistrationStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! RegistrationViewController
        self.present(viewController, animated: true)
    }
    
    
}
