//
//  OtpGenerateViewController.swift
//  VsAlumni
//
//  Created by admin on 02/11/23.
//

import UIKit
import ObjectMapper
import Foundation
import SystemConfiguration
import NetworkExtension
import CoreTelephony
import KRProgressHUD

class OtpGenerateViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var verificationCodeLBl: UILabel!
    
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var backToLoginBtn: UIButton!
    
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var verifyView: UIView!
    @IBOutlet weak var enterOtpTextfield: UITextField!
    
    var token : String!
    var MobileNum : String!
    var password : String!
    
    var type : String!
    var memberType : Int!
    var getIpAddress : String! = ""
    var forgotType : Int!
    
    var secondsRemaining = 1 * 30 //5 minutes
    var myTimer : Timer?
    
    var newRegisterLogin : Int!
    
    var getDeviceID : String!
    var instituteAlumni : Int!
    
    
//    var otpHide : Int!
//    @State var loginPresented = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let intLetters = MobileNum.prefix(3)
        let endLetters = MobileNum.suffix(2)

        let newString = intLetters + "*****" + endLetters
        
        verificationCodeLBl.text = "A verification code has been sent to" + " " + newString
        overrideUserInterfaceStyle = .light
      
     
        
        if newRegisterLogin == 1 {
            backToLoginBtn.isHidden = true
            lineView.isHidden = true
        }else{
            backToLoginBtn.isHidden = false
            lineView.isHidden = false
            

        }
        
        
        getDeviceID = UIDevice.current.identifierForVendor!.uuidString
print("getDeviceID",getDeviceID)
        enterOtpTextfield.delegate = self
        addDoneButtonOnKeyboard()
      
        //        let defaults =  UserDefaults.standard
        //        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
        
//        directOtpScreen ()
        
        
        // Example usage
//        if let ipAddress = getCellularIPAddress() {
//            print("Cellular IP Address: \(ipAddress)")
//        } else {
//            print("Cellular IP Address not found")
//        }
//        
//        
//        
        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
