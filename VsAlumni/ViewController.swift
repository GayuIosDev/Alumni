//
//  ViewController.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper
import BCrypt
import SwiftGifOrigin
import Foundation
import SystemConfiguration



class ViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    var getDeviceID : String!

    var getIpAddress : String! = ""

    
    
    var isversionupdateavailable   :  Int!

    var isforceupdaterequired :  Int!

    var IsTermsShow : Bool!
    var LIVE_ITUNES = "https://apps.apple.com/us/app/gradit/id1574188445"

    
var versionalertcontent   :  String!

var versionalerttitle :  String!


    override func viewDidLoad() {
        super.viewDidLoad()
        getDeviceID = UIDevice.current.identifierForVendor!.uuidString
        

//        self.gifImage.image = UIImage.gif(name: "Rocket")
//        let gifURL = URL(string: "Rocket")
//                  // Use SDWebImage to load and display the GIF image
//        gifImage.sd_setImage(with: gifURL)
        
       
        let gifImage1 = UIImage.gif(name: "Rocket")
                    // Set the GIF image to the image view
        gifImage.image = gifImage1
                
        
        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
        

        overrideUserInterfaceStyle = .light
        versionCheck()
      
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.00) { [self] in
            
            let defaults =  UserDefaults.standard
            var mobileNum = defaults.string(forKey: Constant.DefaultsKeys.MobileNumber)
            var password = defaults.string(forKey: Constant.DefaultsKeys.Password)

            let is_user_logged = PreferencesUtil.checkPrefs(key: Constant.LoginResponse)
//            let personalUser = PreferencesUtil.checkPrefs(key: Constant.PersonalDetailResponse)
            if is_user_logged{
                
                print("is_user_logged",is_user_logged)
                print("mobileNum",mobileNum)
                print("password",password)

                
                let autoLoginModal = AutoLoginResponseModal()
                
                autoLoginModal.mobile_number = mobileNum
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
                            let userdefault = UserDefaults.standard

                            userdefault.set(i.token, forKey: Constant.DefaultsKeys.token)
                            if i.isLogout == 1 {
                                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                self.present(viewController, animated: true)
                            }else if i.isRegistered == 1 {
                                if i.isRedirectOTP == 1 {
                                    let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                    self.present(viewController, animated: true)
                                }else{
                                    
                                    if i.isEducationalDetailsAdded == 1 {
                                        
                                        let loginModal = LoginCredentialModal()
                                        
                                        loginModal.user_name = mobileNum
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
                                                var memType : Int!
                                                userdefault.set(loginRes.token, forKey: Constant.DefaultsKeys.token)
                                                for i in loginRes.data {
                                                    let userdefault = UserDefaults.standard
                                                    
                                                    userdefault.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                                                    userdefault.set(i.name, forKey: Constant.DefaultsKeys.firstName)
                                                    print("i.memberTypeId",i.memberTypeId)
                                                    memType = i.memberTypeId
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
                                                viewController.memberType = memType
                                                self.present(viewController, animated: true)
                                            }
                                        }
                                    }else{
                                        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
                                        self.present(viewController, animated: true)
                                    }
                                    
                                }
                                    
                                }else{
                                    
                                    
                                    let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                    self.present(viewController, animated: true)
                                    
                                    
                                
                                
                            }
                        }
                    }
                }
            }
        }
                
                
     
            

    }

    
    
    
    @IBAction func versionCheck() {

     
        
        
        let versionModal = VersionCheckModal()
        
        versionModal.device_type = "Iphone"
        versionModal.version_code = 1
        
        let versionModalStr = versionModal.toJSONString()
        
        VersionCheckRequest.call_request(param: versionModalStr!){
            (res) in
            
            let version_response : VersionCheckResponse = Mapper<VersionCheckResponse>().map(JSONString: res)!
            
            if version_response.status == true {
//                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    
                    
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                        
                        var termUrl : String!
                        
                        for i in version_response.data {
                            
                            let defaults = UserDefaults.standard
                            defaults.set(i.privacyPolicy, forKey: Constant.DefaultsKeys.privacyPolicy)
                            defaults.set(i.termsAndConditions, forKey: Constant.DefaultsKeys.TermsAndCondition)
                            defaults.set(i.faq, forKey: Constant.DefaultsKeys.faq)
                            defaults.set(i.help, forKey: Constant.DefaultsKeys.help)
                            defaults.set(i.ShareAppLink, forKey: Constant.DefaultsKeys.ShareAppLink)
                            termUrl = i.termsAndConditions
                            defaults.set(i.VimeoToken, forKey: Constant.DefaultsKeys.VimeoToken)
                            isversionupdateavailable = i.isUpdateAvailable
                            isforceupdaterequired = i.isForceUpdate
                            IsTermsShow = i.IsTermsShow
                        }
                        
                        
                        
                        
                        
                        
                        if(isversionupdateavailable == 1){
                             
                           
                            let alert = UIAlertController(title: versionalerttitle, message:versionalertcontent, preferredStyle: UIAlertController.Style.alert)
                            
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { [self] action in
                                
                                if(isversionupdateavailable == 1 && isforceupdaterequired == 1)
                                    
                                {
                                    
                                    let alert = UIAlertController(title: "Needs to Update", message: "New updates are available. Would you like to update them now?", preferredStyle: UIAlertController.Style.alert)
                                    
//
                                    
                                    alert.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: { action in self.callAppStore()}))
                                    
                                    
                                    
                                    DispatchQueue.main.async{
                                        
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                    
                                }else  if(isversionupdateavailable == 1 && isforceupdaterequired == 0) {
                                    
                                    let alert = UIAlertController(title: "Needs to Update", message: "New updates are available. Would you like to update them now?", preferredStyle: UIAlertController.Style.alert)
                                    
                                    alert.addAction(UIAlertAction(title: "Not Now", style: UIAlertAction.Style.default, handler: { action in
                                        
                                        let storyboard = UIStoryboard(name: "TermsAndConditionStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! TermsAndConditionViewController
                                        viewController.termUrl = termUrl
                                        self.present(viewController, animated: true)
                                    
                                    }))
                                    
                                    alert.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: { action in self.callAppStore()}))
                                    
                                    
                                    
                                    DispatchQueue.main.async{
                                        
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                    
                                }
//
                                                            else
                                
                                {
                                    
                                    
                                                                let storyboard = UIStoryboard(name: "TermsAndConditionStoryboard", bundle: nil)
                                                                let viewController = storyboard.instantiateInitialViewController() as! TermsAndConditionViewController
                                                                viewController.termUrl = termUrl
                                                                self.present(viewController, animated: true)
                                                            }
                                
                                
                                
                            }))
                            
                            DispatchQueue.main.async
                            
                            {
                                
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                            
                            
                            
                        }else{
                            
                            
                           
                            if IsTermsShow == true {
                                let storyboard = UIStoryboard(name: "TermsAndConditionStoryboard", bundle: nil)
                                let viewController = storyboard.instantiateInitialViewController() as! TermsAndConditionViewController
                                viewController.termUrl = termUrl
                                self.present(viewController, animated: true)
                            }else{
                                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                   let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                   self.present(viewController, animated: true)
                            }
                            
                            
                            
                        }
                    }
                }
            }else{
                
                
                let alert = UIAlertController(title: "Alert", message: version_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
             
                
            }
        }
        
    }
    


    
    func callAppStore ()

        {

            print("callAppStore")

          

            

            

            let myUrl = LIVE_ITUNES

                if let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty {

                    UIApplication.shared.open(url, options: [:], completionHandler: nil)

                }



                // or outside scope use this

                guard let url = URL(string: "\(myUrl)"), !url.absoluteString.isEmpty else {

                   return

                }

                 UIApplication.shared.open(url, options: [:], completionHandler: nil)

        }



        



       






}

