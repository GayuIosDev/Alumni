//
//  LoginViewController.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import UIKit
import BCryptSwift
import ObjectMapper
import BCrypt
import Foundation
import SystemConfiguration



class LoginViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var instViewClick: UIViewX!
    
    
    @IBOutlet weak var alumniVioewClick: UIViewX!
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var passwordViewmain: UIView!
    
    @IBOutlet weak var hholeView: UIView!
    @IBOutlet weak var alumniBtn: UIButton!
    @IBOutlet weak var instBtn: UIButton!
    
    @IBOutlet weak var mobileLoginImg: UIImageView!
    @IBOutlet weak var passwordView: UIViewX!
    
    @IBOutlet weak var passwordEyeImg: UIImageView!
    @IBOutlet weak var roleChooseView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    var getIpAddress : String! = ""
    var show_password = true

    @IBOutlet weak var forgotPwdBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .init(uptimeNanoseconds: UInt64(0.0))) { [self] in
            let gifURL = UIImage.gif(name: "Add friends")
            // Use SDWebImage to load and display the GIF image
            mobileLoginImg.image = gifURL
        }
       
        
        overrideUserInterfaceStyle = .light

        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
        
        
        addDoneButtonOnKeyboard()

//        forgotPwdBtn.isHidden = true
        roleChooseView.isHidden = true
        
        
        alumniBtn.layer.borderColor = UIColor.black.cgColor

        instBtn.layer.borderColor = UIColor.black.cgColor

        
//        passwordTextfield.delegate = self
        userNameTextfield.delegate = self
        