//        
        
        if forgotType == 1 {
            print("MobileNum",MobileNum)
            forgotVc()
        }else {
            
            let defaults =  UserDefaults.standard
            password = defaults.string(forKey: Constant.DefaultsKeys.Password)
            MobileNum = defaults.string(forKey: Constant.DefaultsKeys.MobileNumber)
            token = defaults.string(forKey: Constant.DefaultsKeys.token)
            memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
            print("password",password)
            print("MobileNum",MobileNum)
            print("memberTypei",memberType)
        }
        let otpGest = UITapGestureRecognizer(target: self, action: #selector(verifyOtp))
        verifyView.addGestureRecognizer(otpGest)
        
        
        
        controlTimer()
        
        if let cellularIPAddress = getCellularIPAddress() {
               print("Cellular IP Address: \(cellularIPAddress)")
           } else {
               print("Unable to retrieve cellular IP address")
           }
          
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
   
    
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        enterOtpTextfield.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        enterOtpTextfield.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        self.view.endEditing(true)
        
        
        return false
        
        
    }
    
    
    func controlTimer() {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            if self?.secondsRemaining ?? 0 > 0 {
                let minutes = Int(self?.secondsRemaining ?? 0) / 60
                let seconds = Int(self?.secondsRemaining ?? 0) % 60
                //VerificationTimeVal is a UI element to display the time
                let timerResults = String(format: "%02d:%02d", minutes, seconds)
                self?.resendBtn.setTitle("\(timerResults)", for: .normal)
                
                self?.secondsRemaining -= 1
            } else {
                timer.invalidate()
                //VerificationTimeVal is a UI element to display the time
                self?.resendBtn.setTitle("Resend",for: .normal)
                
                //                self?.resendView.isUserInteractionEnabled = true
                //                let resend = UITapGestureRecognizer(target: self, action: #selector(self?.resendVc))
                //                self?.resendView.addGestureRecognizer(resend)
                
                
            }
        }
        
        // Add the timer to the current RunLoop
        RunLoop.current.add(myTimer!, forMode: .common)
        
        
        
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

     return range.location <= 5
    }
    @IBAction func backVc(){
        dismiss(animated: true)
    }
    
    @IBAction  func directOtpScreen () {
        
        let defaults =  UserDefaults.standard
        
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        print("type",type)
        print("memberType",memberType)
        
        let loginModal = LoginCredentialModal()
        
        loginModal.user_name = MobileNum
//        loginModal.password_key = password
        loginModal.user_agent = "iphone"
        loginModal.ip_address = getIpAddress
        
        var  loginModalStr = loginModal.toJSONString()
        print("loginModalStr",loginModal.toJSONString())
        LoginCredentialRequest.call_request(param: loginModalStr!) {
            
            [self] (res) in
            
            let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
            print("loginRes.status",loginRes.status)
            if loginRes.status == true {
                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                let userdefault = UserDefaults.standard
                userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
                
                userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
                for i in loginRes.data {
                    let userdefault = UserDefaults.standard
                    
                    userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                    userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                    print("i.memberTypeId",i.memberTypeId)
                    //                                    memType = i.memberTypeId
                    print("i.memberTypeId",i.memberTypeId)
                    print("i.memberTypeId",i.memberTypeId)
                    userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                    userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
                    print("i.i.email",i.email)
                    userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
                    userdefault.set(i.profilePicture, forKey: Constant.DefaultsKeys.profileImg)
                    userdefault.set(i.userLoginId, forKey: Constant.DefaultsKeys.LoginId)
                }
            
                
                
                
                
                
            }else{
                let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            //        if memberType == 1 ||  memberType == 2 {
            //
            //            //            if type == "institute" {
            //
            //            let otpModal = ValidateOtpModal()
            //
            //            otpModal.recentOtp = enterOtpTextfield.text
            //
            //
            //
            //
            //            var  otpModalStr = otpModal.toJSONString()
            //            print("otpModalStr",otpModal.toJSON())
            //            print("token",token)
            //            ValidateOtpInstituteRequest.call_request(param: otpModalStr!,token: token) {
            //
            //                [self] (res) in
            //
            //                let validateRes : ValidateOtpResponse = Mapper<ValidateOtpResponse>().map(JSONString: res)!
            //
            //
            //                if validateRes.status == true {
            //
            //
            //
            //                    let loginModal = LoginCredentialModal()
            //
            //                    loginModal.user_name = MobileNum
            //                    loginModal.password_key = password
            //                    loginModal.user_agent = "iphone"
            //                    loginModal.ip_address = getIpAddress
            //
            //                    var  loginModalStr = loginModal.toJSONString()
            //                    print("loginModalStr",loginModal.toJSONString())
            //                    LoginCredentialRequest.call_request(param: loginModalStr!) {
            //
            //                        [self] (res) in
            //
            //                        let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
            //                        print("loginRes.status",loginRes.status)
            //                        if loginRes.status == true {
            //
            //                            let userdefault = UserDefaults.standard
            //                            userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
            //                            PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
            //
            //                            userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
            //                            for i in loginRes.data {
            //                                let userdefault = UserDefaults.standard
            //
            //                                userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
            //                                userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                //                                        memType = i.memberTypeId
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
            //                                userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
            //                                print("i.i.email",i.email)
            //                                userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
            //                            }
            //
            //                            let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
            //                            let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
            //                            self.present(viewController, animated: true)
            //                        }
            //
            //
            //
            //
            //                    }
            //
            //                }else{
            //                    let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
            //                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            //                    self.present(alert, animated: true, completion: nil)
            //                }
            //
            //            }
            //
            //            //                }
            //            //                else{
            //            //                    let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
            //            //                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            //            //                    self.present(alert, animated: true, completion: nil)
            //            //                }
            //
            //            //                }
            //
            //        }else if memberType == 4 {
            
            //            else {
            
            //
            //            let otpModal = ValidateOtpModal()
            //            otpModal.recentOtp = enterOtpTextfield.text
            //
            //
            //            var  otpModalStr = otpModal.toJSONString()
            //            print("otpModalStr",otpModal.toJSON())
            //            print("token",token)
            //            ValidateOtpRequest.call_request(param: otpModalStr!,token: token) {
            //
            //                [self] (res) in
            //
            //                let validateRes : ValidateOtpResponse = Mapper<ValidateOtpResponse>().map(JSONString: res)!
            //
            //
            //                if validateRes.status == true {
            //
            //
            //                    //                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
            //                    //                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
            //                    //                    self.present(viewController, animated: true)
            //
            //                    let loginModal = LoginCredentialModal()
            //
            //                    loginModal.user_name = MobileNum
            //                    loginModal.password_key = password
            //                    loginModal.user_agent = "iphone"
            //                    loginModal.ip_address = getIpAddress
            //
            //                    var  loginModalStr = loginModal.toJSONString()
            //                    print("loginModalStr",loginModal.toJSONString())
            //                    LoginCredentialRequest.call_request(param: loginModalStr!) {
            //
            //                        [self] (res) in
            //
            //                        let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
            //                        print("loginRes.status",loginRes.status)
            //                        if loginRes.status == true {
            //                            let userdefault = UserDefaults.standard
            //                            userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
            //                            PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
            //
            //                            userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
            //                            for i in loginRes.data {
            //                                let userdefault = UserDefaults.standard
            //
            //                                userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
            //                                userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                //                                    memType = i.memberTypeId
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                print("i.memberTypeId",i.memberTypeId)
            //                                userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
            //                                userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
            //                                print("i.i.email",i.email)
            //                                userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
            //                            }
            //
            //                            let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
            ////                            let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
            //                            self.present(viewController, animated: true)
            //                        }
            //                    }
            //
            //                }else{
            //                    let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
            //                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            //                    self.present(alert, animated: true, completion: nil)
            //                }
            //
            //            }
            //
            //
            //
            
            //        }
            
        }
        
        
    }
    @IBAction  func verifyOtp () {
        
        
        print("newRegisterLogin",newRegisterLogin)
        print("memberType",memberType)
        
        
        //        if memberType == 1 ||  memberType == 2 {
        
        //            if type == "institute" {
        
        
        
        if newRegisterLogin == 1 {
            
            
            let otpModal = NewValidateOtpModal()
            
            otpModal.recent_otp = Int(enterOtpTextfield.text!)
            otpModal.mobile_number = MobileNum
            
            
            
            
            var  otpModalStr = otpModal.toJSONString()
            print("otpModalStr",otpModal.toJSON())
            //                print("token",token)
            
            NewValidateOtpRequest.call_request(param: otpModalStr!) {
                
                [self] (res) in
                
                let validateRes : NewValidateOtpResponse = Mapper<NewValidateOtpResponse>().map(JSONString: res)!
                
                
                if validateRes.status == true {
                    
                    
                    let autoLoginModal = AutoLoginResponseModal()
                    
                    autoLoginModal.mobile_number = MobileNum
                    autoLoginModal.device_id = getDeviceID
                    autoLoginModal.device_type = "iphone"
                    autoLoginModal.ip_address = getIpAddress
                    autoLoginModal.is_otp_validated = 1
                    
                    var  autoLoginModalStr = autoLoginModal.toJSONString()
                    print("loginModalStr",autoLoginModal.toJSONString())
                    AutoLoginRequest.call_request(param: autoLoginModalStr!) {
                        
                        [self] (res) in
                        
                        let loginRes : AutoLoginResponse = Mapper<AutoLoginResponse>().map(JSONString: res)!
                        print("loginRes.status",loginRes.status)
                        if loginRes.status == true {
                            
                            for i in loginRes.data {
                                print("i.isLogout",i.isLogout)
                                print("i.isRegistered",i.isRegistered)
                                
                                print("i.isEducationalDetailsAdded",i.isEducationalDetailsAdded)
                                enterOtpTextfield.text = ""
                                resendBtn.setTitle("Resend",for: .normal)
                                
                                secondsRemaining  = 0
                                let userdefault = UserDefaults.standard
                               
                                
                                userdefault.set(i.token, forKey: Constant.DefaultsKeys.token)

                                if i.isLogout == 1 {
                                    let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                    self.present(viewController, animated: true)
                                }else if i.isRegistered == 1 {
                                    if i.isEducationalDetailsAdded == 1 {
                                        
                                        let loginModal = LoginCredentialModal()
                                        
                                        loginModal.user_name = MobileNum
                                        //                                                                       loginModal.password_key = password
                                        loginModal.user_agent = "iphone"
                                        loginModal.ip_address = getIpAddress
                                        
                                        var  loginModalStr = loginModal.toJSONString()
                                        print("loginModalStr",loginModal.toJSONString())
                                        LoginCredentialRequest.call_request(param: loginModalStr!) {
                                            
                                            [self] (res) in
                                            
                                            let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
                                            print("loginRes.status",loginRes.status)
                                            if loginRes.status == true {
                                                let userdefault = UserDefaults.standard
                                                userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
                                                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                                                
                                                userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
                                                for i in loginRes.data {
                                                    let userdefault = UserDefaults.standard
                                                    
                                                    userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                                                    userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                                                    print("i.memberTypeId",i.memberTypeId)
                                                    //                                    memType = i.memberTypeId
                                                    print("i.memberTypeId",i.memberTypeId)
                                                    print("i.memberTypeId",i.memberTypeId)
                                                    userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                                                    userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
                                                    print("i.i.email",i.email)
                                                    userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
                                                    userdefault.set(i.profilePicture, forKey: Constant.DefaultsKeys.profileImg)
                                                    userdefault.set(i.userLoginId, forKey: Constant.DefaultsKeys.LoginId)
                                                    
                                                }
                                                
                                                let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                                let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                                self.present(viewController, animated: true)
                                            }
                                        }
                                    }else{
                                        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
                                        viewController.token = token

                                        self.present(viewController, animated: true)
                                    }
                                    
                                    
                                    
                                }else{
                                    print("instituteAlumni",instituteAlumni)
                                    print("instituteAlumni",instituteAlumni)
                                    
                                    if instituteAlumni == 1 {
                                        
                                        let storyboard = UIStoryboard(name: "RegistrationStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! RegistrationViewController
                                        viewController.getMobileNumber = MobileNum
                                        self.present(viewController, animated: true)
                                        
                                    }else  if instituteAlumni == 2{
                                        
                                        let storyboard = UIStoryboard(name: "SchoolSideSchoolDetailStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolDetailViewController
                                        
                                        self.present(viewController, animated: true)
                                    }
                                }
                                
                                
                            }
                        }
                    }
                }  else{
                    let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
                
                    }else{
                        
                        if enterOtpTextfield.text != "" {
                            let otpModal = NewValidateOtpModal()
                            
                            otpModal.recent_otp = Int(enterOtpTextfield.text!)
                            otpModal.mobile_number = MobileNum
                            
                            
                            
                            
                            var  otpModalStr = otpModal.toJSONString()
                            print("otpModalStr",otpModal.toJSON())
                            //                print("token",token)
                            
//                            KRProgressHUD.show()

                            NewValidateOtpRequest.call_request(param: otpModalStr!) {
                                
                                [self] (res) in
                                
                                let validateRes : NewValidateOtpResponse = Mapper<NewValidateOtpResponse>().map(JSONString: res)!
                                
                                
                                if validateRes.status == true {
                                    
                                    let autoLoginModal = AutoLoginResponseModal()
                                    
                                    autoLoginModal.mobile_number = MobileNum
                                    autoLoginModal.device_id = getDeviceID
                                    autoLoginModal.device_type = "iphone"
                                    autoLoginModal.ip_address = getIpAddress
                                    autoLoginModal.is_otp_validated = 1
                                    var  autoLoginModalStr = autoLoginModal.toJSONString()
                                    print("loginModalStr",autoLoginModal.toJSONString())
                                    AutoLoginRequest.call_request(param: autoLoginModalStr!) {
                                        
                                        [self] (res) in
                                        
                                        let loginRes : AutoLoginResponse = Mapper<AutoLoginResponse>().map(JSONString: res)!
                                        print("loginRes.status",loginRes.status)
                                        if loginRes.status == true {
                                            
                                            
                                            for i in loginRes.data {
                                                let userdefault = UserDefaults.standard

                                                userdefault.set(i.token, forKey: Constant.DefaultsKeys.token)
                                                if i.isLogout == 1 {
                                                    
                                                    
                                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                                    self.present(viewController, animated: true)
//                                                    let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
//                                                    let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
//                                                    self.present(viewController, animated: true)
                                                } else  if i.isRegistered == 1 {
                                                        if i.isEducationalDetailsAdded == 1 {
                                                            
                                                            let loginModal = LoginCredentialModal()
                                                            
                                                            loginModal.user_name = MobileNum
                                                            //                                                                       loginModal.password_key = password
                                                            loginModal.user_agent = "iphone"
                                                            loginModal.ip_address = getIpAddress
                                                            
                                                            var  loginModalStr = loginModal.toJSONString()
                                                            print("loginModalStr",loginModal.toJSONString())
                                                            LoginCredentialRequest.call_request(param: loginModalStr!) {
                                                                
                                                                [self] (res) in
                                                                
                                                                let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
                                                                print("loginRes.status",loginRes.status)
                                                                if loginRes.status == true {
                                                                    let userdefault = UserDefaults.standard
                                                                    userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
                                                                    PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                                                                    userdefault.set(token, forKey: Constant.DefaultsKeys.token)
                                                                    for i in loginRes.data {
                                                                        let userdefault = UserDefaults.standard
                                                                        
                                                                        userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                                                                        userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                                                                        print("i.memberTypeId",i.memberTypeId)
                                                                        //                                    memType = i.memberTypeId
                                                                        print("i.memberTypeId",i.memberTypeId)
                                                                        print("i.memberTypeId",i.memberTypeId)
                                                                        userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                                                                        userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
                                                                        print("i.i.email",i.email)
                                                                        userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
                                                                        userdefault.set(i.profilePicture, forKey: Constant.DefaultsKeys.profileImg)
                                                                        userdefault.set(i.userLoginId, forKey: Constant.DefaultsKeys.LoginId)
                                                                    }
                                                                    
                                                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                                                    self.present(viewController, animated: true)
                                                                }
                                                            }
                                                        }else{
                                                            let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
                                                            let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
                                                            viewController.token = token
                                                            self.present(viewController, animated: true)
                                                        }
                                                        
                                                    }else{
                                                        
                                                        let storyboard = UIStoryboard(name: "RegistrationStoryboard", bundle: nil)
                                                        let viewController = storyboard.instantiateInitialViewController() as! RegistrationViewController
                                                        viewController.getMobileNumber = MobileNum
                                                        self.present(viewController, animated: true)
                                                    }
                                                    
                                                }
//                                            if i.isLogout == 0 {
//                                               
//                                                    let storyboard = UIStoryboard(name: "ChooseSignInStoryboard", bundle: nil)
//                                                    let viewController = storyboard.instantiateInitialViewController() as! ChooseSignInViewController
//                                                    self.present(viewController, animated: true)
//                                                
//                                                
//                                                }
                                                
//                                            }
                                        }
                                        
                                    }
                                    
                                    
                                }else{
                                    let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
                                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
//                            KRProgressHUD.dismiss()

                            
                        }else{
                            let alert = UIAlertController(title: "Alert", message: "Please Enter the Verification Code", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        //                }
                        //                else{
                        //                    let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
                        //                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        //                    self.present(alert, animated: true, completion: nil)
                        //                }
                        
                        //                }
                    }
                    //        }else if memberType == 4 {
                    //
                    ////            else {
                    //
                    //
                    //                        let otpModal = ValidateOtpModal()
                    //            otpModal.recentOtp = enterOtpTextfield.text
                    //
                    //
                    //                        var  otpModalStr = otpModal.toJSONString()
                    //                        print("otpModalStr",otpModal.toJSON())
                    //                print("token",token)
                    //                ValidateOtpRequest.call_request(param: otpModalStr!,token: token) {
                    //
                    //                    [self] (res) in
                    //
                    //                    let validateRes : ValidateOtpResponse = Mapper<ValidateOtpResponse>().map(JSONString: res)!
                    //
                    //
                    //                    if validateRes.status == true {
                    //
                    //
                    //    //                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
                    //    //                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
                    //    //                    self.present(viewController, animated: true)
                    //
                    //                        let loginModal = LoginCredentialModal()
                    //
                    //                        loginModal.user_name = MobileNum
                    //                        loginModal.password_key = password
                    //                        loginModal.user_agent = "iphone"
                    //                        loginModal.ip_address = getIpAddress
                    //
                    //                        var  loginModalStr = loginModal.toJSONString()
                    //                        print("loginModalStr",loginModal.toJSONString())
                    //                        LoginCredentialRequest.call_request(param: loginModalStr!) {
                    //
                    //                            [self] (res) in
                    //
                    //                            let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
                    //                            print("loginRes.status",loginRes.status)
                    //                            if loginRes.status == true {
                    //                                let userdefault = UserDefaults.standard
                    //                                userdefault.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
                    //                                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                    //
                    //                                userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
                    //                                for i in loginRes.data {
                    //                                    let userdefault = UserDefaults.standard
                    //
                    //                                    userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                    //                                    userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                    //                                    print("i.memberTypeId",i.memberTypeId)
                    ////                                    memType = i.memberTypeId
                    //                                    print("i.memberTypeId",i.memberTypeId)
                    //                                    print("i.memberTypeId",i.memberTypeId)
                    //                                    userdefault.set(i.lastname, forKey: Constant.DefaultsKeys.lastName)
                    //                                    userdefault.set(i.email, forKey: Constant.DefaultsKeys.email)
                    //                                    print("i.i.email",i.email)
                    //                                    userdefault.set(i.schoolName, forKey: Constant.DefaultsKeys.schoolName)
                    //                                }
                    //
                    //                                let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                    //                                let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                    //                                self.present(viewController, animated: true)
                    //                            }
                    //                        }
                    //
                    //                    }else{
                    //                        let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
                    //                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    //                        self.present(alert, animated: true, completion: nil)
                    //                    }
                    //
                    //                }
                    //
                    //
                    //        }
                    
                    //    }
                
                
            
            }
        
    
    @IBAction func resendOtpAction(_ sender: UIButton) {
        
        print("typmemberTypee",memberType)
        print("type",type)
        
        enterOtpTextfield.text = ""
        
        
        let loginModal = VerifyMobileNumberModal()
     
        loginModal.mobile_number = MobileNum
        loginModal.log_in = 0

//            loginModal.password_key = passwordTextfield.text
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
//                defaults.set(userNameTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
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
                
                PreferencesUtil.saveToPrefs(key: Constant.PersonalDetailResponse, value: res)
                
                
                
                secondsRemaining = 1 * 30
                
                controlTimer()
               
            }else{
                let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        
        //        if memberType == 1 ||  memberType == 2 {
//
////            if type == "institute" {
//                
//            let resetModal = ResetPasswordModal()
//            resetModal.password_key = password
//
//            //                schoolModal.designation = dobTextField.text
//           
//            
//            var  resetModalStr = resetModal.toJSONString()
//            print("resetModalStr",resetModal.toJSON())
//                print("token",token)
//                ResendOtpInstituteRequest.call_request() {
//                    
//                    [self] (res) in
//                    
//                    let validateRes : resendValidateOtpResponse = Mapper<resendValidateOtpResponse>().map(JSONString: res)!
//                    
//                    
//                    if validateRes.status == true {
////                        let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
////                        let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
////                        self.present(viewController, animated: true)
//                        
//                    }else{
//                        let alert = UIAlertController(title: "Alert", message: validateRes.message, preferredStyle: UIAlertController.Style.alert)
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                    //
//                    //
//                    //
//                }
//                
////            }
//        }else if memberType == 4{
//            let resetModal = ResetPasswordModal()
//            resetModal.password_key = password
//
//            //                schoolModal.designation = dobTextField.text
//           
//            
//            var  resetModalStr = resetModal.toJSONString()
//            print("resetModalStr",resetModal.toJSON())
//            print("token",token)
//            ResendOtpRequest.call_request() {
//                
//                [self] (res) in
//                
//                let validateRes : resendValidateOtpResponse = Mapper<resendValidateOtpResponse>().map(JSONString: res)!
//                
//                
//                if validateRes.status == true {
//                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//                    self.present(viewController, animated: true)
//                    
//                }else{
//                    let alert = UIAlertController(title: "Alert", message: "validateRes.message", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                }
//                //
//                //
//                //
//            }
        }
    }
    
    
    
    
   
    func getCellularIPAddress() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        if let carrier = networkInfo.subscriberCellularProvider {
            // You may need to contact a third-party service to get the IP address of the cellular connection
            // As iOS does not provide a straightforward way to get it.
            // Alternatively, you can use a server-side solution to track the IP address.
            // This approach is not recommended due to privacy and security concerns.
            // For Wi-Fi, use the method mentioned above.
            return nil
        }
        return nil
    }

    // Usage
//    if let cellularIPAddress = getCellularIPAddress() {
//        print("Cellular IP Address: \(cellularIPAddress)")
//    } else {
//        print("Unable to retrieve cellular IP address")
//    }
   
    
    
    
    func forgotVc() {
        
        let forgotModal = ForgotPasswordModal()
     
        forgotModal.user_name = MobileNum
        forgotModal.ip_address = getIpAddress
        forgotModal.user_agent = "Iphone"
      
        var  forgotModalStr = forgotModal.toJSONString()
        print("forgotModalStr",forgotModal.toJSONString())
        ForgotPasswordRequest.call_request(param: forgotModalStr!) {
            
            [self] (res) in
            
            let forgotRes : ForgotPasswordResponse = Mapper<ForgotPasswordResponse>().map(JSONString: res)!
            print("forgotRes.status",forgotRes.status)
            
            if forgotRes.status == true {
                
                token = forgotRes.token
                
                for i in forgotRes.data {
                    memberType = i.memberTypeId
                    
                    print("forgotRes.status",i.memberTypeId)

                }
//                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
//
//                let defaults = UserDefaults.standard
//                defaults.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
//                defaults.set(userNameTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
//                defaults.set(passwordTextfield.text, forKey: Constant.DefaultsKeys.Password)
//
//                PreferencesUtil.saveToPrefs(key: Constant.PersonalDetailResponse, value: res)
//                let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
//                let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
//                viewController.type = "institute"
//                viewController.token = loginRes.token
//                self.present(viewController, animated: true)
                
            }else{
                let alert = UIAlertController(title: "Alert", message: forgotRes.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
     
    }
    }
    

    
    @IBAction func backToLoginAction(_ sender: UIButton) {
        
        
        
        
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                        let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                        self.present(viewController, animated: true)
    }
    
    
    
    
    
  
}
