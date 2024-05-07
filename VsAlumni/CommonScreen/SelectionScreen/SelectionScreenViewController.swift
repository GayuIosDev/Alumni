//
//  SelectionScreenViewController.swift
//  VsAlumni
//
//  Created by admin on 26/12/23.
//

import UIKit

class SelectionScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ClickAlumni(_ sender: UIButton) {
        let is_user_logged = PreferencesUtil.checkPrefs(key: Constant.LoginResponse) 
        let personalUser = PreferencesUtil.checkPrefs(key: Constant.PersonalDetailResponse)
        if is_user_logged{
            
//            print("is_user_logged",is_user_logged)
//            let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//            let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//            self.present(viewController, animated: true)
//        }
//        else if personalUser{
//           
            let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
            self.present(viewController, animated: true)
            
        
        }
        
        
        else{
            
            
            
            let storyboard = UIStoryboard(name: "RegistrationStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! RegistrationViewController
            self.present(viewController, animated: true)
            
        }
    }
    
    @IBAction func clickInstitute(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "SchoolSideSchoolDetailStoryboard", bundle: nil)
                   let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolDetailViewController
                   self.present(viewController, animated: true)
        
        
        
    }
}
