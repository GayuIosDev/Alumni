//
//  RequestAssistViewController.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import UIKit
import ObjectMapper
import KRProgressHUD



class RequestAssistViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var cancelView: UIView!
    
    @IBOutlet weak var date_Picker: UIDatePicker!
    
    @IBOutlet weak var okView: UIView!
    
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var requestAidView: UIViewX!
    
    @IBOutlet weak var apiResponseLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var gifImg: UIImageView!
    @IBOutlet weak var apiOkView: UIView!
    
    @IBOutlet weak var alertView: UIView!
    var token : String!
    
    var dateText : String!  = ""
    
    var timeText : String! = ""
    
    
    var display_date : String!
    var url_date : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateView.isHidden = true

        overrideUserInterfaceStyle = .light

        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
        print("TokenExp",TokenExp)
        if TokenExp == "401" {
            var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                print("Handle Ok logic here")
                print("tokenn",token)
                print("token",token)
                
                
                UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
                
                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                self.present(viewController, animated: true)
                
            
                                                 }))
            
            
            
            present(refreshAlert, animated: true, completion: nil)
            
        }
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)

        
        let dateGesture = UITapGestureRecognizer(target: self, action: #selector(pickCalendar))
        calendarView.addGestureRecognizer(dateGesture)
        
        
        let timeGesture = UITapGestureRecognizer(target: self, action: #selector(pickTime))
        timeView.addGestureRecognizer(timeGesture)
        
        
        
        let okGesture = UITapGestureRecognizer(target: self, action: #selector(clickOk))
        apiOkView.addGestureRecognizer(okGesture)
        
        alertView.isHidden = true
        
        
        titleTextField.delegate = self
        descTextView.delegate = self
        
        let createAssistGesture  = UITapGestureRecognizer(target: self, action: #selector(createAssistReq))
        requestAidView.addGestureRecognizer(createAssistGesture)
        // Do any additional setup after loading the view.
    }
    
    
  
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text == "\n" {
            descTextView.resignFirstResponder()
            
//            descTextView.text = "Description"
//            descTextView.textColor = UIColor.lightGray
//
//            descTextView.selectedTextRange = descTextView.textRange(from: descTextView.beginningOfDocument, to: descTextView.beginningOfDocument)
//            descTextView.resignFirstResponder()
//             return false
//        return false
    }
    return true
    }

    @IBAction  func createAssistReq() {
        
        
        print("tokenn",token)
      
      
        
        
        
        if titleTextField.text != "" && descTextView.text != "" && dateLbl.text != "Select validity Date" && timeLbl.text != "Select time"   {
            var validateDate : String!
            
            KRProgressHUD.show()
            
            var dates : String = dateText
            var times : String =  timeText
            validateDate = dates  +  times
            
            let createAssistReqModal = CreateAssistModal()
            
            createAssistReqModal.title = titleTextField.text
            createAssistReqModal.description = descTextView.text
            createAssistReqModal.validity_date = validateDate
            
            
            
            
            
            
            var  createAssistReqModalStr = createAssistReqModal.toJSONString()
            print("createAssistReqModal",createAssistReqModal.toJSON())
            CreateAssistRequest.call_request(param: createAssistReqModalStr!, token: token) {
                
                [self] (res) in
                
                let ceateAssistRes : CreateAssistResponse = Mapper<CreateAssistResponse>().map(JSONString: res)!
                
                
                if ceateAssistRes.status == true {
                    
//                
                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                    viewController.alertShowType = 1
                    viewController.gifImage = "success"
                    viewController.messageResponse = ceateAssistRes.message
                    
//                    ceateAssistRes.status
                    
                    
                    KRProgressHUD.dismiss()
                    self.present(viewController, animated: true)
                    
                }else{
                    
                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                    viewController.alertShowType = 1
                    viewController.gifImage = "failure"
                    viewController.messageResponse = ceateAssistRes.message
                    KRProgressHUD.dismiss()
                    self.present(viewController, animated: true)
//
                }
                
                
                
            }
            
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
 
    
    
    
    
    @IBAction func clickOk() {
        
                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController

                    self.present(viewController, animated: true)
        
    }
    @IBAction func pickCalendar() {
        
        var todaysDate = NSDate()
       

        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date,style: .Inline, didSelectDate: {[weak self] (today_date) in
            
            self?.display_date = today_date.dateString("dd-MM-yyyy")
            self?.url_date = today_date.dateString("yyyy-MM-dd")
            self?.dateLbl.text = "Validity Date :" + self!.display_date
            self?.dateText = self!.display_date

            self?.dateLbl.textColor = .black
           })
        
        
        
        
        
        
      
    
    }
    
    @IBAction func pickTime() {

        
        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
            
//            selectedDate.dateString.locale = Locale.init(identifier: "en_US_POSIX")
//            let loc = Locale(identifier: "uk")
//            self.datePicker.locale = loc
            
          
            self?.display_date = today_date.dateString("hh:mm:a")
//            self?.url_date = selectedDate.dateString("hh:mm:a")

            self?.timeLbl.text = "Validity Time :" + today_date.dateString("hh:mm:a")
//            self?.timeText = self!.display_date
          print("self!.display_date",self!.display_date)
            self?.timeLbl.textColor = .black
           })
    
    }
    
    
    @IBAction func datePickAction(_ sender: Any) {
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("false")



        //
        if descTextView.text == "" {
            descTextView.text = "Description"
            descTextView.textColor = UIColor.black
            descTextView.font = UIFont(name: "verdana", size: 13.0)
//            let selectRecpient = UITapGestureRecognizer(target: self, action: #selector(SelectRepVc))
//            selectRecipientsView.addGestureRecognizer(selectRecpient)

        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        if descTextView.text == "Description" {
            descTextView.text = ""
            descTextView.textColor = UIColor.black
            descTextView.font = UIFont(name: "verdana", size: 14.0)
        }
    }
    
}
