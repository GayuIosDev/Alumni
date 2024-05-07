//
//  ChangeDetailViewController.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import UIKit
import ObjectMapper


class ChangeDetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var latnameHeight: NSLayoutConstraint!
    @IBOutlet weak var firstNameTexxtField: UITextField!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var changeView: UIView!
    
    @IBOutlet weak var lastNameView: UIView!
    
    var firstName : String!
    var lastName : String!
    var email : String!
    var memberType : Int!
    
    var changeFirstName : String!
    var changeLastName : String!
    var changeEmailName : String!
    var changeType : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        overrideUserInterfaceStyle = .light


        lastNameTextField.delegate = self
        
        firstNameTexxtField.delegate = self
        emailTextField.delegate = self
        
        
        let defaults =  UserDefaults.standard
        firstName = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        lastName = defaults.string(forKey: Constant.DefaultsKeys.lastName)
        email = defaults.string(forKey: Constant.DefaultsKeys.email)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        changeType = defaults.integer(forKey: Constant.DefaultsKeys.changeType)
        let changeDetGesture = UITapGestureRecognizer(target: self, action: #selector(changeDetailVc))
        changeView.addGestureRecognizer(changeDetGesture)
        print("changeType",changeType)
//        if changeType == 1 {
//            firstNameTexxtField.text = changeFirstName
//            lastNameTextField.text = changeLastName
//            emailTextField.text = changeEmailName
//        }else{
            
            firstNameTexxtField.text = firstName
            lastNameTextField.text = lastName
            emailTextField.text = email
            
//        }
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        
        if memberType == 1 || memberType == 2 {
     //
            lastNameTextField.isHidden = true
            latnameHeight.constant = 0
            lastNameView.isHidden = true
        }else{
            lastNameTextField.isHidden = false
            lastNameView.isHidden = false
            latnameHeight.constant = 50

             }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func changeDetailVc() {
       
        if memberType == 1 || memberType == 2 {
            
            let defaults = UserDefaults.standard
            var token = defaults.string(forKey: Constant.DefaultsKeys.token)
            
            
            
            let chngDetailModal = ChangeDetailModal()
            chngDetailModal.firstName = firstNameTexxtField.text
            chngDetailModal.lastName = ""
            chngDetailModal.emailId = emailTextField.text
            //                schoolModal.designation = dobTextField.text
            
            
            var  chngDetailModalStr = chngDetailModal.toJSONString()
            print("chngDetailModalStr",chngDetailModal.toJSON())
            ChangeDetailRequest.call_request(param: chngDetailModalStr!, token: token!) {
                
                [self] (res) in
                
                let changeDetRes : ChangeDetailResponse = Mapper<ChangeDetailResponse>().map(JSONString: res)!
                
                
                if changeDetRes.status == true {
                    
                    //                            changeType = 1
                    
                    
                    for i in changeDetRes.data {
                        
                        
                        let defaults = UserDefaults.standard
                        defaults.removeObject(forKey: Constant.DefaultsKeys.firstName)
//                        defaults.removeObject(forKey: Constant.DefaultsKeys.lastName)
                        defaults.removeObject(forKey: Constant.DefaultsKeys.email)
                        
                        
                        print("i.name",i.name)
                        print("i.email",i.email_id)
                        
                        defaults.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                        //                                defaults.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                        defaults.set(i.email_id, forKey: Constant.DefaultsKeys.email)
                    }
                    
                    
                    
                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                    viewController.alertShowType = 1
                    viewController.gifImage = "success"
                    viewController.messageResponse = changeDetRes.message
                   
                    viewController.EventRedirect = "CHANGE DETAILS"
//                            KRProgressHUD.dismiss()
                    self.present(viewController, animated: true)
                    
                    
//                    dismiss(animated: true)
                    
                  
                }else{
                    let alert = UIAlertController(title: "Alert", message: changeDetRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
        }else{
            
            let defaults = UserDefaults.standard
            var token = defaults.string(forKey: Constant.DefaultsKeys.token)
            
            
            
            let chngDetailModal = ChangeDetailModal()
            chngDetailModal.firstName = firstNameTexxtField.text
            chngDetailModal.lastName = lastNameTextField.text
            chngDetailModal.emailId = emailTextField.text
            //                schoolModal.designation = dobTextField.text
            
            
            var  chngDetailModalStr = chngDetailModal.toJSONString()
            print("chngDetailModalStr",chngDetailModal.toJSON())
            ChangeDetailRequest.call_request(param: chngDetailModalStr!, token: token!) {
                
                [self] (res) in
                
                let changeDetRes : ChangeDetailResponse = Mapper<ChangeDetailResponse>().map(JSONString: res)!
                
                
                if changeDetRes.status == true {
                    
                    //                            changeType = 1
                    
                    
                    for i in changeDetRes.alumnidata {
                        
                        
                        let defaults = UserDefaults.standard
                        defaults.removeObject(forKey: Constant.DefaultsKeys.firstName)
                        defaults.removeObject(forKey: Constant.DefaultsKeys.lastName)
                        defaults.removeObject(forKey: Constant.DefaultsKeys.email)
                        
                        
                        print("i.name",i.name)
                        print("i.email",i.email_id)
                        
                        defaults.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                        defaults.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                        defaults.set(i.email_id, forKey: Constant.DefaultsKeys.email)
                    }
                    
                    dismiss(animated: true)
                    
                    //                            let storyboard = UIStoryboard(name: "ProfilePageStoryboard", bundle: nil)
                    //                            let viewController = storyboard.instantiateInitialViewController() as! ProfilePageViewController
                    //                            self.present(viewController, animated: true)
                    //
                    //                            defaults.set(1, forKey: Constant.DefaultsKeys.changeType)
                    //                            defaults.set(contactNumberTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
                    //                            defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                    //
                    //                            let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
                    //                            let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
                    //                            viewController.type = "institute"
                    //                            viewController.token = schoolRegRes.token
                    //                            self.present(viewController, animated: true)
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: changeDetRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
            
        }
    }

}
