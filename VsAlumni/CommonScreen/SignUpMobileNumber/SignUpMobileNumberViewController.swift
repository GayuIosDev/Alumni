//
//  SignUpMobileNumberViewController.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import UIKit
import ObjectMapper



class SignUpMobileNumberViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var verifyView: UIView!
    
    
    
    var instituteAlumni : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButtonOnKeyboard()
        
        userNameTextfield.delegate = self
        let verifyGest = UITapGestureRecognizer(target: self, action: #selector(verify))
        verifyView.addGestureRecognizer(verifyGest)
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
        
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
    
    @IBAction func backVc(){
        dismiss(animated: true)
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
    
    
    @IBAction func verify() {
        if userNameTextfield.text != "" {
            
            
            
            
            let loginModal = VerifyMobileNumberModal()
            loginModal.mobile_number = userNameTextfield.text
            loginModal.log_in = 0
            
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
                    defaults.set(userNameTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
                    //                    defaults.set(passwordTextfield.text, forKey: Constant.DefaultsKeys.Password)
                    var memType : Int!
                    print("i.Constant.DefaultsKeys.memberTypeId",Constant.DefaultsKeys.memberTypeId)
                    
                    
                    let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
                    viewController.newRegisterLogin = 1
                    viewController.instituteAlumni = instituteAlumni
                    self.present(viewController, animated: true)
            //
                   
                }else{
                    let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please Enter Mobile Number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

     return range.location <= 9
    }
    
}
