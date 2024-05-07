//
//  RegistrationViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit
import ObjectMapper
import CryptoSwift
import CryptoKit
import BCrypt
import Foundation
import SystemConfiguration

enum CryptoError: Error {
    case encryptionFailed
    case decryptionFailed
    case invalidKey
    // Add more error cases as needed
}




class RegistrationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var confirmPasswordEyeImg: UIImageView!
    
    
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var confirmPasswordView: UIViewX!
    
    @IBOutlet weak var createPasswordVirw: UIViewX!
    
    
    
    @IBOutlet weak var createPasswordEyeImg: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var enterFullNameTextField: UITextField!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var createPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterMobileNumTextField: UITextField!
    
    @IBOutlet weak var createPasswordHeight: NSLayoutConstraint!
    
    @IBOutlet weak var confirmPasswordHeight: NSLayoutConstraint!
    @IBOutlet weak var alumniView: UIViewX!
    @IBOutlet weak var nextView: UIView!
    
    @IBOutlet weak var instituteView: UIView!
    
    @IBOutlet weak var cancelView: UIView!
    @IBOutlet weak var chooseRoleView: UIView!
    
    
    let randomKey = SymmetricKey(size: .bits256)

    // Generate a random 128-bit (16-byte) IV
    let randomIV = SymmetricKey(size: .bits128)
    
    
    var show_password = true
    
    
    var userfirstTimeCreate : Int! = 1
    
    
    var userAlreadyCreateFirstName : String!
    var userAlreadyCreateLastName : String!
    var userAlreadyCreateMobileNum : String!
    var userAlreadyCreateEmail : String!
    var userAlreadyCreateCreatePwd : String!
    var userAlreadyCreateconfirmPwd : String!
    
    var getIpAddress : String! = ""
    var getMobileNumber : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let addr = getIPAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
        
        overrideUserInterfaceStyle = .light

        confirmPasswordView.isHidden = true
        createPasswordVirw.isHidden = true
        createPasswordHeight.constant = 0
        confirmPasswordHeight.constant = 0
        
        enterEmailTextField.font = UIFont(name: Constant.AppFontName.PoppinsBold, size: 25.0)
        enterEmailTextField.delegate = self
        createPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        enterMobileNumTextField.delegate = self
        enterFullNameTextField.delegate = self
        LastName.delegate = self
        
        enterMobileNumTextField.text = getMobileNumber