//        passwordView.isHidden = true
        
        signUpBtn.layer.borderColor = UIColor.lightGray.cgColor
        signUpBtn.layer.borderWidth = 0.1
        
        let loginGesture = UITapGestureRecognizer(target: self, action: #selector(loginVc))
        loginView.addGestureRecognizer(loginGesture)
        
//        let password = passwordTextfield.text
//        do {
//            let salt = try BCryptSwift.Salt()
//            let hashed = try BCrypt.Hash(password, salt: salt)
//            print("Hashed result is: \(hashed)")
//        }
//        catch {
//            print("An error occured: \(error)")
//        }
        // Do any additional setup after loading the view.
        
//        let confirmPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(confirm_toggle_password))
//        passwordView.addGestureRecognizer(confirmPasswordEyeGesture)
        
        
        let hideGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
               view.addGestureRecognizer(hideGesture)
        
        
        let aumnGesture = UITapGestureRecognizer(target: self, action: #selector(AlumniVc))
               alumniVioewClick.addGestureRecognizer(aumnGesture)
        
        let instituteGesture = UITapGestureRecognizer(target: self, action: #selector(instVc))
               instViewClick.addGestureRecognizer(instituteGesture)
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        addGifShow()
       
       
    }
    
    
   
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-61
                print("keyboardSize.height",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @objc func dismissKeyboards() {
   //
               roleChooseView.isHidden = true
               view.endEditing(true)
   
           }
    
    @IBAction func AlumniVc() {
        roleChooseView.isHidden = true
        let storyboard = UIStoryboard(name: "SignUpMobileNumberStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignUpMobileNumberViewController
        viewController.instituteAlumni = 1
        self.present(viewController, animated: true)
    }
    
    @IBAction func instVc() {
        roleChooseView.isHidden = true
        let storyboard = UIStoryboard(name: "SignUpMobileNumberStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignUpMobileNumberViewController
        viewController.instituteAlumni = 2
        self.present(viewController, animated: true)
    }
    
//    @objc func confirm_toggle_password(){
//        print("toggle works")
//        show_password = !show_password
//        passwordTextfield.isSecureTextEntry = show_password
//        passwordEyeImg.image = UIImage(named: show_password ? "eye": "eyeColor")
//        
//        
//        
//    }
    
    
   
        

    
    
    @IBAction func loginVc() {
        
        if userNameTextfield.text != "" {
            
        
           
            
            let loginModal = VerifyMobileNumberModal()
         
            loginModal.mobile_number = userNameTextfield.text
            loginModal.log_in = 1
//            loginModal.user_agent = "Iphone"
//            loginModal.ip_address = getIpAddress
          
            var  loginModalStr = loginModal.toJSONString()
            print("loginModalStr",loginModal.toJSONString())
            VerifyMobileNumberRequest.call_request(param: loginModalStr!) {
                
                [self] (res) in
                
                let loginRes : VerifyMobileNumberResponse = Mapper<VerifyMobileNumberResponse>().map(JSONString: res)!
                print("loginRes.status",loginRes.status)
                
                if loginRes.status == true {
                    PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                    
                    let defaults = UserDefaults.standard
                    defaults.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
//                    defaults.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
                    defaults.set(userNameTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
//                    defaults.set(passwordTextfield.text, forKey: Constant.DefaultsKeys.Password)
                    var memType : Int!
                    print("i.Constant.DefaultsKeys.memberTypeId",Constant.DefaultsKeys.memberTypeId)
                    
//                    for i in loginRes.data {
//                        defaults.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
//                        defaults.set(i.name, forKey: Constant.DefaultsKeys.firstName)
//                        print("i.memberTypeId",i.memberTypeId)
//                        memType = i.memberTypeId
//                        print("i.memberTypeId",i.memberTypeId)
//                        print("i.memberTypeId",i.memberTypeId)
//                        defaults.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
//                        defaults.set(i.email, forKey: Constant.DefaultsKeys.email)
//                        print("i.i.email",i.email)
//                        defaults.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
//                    }
                    
                    roleChooseView.isHidden = true
                    
                    PreferencesUtil.saveToPrefs(key: Constant.PersonalDetailResponse, value: res)
                    let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
                    viewController.type = "institute"
                    viewController.newRegisterLogin = 1
                    viewController.MobileNum = userNameTextfield.text
                    self.present(viewController, animated: true)
                    
                }else{
                    
                    roleChooseView.isHidden = false
//                    let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please Enter Mobile Number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
      }
      
//    func generateSalt() -> String {
//        let rounds : Int? = Int(self.saltInputTextField.text!)
//        
//        var salt : String
//        if rounds != nil && rounds >= 4 && rounds <= 31 {
//            salt = BCryptSwift.generateSaltWithNumberOfRounds(UInt(rounds!))
//        }
//        else {
//            salt = BCryptSwift.generateSalt()
//        }
//        
//        return salt
//    }
    
//    userName PAssword namma design tharanum

   
    
    @IBAction func RegisterHereAction(_ sender: UIButton) {
        
        
        roleChooseView.isHidden = false
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        hholeView.addSubview(blurEffectView)
        
//        let storyboard = UIStoryboard(name: "SelectionScreenStoryboard", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController() as! SelectionScreenViewController
//        self.present(viewController, animated: true)
//     
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    
    
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        userNameTextfield.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            userNameTextfield.resignFirstResponder()
        }
    
    
    
    
    @IBAction func alumni(_ sender: UIButton) {
        let is_user_logged = PreferencesUtil.checkPrefs(key: Constant.LoginResponse)
        let personalUser = PreferencesUtil.checkPrefs(key: Constant.PersonalDetailResponse)
//        if is_user_logged{
//            
//            print("is_user_logged",is_user_logged)
//            let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//            let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//            self.present(viewController, animated: true)
//        PersonalDetailViewController
        
//        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
//        self.present(viewController, animated: true)
        
//        }
//        else if personalUser{
//
//            let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
//            let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
//            self.present(viewController, animated: true)
            
        
//        }
//        
//        
//        else{
//            
//            
        
        
        roleChooseView.isHidden = true
//
        let storyboard = UIStoryboard(name: "SignUpMobileNumberStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignUpMobileNumberViewController
        viewController.instituteAlumni = 1
        self.present(viewController, animated: true)
//
        
        
         
//            
//        }
    }
    
    
    
    
    @IBAction func instituteAct(_ sender: UIButton) {
        
//        let storyboard = UIStoryboard(name: "SchoolSideSchoolDetailStoryboard", bundle: nil)
//                   let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolDetailViewController
//                   self.present(viewController, animated: true)
        
        
        print("instituteAct")
        
        roleChooseView.isHidden = true
        
        let storyboard = UIStoryboard(name: "SignUpMobileNumberStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SignUpMobileNumberViewController
        viewController.instituteAlumni = 2
        self.present(viewController, animated: true)
        
        
    }
    
    
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        
      
        if userNameTextfield.text != "" {
            let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
            viewController.MobileNum = userNameTextfield.text
            viewController.forgotType = 1
            
            self.present(viewController, animated: true)
        }else {
            let alert = UIAlertController(title: "Alert", message: "Please Enter The User Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
     
    }

    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

     return range.location <= 9
    }
    
    
    
    
}
