//
//  ResetPasswordViewController.swift
//  VsAlumni
//
//  Created by admin on 21/01/24.
//

import UIKit
import ObjectMapper
import BCrypt


class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordEyeImg: UIImageView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var resetPasswordView: UIView!
    
    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var newPasswordEyeView: UIView!
    
    @IBOutlet weak var confirmPasswordEyeView: UIView!
    
    @IBOutlet weak var confirmPasswordEyeImg: UIImageView!
    var token : String!
    var password : String!
    var MobileNum : String!
    var getIp : String!
    var show_password = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backGes = UITapGestureRecognizer(target: self, action: #selector(dismissVc))
        backView.addGestureRecognizer(backGes)
        
        
        
        let resetGes = UITapGestureRecognizer(target: self, action: #selector(resendVc))
        resetPasswordView.addGestureRecognizer(resetGes)
        
        //        let defaults =  UserDefaults.standard
        //        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        
        
        let newPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(new_toggle_password))
        newPasswordEyeView.addGestureRecognizer(newPasswordEyeGesture)
        
        
        
        let confirmPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(confirm_toggle_password))
        confirmPasswordEyeView.addGestureRecognizer(confirmPasswordEyeGesture)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func confirm_toggle_password(){
        print("toggle works")
        show_password = !show_password
        confirmPasswordTextField.isSecureTextEntry = show_password
        confirmPasswordEyeImg.image = UIImage(named: show_password ? "eye": "eyeColor")
        
        
        
    }
    
    
    @objc func new_toggle_password(){
        print("toggle works")
        show_password = !show_password
        newPasswordTextField.isSecureTextEntry = show_password
        newPasswordEyeImg.image = UIImage(named: show_password ? "eye": "eyeColor")
        
        
        
    }
    
    
    @IBAction func dismissVc(){
        dismiss(animated: true)
    }
    
    
    
    @IBAction func resendVc(){
        
        if newPasswordTextField.text != "" &&  confirmPasswordTextField.text != ""  {
            if confirmPasswordTextField.text == newPasswordTextField.text {
                
                let resetModal = ResetPasswordModal()
                let password = newPasswordTextField.text
                do {
                    let salt = try BCrypt.Salt()
                    let hashed = try BCrypt.Hash(password!, salt: salt)
                    print("Hashed result is: \(hashed)")
                    
                    
                    resetModal.password_key = hashed
                    
                    //                schoolModal.designation = dobTextField.text
                    
                    
                    var  resetModalStr = resetModal.toJSONString()
                    print("resetModalStr",resetModal.toJSON())
                    ResetPasswordRequest.call_request(param: resetModalStr!, token: token!) {
                        
                        [self] (res) in
                        
                        let resendRes : ResetPasswordResponse = Mapper<ResetPasswordResponse>().map(JSONString: res)!
                        
                        
                        if resendRes.status == true {
                            
                            
                            let loginModal = LoginCredentialModal()
                            
                            loginModal.user_name = MobileNum
//                            loginModal.password_key = password
                            loginModal.user_agent = "iphone"
                            loginModal.ip_address = getIp
                            
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
                                        userdefault.set(i.userLoginId, forKey: Constant.DefaultsKeys.LoginId)

                                    }
                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                    self.present(viewController, animated: true)
                                    //                    }
                                    //                }
                                    
                                    
                                    
                                    
                                    
                                }else{
                                    let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                }
                                //            }else{
                                //                let alert = UIAlertController(title: "Alert", message: resendRes.message, preferredStyle: UIAlertController.Style.alert)
                                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                //                self.present(alert, animated: true, completion: nil)
                            }
                            
                            
                            
                            
                        }
                        
                    }
                    
                }  catch {
                    print("An error occured: \(error)")
                }
                
            }   else{
                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        } else{
            let alert = UIAlertController(title: "Alert", message: "Please enter user name and password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
