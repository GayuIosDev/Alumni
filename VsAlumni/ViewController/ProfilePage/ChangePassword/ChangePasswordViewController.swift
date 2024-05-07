//
//  ChangePasswordViewController.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import UIKit
import ObjectMapper
import CryptoSwift
import CryptoKit

import BCrypt


class ChangePasswordViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var newPasswordEyeImg: UIImageView!
    @IBOutlet weak var oldPasswordEyeimf: UIImageView!
    @IBOutlet weak var oldPasswordEyeView: UIView!
    @IBOutlet weak var newPasswordEyeView: UIView!
    @IBOutlet weak var confirmPasswordEyeView: UIView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var confirmPasswordEyeImg: UIImageView!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var backView: UIView!
    
    
    
    var show_password = true
    let randomKey = SymmetricKey(size: .bits256)
    
    // Generate a random 128-bit (16-byte) IV
    let randomIV = SymmetricKey(size: .bits128)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        oldPasswordTextField.delegate = self
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        
        let changePasswordGesture = UITapGestureRecognizer(target: self, action: #selector(changePasswordVc))
        changePasswordView.addGestureRecognizer(changePasswordGesture)
        
        
        let newPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(new_toggle_password))
        newPasswordEyeView.addGestureRecognizer(newPasswordEyeGesture)
        
       
        let oldPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(old_password))
        oldPasswordEyeView.addGestureRecognizer(oldPasswordEyeGesture)
        
        let confirmPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(confirm_toggle_password))
        confirmPasswordEyeView.addGestureRecognizer(confirmPasswordEyeGesture)
        
       
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func old_password(){
        print("toggle works")
        show_password = !show_password
        oldPasswordTextField.isSecureTextEntry = show_password
        oldPasswordEyeimf.image = UIImage(named: show_password ? "eye": "eyeColor")
        
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
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    func generateRandomKey() throws -> SymmetricKey {
        return SymmetricKey(size: .bits256)
    }
    
    // Generate a random 128-bit (16-byte) IV
    func generateRandomIV() throws -> SymmetricKey {
        return SymmetricKey(size: .bits128)
    }
    
    @IBAction func changePasswordVc() {
        
        
        
        if confirmPasswordTextField.text != "" && newPasswordTextField.text != "" && oldPasswordTextField.text != "" {
            
            if confirmPasswordTextField.text == newPasswordTextField.text {
                
                //            do {
                //                // Generate random key and IV
                //                let key = try generateRandomKey()
                //                let iv = try generateRandomIV()
                //                
                //                // Encrypt a message
                //                let messageToEncrypt = newPasswordTextField.text
                //                let encryptedMessage = try encryptMessage(message: messageToEncrypt!, key: key, iv: iv)
                //                print("Encrypted: \(encryptedMessage)")
                //                
                //                // Decrypt the message
                //                let decryptedMessage = try decryptMessage(encryptedMessage: encryptedMessage, key: key, iv: iv)
                //                print("Decrypted: \(decryptedMessage)")
                
                
                //                if createPasswordTextField.text == confirmPasswordTextField.text {
                
                
                
                
                let password = newPasswordTextField.text
                do {
                    let salt = try BCrypt.Salt()
                    let hashed = try BCrypt.Hash(password!, salt: salt)
                    print("Hashed result is: \(hashed)")
                    
                    let defaults = UserDefaults.standard
                    var token = defaults.string(forKey: Constant.DefaultsKeys.token)
                    
                    
                    let chngPasswordModal = ChangePasswordModal()
                    chngPasswordModal.old_password = oldPasswordTextField.text
                    chngPasswordModal.new_password = hashed
                    
                    var  chngPasswordModalStr = chngPasswordModal.toJSONString()!
                    print("chngPasswordModaltr",chngPasswordModal.toJSON())
                    ChangePasswordRequest.call_request(param: chngPasswordModalStr , token: token! ) {
                        
                        [self] (res) in
                        
                        let changePasswordRes : ChangePasswordResponse = Mapper<ChangePasswordResponse>().map(JSONString: res)!
                        
                        
                        if changePasswordRes.status == true {
                            
                            
                            let alert = UIAlertController(title: "", message: changePasswordRes.message, preferredStyle: UIAlertController.Style.alert)
//                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)

                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                                
                                
                                //                            let defaults = UserDefaults.standard
                                //                            defaults.set(schoolRegRes.token, forKey: Constant.DefaultsKeys.token)
                                //                            defaults.set(contactNumberTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
                                //                            defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                                
                                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                                
                                self.present(viewController, animated: true)
                            }))
                            
                        }else{
                            let alert = UIAlertController(title: "Alert", message: changePasswordRes.message, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        
                    }
                }
                catch {
                    print("An error occured: \(error)")
                }
                //            }catch {
                //                print("Error: \(error)")
                //            }
            }
            else{
                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
            else{
                let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    
}
        
    

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