//        chooseRoleView.isHidden = true
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissVc))
        viewBack.addGestureRecognizer(backTapGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerVc))
        registrationView.addGestureRecognizer(tapGesture)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        
        
        addDoneButtonOnKeyboard()

        
        
        
        
        
        let createPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(toggle_password))
        createPasswordVirw.addGestureRecognizer(createPasswordEyeGesture)
        
        let confirmPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(confirm_toggle_password))
        confirmPasswordView.addGestureRecognizer(confirmPasswordEyeGesture)
        
        
        print("userfirstTimeCreate",userfirstTimeCreate)
        if userfirstTimeCreate == 1 {
            
          
        }else{
            userAlreadyCreateFirstName = enterFullNameTextField.text
             userAlreadyCreateLastName = LastName.text
             userAlreadyCreateMobileNum = enterMobileNumTextField.text
             userAlreadyCreateEmail = enterEmailTextField.text
             userAlreadyCreateCreatePwd = createPasswordTextField.text
             userAlreadyCreateconfirmPwd = confirmPasswordTextField.text
        }
       
    }
    
    
    
  
        
    
    
    func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>?

        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }

                guard let interface = ptr?.pointee else { continue }
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    let interfaceName = String(cString: interface.ifa_name)
                    if interfaceName == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                    &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                        break
                    }
                }
            }
            freeifaddrs(ifaddr)
        }

        return address
    }
    
    
    func isValidEmail() -> Bool {
           // Regular expression pattern for email validation
           let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
           
           // Create NSPredicate with the email regex pattern
           let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
           
           // Check if the email matches the regex pattern
           return emailPredicate.evaluate(with: self)
       }


    
    @objc func toggle_password(){
        print("toggle works")
        show_password = !show_password
        createPasswordTextField.isSecureTextEntry = show_password
        createPasswordEyeImg.image = UIImage(named: show_password ? "eye": "eyeColor")
        
    }
    
    
    @objc func confirm_toggle_password(){
        print("toggle works")
        show_password = !show_password
        confirmPasswordTextField.isSecureTextEntry = show_password
        confirmPasswordEyeImg.image = UIImage(named: show_password ? "eye": "eyeColor")
        
    
        
    }
    
    
    @IBAction func backVc(){
       dismiss(animated: true)
    
        
    }
    
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//     return range.location <= 9
//    }
//    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        enterMobileNumTextField.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            enterMobileNumTextField.resignFirstResponder()
        }
    
    
    
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height-91
//                print("keyboardSize.height",keyboardSize.height)
//            }
//        }
//    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func dismissVc() {
        dismiss(animated: true)
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
        self.present(viewController, animated: true)
        
    }
    
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
       
       var returnValue = true
       let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
       
       do {
           let regex = try NSRegularExpression(pattern: emailRegEx)
           let nsString = emailAddressString as NSString
           let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
           
           if results.count == 0
           {
               returnValue = false
           }
           
       } catch let error as NSError {
           print("invalid regex: \(error.localizedDescription)")
           returnValue = false
       }
       
       return  returnValue
   }
    
    @IBAction func registerVc() {
        
        
        //        if enterFullNameTextField.text != "" && enterEmailTextField.text != "" &&  enterMobileNumTextField.text != "" && createPasswordTextField.text != "" && confirmPasswordTextField.text != "" {
        //
        
        
        
        
        
        
        if enterFullNameTextField.text != "" && enterEmailTextField.text != "" &&  enterMobileNumTextField.text != ""  {
            
            
            
            
            let email = enterEmailTextField.text
            if email!.isValidEmail() {
                print("Valid email address")
                
                let registerModal = NewAlumniRegistrationModal()
                registerModal.first_name = enterFullNameTextField.text
                registerModal.last_name = ""
                registerModal.mobile_number = enterMobileNumTextField.text
                registerModal.email_id = enterEmailTextField.text
                registerModal.user_agent = "iphone"
                
                //                    registerModal.password_key = hashed
                //                    registerModal.visible_pwd = confirmPasswordTextField.text
                
                
                var  registerModalStr = registerModal.toJSONString()
                print("registerModalStr",registerModal.toJSON())
                NewAlumniRegistrationRequest.call_request(param: registerModalStr!) {
                    
                    [self] (res) in
                    
                    let registerRes : NewAlumniRegistrationResponse = Mapper<NewAlumniRegistrationResponse>().map(JSONString: res)!
                    
                    
                    if registerRes.status == true {
                        
                        
                        
                        
                        PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                        
                        
                        let defaults = UserDefaults.standard
                        defaults.set(registerRes.token, forKey: Constant.DefaultsKeys.token)
                        defaults.set(enterMobileNumTextField.text, forKey: Constant.DefaultsKeys.MobileNumber)
                        defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                        
                        //                            let is_user_logged = PreferencesUtil.checkPrefs(key: Constant.LoginResponse)
                        //                            let personalUser = PreferencesUtil.checkPrefs(key: Constant.PersonalDetailResponse)
                        //                            if is_user_logged{
                        ////
                        //                                print("is_user_logged",is_user_logged)
                        //                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
                        //                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
                        //                                self.present(viewController, animated: true)
                        //                            }else if personalUser{
                        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
                        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
                        self.present(viewController, animated: true)
                        //                                        }
                    }else{
                        let alert = UIAlertController(title: "Alert", message: registerRes.message, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                    ////
                    ////                    }
                    //                }
                    //                catch {
                    //                    print("Error: \(error)")
                    //                }
                    //            }else{
                    //
                    //                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
                    //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    //                self.present(alert, animated: true, completion: nil)
                    ////                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
                    ////                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
                    ////                self.present(viewController, animated: true)
                    //            }
                    
                    
                    
                    
                    
                    
                }
                    
                    //        let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
                    //        let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
                    //        self.present(viewController, animated: true)
                }
            
            else {
                    print("Invalid email address")
                let alert = UIAlertController(title: "Alert", message: "Invalid email address", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                }
                
            } else{
                let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        
        
        
      
//            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//                return emailPredicate.evaluate(with: enterEmailTextField)

            
            
            isValidEmailAddress(emailAddressString: enterEmailTextField.text!)
            
            
            //            if createPasswordTextField.text == confirmPasswordTextField.text {
            
            //
            //                do {
            //                    // Generate random key and IV
            //                    let key = try generateRandomKey()
            //                    let iv = try generateRandomIV()
            //
            //                    // Encrypt a message
            //                    let messageToEncrypt = createPasswordTextField.text
            //                    let encryptedMessage = try encryptMessage(message: messageToEncrypt!, key: key, iv: iv)
            //                    print("Encrypted: \(encryptedMessage)")
            //
            //                    // Decrypt the message
            //                    let decryptedMessage = try decryptMessage(encryptedMessage: encryptedMessage, key: key, iv: iv)
            //                    print("Decrypted: \(decryptedMessage)")
            
            
            //                do {
            //                    let password = confirmPasswordTextField.text
            //
            //                    let salt = try BCrypt.Salt()
            //                    let hashed = try BCrypt.Hash(password!, salt: salt)
            //                    print("Hashed result is: \(hashed)")
           
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    func generateRandomKey() throws -> SymmetricKey {
        return SymmetricKey(size: .bits256)
    }

    // Generate a random 128-bit (16-byte) IV
    func generateRandomIV() throws -> SymmetricKey {
        return SymmetricKey(size: .bits128)
    }

    // Encrypt a message
    func encryptMessage(message: String, key: SymmetricKey, iv: SymmetricKey) throws -> String {
        guard let messageData = message.data(using: .utf8) else {
            throw CryptoError.encryptionFailed
        }
        
        let aes = try AES(key: key.withUnsafeBytes { Data(Array($0)).bytes }, blockMode: .CBC(iv: iv.withUnsafeBytes { [UInt8]($0) }), padding: .pkcs7)
        
        let encrypted = try aes.encrypt(messageData.bytes)
        let encryptedData = Data(encrypted)
        
        return encryptedData.base64EncodedString()
    }
      
    
    
    func decryptMessage(encryptedMessage: String, key: SymmetricKey, iv: SymmetricKey) throws -> String {
        guard let encryptedData = Data(base64Encoded: encryptedMessage) else {
            throw CryptoError.decryptionFailed
        }
        
        let aes = try AES(key: key.withUnsafeBytes { Data(Array($0)).bytes }, blockMode: .CBC(iv: iv.withUnsafeBytes { [UInt8]($0) }), padding: .pkcs7)
        
        let decrypted = try aes.decrypt(encryptedData.bytes)
        guard let decryptedMessage = String(bytes: decrypted, encoding: .utf8) else {
            throw CryptoError.decryptionFailed
        }
        
        return decryptedMessage
    }

   
}
