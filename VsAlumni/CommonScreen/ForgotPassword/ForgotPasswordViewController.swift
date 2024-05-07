//
//  ForgotPasswordViewController.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import UIKit
import ObjectMapper
import Foundation
import SystemConfiguration

class ForgotPasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var loginView: UIView!
    var getIpAddress : String! = ""
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        
        mobileNumberTextField.delegate = self
        
        
        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
        
        
//        let forgotGesture  = UITapGestureRecognizer(target: self, action: #selector(forgotVc))
//        loginView.addGestureRecognizer(forgotGesture)

        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    
    
    
    
    
    

   
}
