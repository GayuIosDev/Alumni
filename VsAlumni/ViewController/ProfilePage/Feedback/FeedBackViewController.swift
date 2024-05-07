//
//  FeedBackViewController.swift
//  VsAlumni
//
//  Created by admin on 13/04/24.
//

import UIKit
import ObjectMapper


class FeedBackViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet weak var noChckImg: UIImageView!
    @IBOutlet weak var yesVheckImg: UIImageView!
    @IBOutlet weak var emailTextFld: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    
    
    @IBOutlet weak var mobileNumberTextfld: UITextField!
    
    
    
    @IBOutlet weak var noView: UIView!
    
    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var yesView: UIView!
    @IBOutlet weak var submitView: UIViewX!
    @IBOutlet weak var suggessionTexView: UITextView!
    
    var token : String!
    var yesAndNoRef : String!
    
    var strTextViewPlaceholder = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        name.delegate = self
        emailTextFld.delegate = self
        mobileNumberTextfld.delegate = self
        suggessionTexView.delegate = self
        
        mobileNumberTextfld.keyboardType = .numberPad
       
        
        addDoneButtonOnKeyboard()
        
        strTextViewPlaceholder = "Write your suggestions"
        
        self.suggessionTexView.layer.borderColor = UIColor.lightGray.cgColor
        self.suggessionTexView.layer.borderWidth = 1
        
        let total = UITapGestureRecognizer(target: self, action: #selector(backVC))
        backView.addGestureRecognizer(total)
        
        let submit = UITapGestureRecognizer(target: self, action: #selector(sendVC))
        submitView.addGestureRecognizer(submit)
        
        let yes = UITapGestureRecognizer(target: self, action: #selector(yesVC))
        yesView.addGestureRecognizer(yes)
        
        let no = UITapGestureRecognizer(target: self, action: #selector(NoVC))
        noView.addGestureRecognizer(no)
        
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        
        
      
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//           print("print1")
//        print("textViewDidBeginEditing",textView.text)
//       }

       func textViewDidEndEditing(_ textView: UITextView) {
           print("print2")
          
           
           print("textViewDidEndEditing",textView.text)
       }
    @objc func keyboardWillShow(notification: NSNotification) {
        
        
        
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-150
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

        suggessionTexView.inputAccessoryView = doneToolbar
        name.inputAccessoryView = doneToolbar
        emailTextFld.inputAccessoryView = doneToolbar
        mobileNumberTextfld.inputAccessoryView = doneToolbar
   
        
        }

    @objc func doneButtonAction(){
        suggessionTexView.resignFirstResponder()
        name.resignFirstResponder()
        emailTextFld.resignFirstResponder()
        mobileNumberTextfld.resignFirstResponder()
     
        
         
           
        }
    
    @IBAction func backVC() {
        
        dismiss(animated: true)
       
    }

    @IBAction func sendVC() {
        
        SendingApi()
        
    }
    
    
    
    
    @IBAction func yesVC() {
        
        yesAndNoRef = "1"
        noChckImg.image = UIImage(named: "ic_uncheck_box")
        yesVheckImg.image = UIImage(named: "ic_check_box")
        
    }
    @IBAction func NoVC() {
        
        yesAndNoRef = "0"
        yesVheckImg.image = UIImage(named: "ic_uncheck_box")
        noChckImg.image = UIImage(named: "ic_check_box")
        
    }
    
    
    
    func SendingApi(){
        
        
        
        if name.text != "" && emailTextFld.text != "" &&  mobileNumberTextfld.text != "" && yesAndNoRef != ""  {
            
            let feedBack = feedModal()
            
            
            feedBack.email = emailTextFld.text
            feedBack.name = name.text
            feedBack.is_satisfied = Int(yesAndNoRef)
            feedBack.mobile_number = mobileNumberTextfld.text
            feedBack.suggestion_content = suggessionTexView.text
            
            
            var  afeedBackStr = feedBack.toJSONString()
            
            print("alumniInstituteModalStr",feedBack.toJSON())
            
            
            
            
            
            
            
            print("token",token)
            
            
            
            
            FeedRequ.call_request(param: afeedBackStr!,token: token) {
                
                
                
                
                [self] (res) in
                
                
                
                let schoolRegRes : feedResp = Mapper<feedResp>().map(JSONString: res)!
                
                
                
                
                
                if schoolRegRes.status == true {
                    
                    
                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                    viewController.alertShowType = 1
                    viewController.gifImage = "success"
                    viewController.messageResponse = schoolRegRes.message
                   
                    viewController.EventRedirect = "FEED BACK"
//                            KRProgressHUD.dismiss()
                    self.present(viewController, animated: true)
                    
//                    let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                    
//                    
                    
                }else{
                    
                    
                    
                    let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
//
//
                    
                }
                
                
            }
        }else{
            
            let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    
    
    func textViewDidBeginEditing(_ textView: UITextView) {

       print("textViewDidBeginEditing")
        if suggessionTexView.text == strTextViewPlaceholder{
            suggessionTexView.text = ""
            suggessionTexView.textColor = UIColor.black
            suggessionTexView.font = .boldSystemFont(ofSize: 14)

//            eventNameTextField.font = UIFont(name: "verdana", size: 14.0)
        }
        

    }
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        print("textViewShouldBeginEditing")
        
        
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
                    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupTextViewAccessoryView()
        
        if(suggessionTexView.text == strTextViewPlaceholder)
        {
            suggessionTexView.text = ""
            suggessionTexView.textColor = UIColor.black
            suggessionTexView.font = .boldSystemFont(ofSize: 14)

        }
       
        
        
       
        
        
        return true
    }
    
    func setupTextViewAccessoryView() {
        
        print("setupTextViewAccessoryView")
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton))
        doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        toolBar.items = [flexsibleSpace, doneButton]
        suggessionTexView.inputAccessoryView = toolBar
        
        
       
        
        
       
        
    }
    
    @objc func didPressDoneButton(button: UIButton) {
        
        print("didPressDoneButton")
        
        if( suggessionTexView.text == "" ||  suggessionTexView.text!.count == 0 || ( suggessionTexView.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            suggessionTexView.text = strTextViewPlaceholder
            suggessionTexView.textColor = UIColor.black
        }
        suggessionTexView.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == mobileNumberTextfld{
            
            return range.location <= 9
            
        }else{
            
            return true
            
        }
     
    }
}
