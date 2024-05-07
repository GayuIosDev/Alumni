//
//  RateUSViewController.swift
//  VsAlumni
//
//  Created by admin on 11/04/24.
//

import UIKit
import FirebaseCoreInternal
import ObjectMapper

class RateUSViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var appricationLbl: UILabel!
    @IBOutlet weak var btnview5: UIButton!
    @IBOutlet weak var btnview4: UIButton!
    @IBOutlet weak var btnview3: UIButton!
    @IBOutlet weak var SecondView: UIView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var tenLblHeight: NSLayoutConstraint!
    @IBOutlet weak var NineLblHeight: NSLayoutConstraint!
    @IBOutlet weak var btnview10: UIButton!
    @IBOutlet weak var btnview9: UIButton!
    @IBOutlet weak var btnview8: UIButton!
    @IBOutlet weak var btnview7: UIButton!
    @IBOutlet weak var btnview6: UIButton!
    @IBOutlet weak var namebtn2: UIButton!
    @IBOutlet weak var btnname1s: UIButton!
    @IBOutlet weak var btnView1: UIButton!
    @IBOutlet weak var lbl10: UILabel!
    @IBOutlet weak var lbl9: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var Lbl3: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var Lbl1: UILabel!
    @IBOutlet weak var suggessionTexView: UITextView!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var viewss: UIView!
    private var selectedRate: Int = 0
    
    @IBOutlet weak var submitView: UIViewX!
    /// Adding a Selection Feedback effect to clicking on a star
    private let feedbackGenerator = UISelectionFeedbackGenerator()
    
    @IBOutlet weak var sevenView: UIViewX!
    
    @IBOutlet weak var tenView: UIViewX!
    @IBOutlet weak var nineView: UIViewX!
    @IBOutlet weak var eightView: UIViewX!
    @IBOutlet weak var sixView: UIViewX!
    @IBOutlet weak var fiveView: UIViewX!
    @IBOutlet weak var fourview: UIViewX!
    @IBOutlet weak var threeView: UIViewX!
    @IBOutlet weak var twoview: UIViewX!
    @IBOutlet weak var oneView: UIViewX!
    var token : String!
    var DataDetails : [rateDataDetails] = []
    
    var input_content : [String] = []
    
    var starId  = 0
    
    var ReflabelName : [String] = []
    
    
    var strTextViewPlaceholder = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        strTextViewPlaceholder = "Write your suggestions"
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        self.suggessionTexView.layer.borderColor = UIColor.lightGray.cgColor
        self.suggessionTexView.layer.borderWidth = 1
        self.suggessionTexView.layer.cornerRadius = 5
        
        rateusApi()
        addDoneButtonOnKeyboard()
        let back1 = UITapGestureRecognizer(target: self, action: #selector(backVC))
        back.addGestureRecognizer(back1)
        

        
        let submitss = UITapGestureRecognizer(target: self, action: #selector(RateUsSubmit))
        submitView.addGestureRecognizer(submitss)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        

        SecondView.isHidden = true
        submitView.isUserInteractionEnabled = false
        submitView.backgroundColor = UIColor.lightGray
            
        nineView.isHidden = true
        tenView.isHidden =  true

        appricationLbl.isHidden = true
        
        suggessionTexView.delegate = self
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
   
        
        }

    @objc func doneButtonAction(){
        suggessionTexView.resignFirstResponder()
         
           
        }
    
    @objc func RateUsSubmit(){
        
        
        
                    var refreshAlert = UIAlertController(title: "Alert", message: "Are you sure want to submit", preferredStyle: UIAlertController.Style.alert)
        
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
        
                        let  ratesub = rateSubMitModal()
                         
                         
                         ratesub.start_rating = starId
                         ratesub.input_content = ReflabelName
                         ratesub.suggestion_content = suggessionTexView.text
                         
                         let  ratesubStr = ratesub.toJSONString()
                         
                         print("alumniInstituteModalStr",ratesub.toJSON())
                         
                         
                         
                         
                         
                         
                         
                         print("token",token)
                         
                         
                         
                         
                         RateRequ.call_request(param: ratesubStr!,token: token) {
                             
                             
                             
                             
                             [self] (res) in
                             
                             
                             
                             let schoolRegRes : feedResp = Mapper<feedResp>().map(JSONString: res)!
                             
                             
                             
                             
                             
                             if schoolRegRes.status == true {
                                 
                                 
                                 
                                 
                                 var refreshAlert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
                     
                                 refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                                     dismiss(animated: true)
                                     
                                 }))
                                 
                                 present(refreshAlert, animated: true, completion: nil)
                                 
//                                 let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//                                 alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                                 self.present(alert, animated: true, completion: nil)
//                             
//                         dismiss(animated: true)
                                 
                             }else{
                                 
                                 
                                 
                                 
                             }
                             
                             
                         }
        
                    }))
        
        
                  
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
     
        
    }
    
    func ratingsApi(){
        
        
        print("starIdstarIdstarId",starId)
        
        
        
        
        
        for i in DataDetails{
            
            if i.rating == starId{
                
                SecondView.isHidden = false
                appricationLbl.isHidden = false
                appricationLbl.text = i.content
                if i.input_content.count == 10{
                    
                    nineView.isHidden = false
                    tenView.isHidden =  false
                    NineLblHeight.constant = 30
                    tenLblHeight.constant = 30

                    Lbl1.text = i.input_content[0]
                    lbl2.text = i.input_content[1]
                    Lbl3.text = i.input_content[2]
                    lbl4.text = i.input_content[3]
                    lbl5.text = i.input_content[4]
                    lbl6.text = i.input_content[5]
                    lbl7.text = i.input_content[6]
                    lbl8.text = i.input_content[7]
                    lbl9.text = i.input_content[8]
                    lbl10.text = i.input_content[9]
                    
                }
                
                
                else {
                    
                    
                    nineView.isHidden = true
                    tenView.isHidden =  true
                    NineLblHeight.constant = 0
                    tenLblHeight.constant = 0

                    Lbl1.text = i.input_content[0]
                    lbl2.text = i.input_content[1]
                    Lbl3.text = i.input_content[2]
                    lbl4.text = i.input_content[3]
                    lbl5.text = i.input_content[4]
                    lbl6.text = i.input_content[5]
                    lbl7.text = i.input_content[6]
                    lbl8.text = i.input_content[7]
                    
                }
                
//                for zz in i.input_content{
               
//                }
                        
                
            }
            
        }
        
        
    }
    
    
    @IBAction func btn1s(_ sender: Any) {
        
        if btn1.isSelected == true{
            
            btn1.isSelected = false
            
            print("btn1False")
         
            btn1.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn2.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn3.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn4.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn5.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            
            starId = 0
            SecondView.isHidden = true
            
            
            submitView.isUserInteractionEnabled = false
            
            submitView.backgroundColor = UIColor.lightGray
            
            appricationLbl.isHidden = true
            
            oneView.backgroundColor = UIColor.white
            twoview.backgroundColor = UIColor.white
            threeView.backgroundColor = UIColor.white
            fourview.backgroundColor = UIColor.white
            fiveView.backgroundColor = UIColor.white
            sixView.backgroundColor = UIColor.white
            sevenView.backgroundColor = UIColor.white
            eightView.backgroundColor = UIColor.white
            nineView.backgroundColor = UIColor.white
            tenView.backgroundColor = UIColor.white
            
            
            if ReflabelName.count == 0{
                
                
            }else{
                
                
                ReflabelName.removeAll()
                
            }
            
        }
        else{
            
            starId = 1
            print("btn1true",btn2.isSelected)
            btn1.isSelected = true
            btn2.isSelected = false
            btn3.isSelected = false
            btn4.isSelected = false
            btn5.isSelected = false
//            btn1.isSelected
            
            submitView.isUserInteractionEnabled = true
            submitView.backgroundColor = UIColor(named: "ClrRegister")
            
            btn1.setImage(UIImage(named: "icon_filled_star"), for: .normal)
           
        
            
            
            ratingsApi()
            
           
            
            
            
            
        }
        
        
        
    }
    
    
    @IBAction func btn2s(_ sender: Any) {
        if btn2.isSelected == true{
            
            btn2.isSelected = false
            
            print("btn2False")
         
            btn2.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn3.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn4.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn5.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            
        }
        else{
            
            print("btn2true")
            
            starId = 2
            btn2.isSelected = true
            
//            btn1.isSelected
            btn2.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn1.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            submitView.backgroundColor = UIColor(named: "ClrRegister")
            
            ratingsApi()
        }
        
        
    }
    
    
    @IBAction func btn3s(_ sender: Any) {
        
        if btn3.isSelected == true{
            
            btn3.isSelected = false
            
            
            print("btn3false")
            btn3.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn4.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn5.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            
        }
        else{
            print("btn3true")
            
            starId = 3
            btn3.isSelected = true
//            btn1.isSelected
            btn3.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn2.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn1.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            
            submitView.backgroundColor = UIColor(named: "ClrRegister")
            
            ratingsApi()
          
        }
    }
    

    
    @IBAction func btn4s(_ sender: Any) {
        
        if btn4.isSelected == true{
            
            btn4.isSelected = false
            
            
            print("btn4false")
          
            btn4.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            btn5.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            
        }
        else{
            print("btn4true")
            
            starId = 4
            btn4.isSelected = true
//            btn1.isSelected
            btn4.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn3.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn2.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn1.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            submitView.backgroundColor = UIColor(named: "ClrRegister")
            ratingsApi()
          
        }
    }
    
    @IBAction func btn5s(_ sender: Any) {
        
        
        
        if btn5.isSelected == true{
            
            btn5.isSelected = false
            
            
            print("btn4false")
          
           
            btn5.setImage(UIImage(named: "icon_unfilled_star"), for: .normal)
            
        }
        else{
            print("btn4true")
            
            starId = 5
            btn5.isSelected = true
//            btn1.isSelected
            btn5.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn4.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn3.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn2.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            btn1.setImage(UIImage(named: "icon_filled_star"), for: .normal)
            submitView.backgroundColor = UIColor(named: "ClrRegister")
            ratingsApi()
          
        }
    }
    
    
    
    
    
  
    
    
    
    @IBAction func backVC() {
        
        dismiss(animated: true)
       
    }
    
    
    
    @IBAction func nameBtn1(_ sender: Any) {
        
        
        
        
        
      
        if btnname1s.isSelected == true{
            
            btnname1s.isSelected = false
         
         
            
            oneView.backgroundColor = UIColor.white
            Lbl1.textColor = .black
            ReflabelName = ReflabelName.filter { $0 != Lbl1.text! }
            
            print("removeddaryy",ReflabelName)
        }
        else{
            ReflabelName.append(Lbl1.text!)
            
            print("Addddddddddd",ReflabelName)
            btnname1s.isSelected = true
            
            oneView.backgroundColor = UIColor(named: "ratingColor")
            Lbl1.textColor = .white
          
        }
        
    }
    
    @IBAction func btnNameLbl7(_ sender: Any) {
        
        if btnview7.isSelected == true{
            
            btnview7.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl7.text! }
            sevenView.backgroundColor = UIColor.white
            lbl7.textColor = .black
        }
        else{
            
            btnview7.isSelected = true
            ReflabelName.append(lbl7.text!)
            sevenView.backgroundColor = UIColor(named: "ratingColor")
            
            lbl7.textColor = .white
            
            
           
        }
    }
    @IBAction func btnNameLbl6(_ sender: Any) {
        
        
        if btnview6.isSelected == true{
            
            btnview6.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl6.text! }
            sixView.backgroundColor = UIColor.white
            lbl6.textColor = .black
        }
        else{
            
            btnview6.isSelected = true
            ReflabelName.append(lbl6.text!)
            sixView.backgroundColor = UIColor(named: "ratingColor")
            
            lbl6.textColor = .white
            
            
            
        }
    }
    
    @IBAction func btnNameLbl5(_ sender: Any) {
       
        
        if btnview5.isSelected == true{
            
            btnview5.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl5.text! }
            fiveView.backgroundColor = UIColor.white
            lbl5.textColor = .black
        }
        else{
            ReflabelName.append(lbl5.text!)
            btnview5.isSelected = true
            
            fiveView.backgroundColor = UIColor(named: "ratingColor")
            
            lbl5.textColor = .white
            
           
        }
        
    }
    @IBAction func btnNameLbl4(_ sender: Any) {
        
        
        
        if btnview4.isSelected == true{
            
            btnview4.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl4.text! }
            fourview.backgroundColor = UIColor.white
            lbl4.textColor = .black
            
        }
        else{
            
            btnview4.isSelected = true
            ReflabelName.append(lbl4.text!)
            fourview.backgroundColor = UIColor(named: "ratingColor")
            
            
            lbl4.textColor = .white
            
           
        }
        
        
    }
    @IBAction func btnNameLbl3(_ sender: Any) {
        
        if btnview3.isSelected == true{
            
            btnview3.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != Lbl3.text! }
            threeView.backgroundColor = UIColor.white
            Lbl3.textColor = .black
        }
        else{
            
            btnview3.isSelected = true
            ReflabelName.append(Lbl3.text!)
            threeView.backgroundColor = UIColor(named: "ratingColor")
            
            
            
            Lbl3.textColor = .white
            
           
        }
    }
    
    @IBAction func btnNameLbl2(_ sender: Any) {
        
        if namebtn2.isSelected == true{
            
            namebtn2.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl2.text! }
            twoview.backgroundColor = UIColor.white
            lbl2.textColor = .black
        }
        else{
            
            namebtn2.isSelected = true
            ReflabelName.append(lbl2.text!)
            twoview.backgroundColor = UIColor(named: "ratingColor")
            
            lbl2.textColor = .white
            
          
            
           
          
           
        }
    }
    
    
    @IBAction func btnnamelbl8(_ sender: Any) {
        
        
        
        if btnview8.isSelected == true{
            
            btnview8.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl8.text! }
            eightView.backgroundColor = UIColor.white
            lbl8.textColor = .black
        }
        else{
            
            btnview8.isSelected = true
            ReflabelName.append(lbl8.text!)
            eightView.backgroundColor = UIColor(named: "ratingColor")
            lbl8.textColor = .white
          
            
        }
    }
    
    
    
    
    @IBAction func btnNameLbl9(_ sender: Any) {
        
        if btnview9.isSelected == true{
            
            btnview9.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl9.text! }
            nineView.backgroundColor = UIColor.white
            lbl9.textColor = .black
        }
        else{
            
            btnview9.isSelected = true
            ReflabelName.append(lbl9.text!)
            nineView.backgroundColor = UIColor(named: "ratingColor")
            lbl9.textColor = .white
           
            
        }
        
        
    }
    
    
    @IBAction func btnNamelbl10(_ sender: Any) {
        
        if btnview10.isSelected == true{
            
            btnview10.isSelected = false
         
            print("this is color")
            ReflabelName = ReflabelName.filter { $0 != lbl10.text! }
            tenView.backgroundColor = UIColor.white
            lbl10.textColor = .black
        }
        else{
            
            btnview10.isSelected = true
            ReflabelName.append(lbl10.text!)
            tenView.backgroundColor = UIColor(named: "ratingColor")
            lbl10.textColor = .white
            
        }
    }
    
    
    func rateusApi(){
        
        input_content.removeAll()
        RateRequest.call_request(token: token){ [self]
            (res) in
    
    
            let AlumniGalleryModalRes : rateResp = Mapper<rateResp>().map(JSONString: res)!
    
            if Constant.DefaultsKeys.TokenExpire == 401{
    
    
    
    
                var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)
    
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
    
                    PreferencesUtil.removePrefs(key: Constant.LoginResponse)
    
                    UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
    
                    let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                    self.present(viewController, animated: true)
    
    
                }))
    
    
                present(refreshAlert, animated: true, completion: nil)
    
    
    
            }
    
    
            else{
    
                if AlumniGalleryModalRes.status == true {
    
    
                    DataDetails =  AlumniGalleryModalRes.data
                    
                    for i in AlumniGalleryModalRes.data{
//                        input_content.append(contentsOf: i.input_content)
                        
//                        i.
                        
//                        
//                        for zz in i.input_content{
//                            
//                            input_content.append(zz)
//                            
//                              
//                            
//                         
//                        }
                        
                    }
                    
                    
              
    
                }else{
    
    
                
                }
    
    
    
            }
        }
        
        
    }
    
    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {

       
        if suggessionTexView.text == strTextViewPlaceholder{
            suggessionTexView.text = ""
            suggessionTexView.textColor = UIColor.black
            suggessionTexView.font = .boldSystemFont(ofSize: 14)

//            eventNameTextField.font = UIFont(name: "verdana", size: 14.0)
        }
        

    }
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
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
        if( suggessionTexView.text == "" ||  suggessionTexView.text!.count == 0 || ( suggessionTexView.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            suggessionTexView.text = strTextViewPlaceholder
            suggessionTexView.textColor = UIColor.black
        }
        suggessionTexView.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
    
    
    

    
}

