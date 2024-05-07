//
//  StepThreeViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit
import ObjectMapper
import Foundation
import SystemConfiguration

class StepThreeViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {
   
    
    @IBOutlet weak var step3Lbl: UILabel!
    
    @IBOutlet weak var stepthreeView: UIView!
    
    @IBOutlet weak var dummyUpdateView: UIView!
    
    @IBOutlet weak var nextLbl: UILabel!
    @IBOutlet weak var step3Btn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var maritalStatusLbl: UILabel!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var currentDesignationTextField: UITextField!
    @IBOutlet weak var nextView: UIView!
    
    
    @IBOutlet weak var addCompanyView: UIViewX!
    
    var getIp : String!
    
    var companyListArr : [ProfessionalCompanyLists] = []
    
    var rowListId = [1]
    let rowId  = "ProfessionalTableViewCell"
    var companyNameText : String!
    var deignationText : String!
    var yesNoText : Int! = 0
    var token : String!
    
    
    var ChangeProfessionalDetail : Int!
    var changeProfionalData : [ProfileGetProfessionalDetail] = []
    
    var companyNameArr : [String] = []
    var designationNameArr : [String] = []

    var existingCompanyNameArr : [String] = []
    var existingdesignationNameArr : [String] = []
    var yesNoArr : [String] = []
    var mobileNumber : String!
    
    var refer : [ProfessionalModalDataDetailCompanyLists] = []
    var refer2 : [ProfessionalModalDataDetailCompanyLists] = []
    var idss : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        backView.isHidden = true
        overrideUserInterfaceStyle = .light

//        stateTextField.delegate = self
//        currentDesignationTextField.delegate = self
//        countryTextField.delegate = self
//        companyNameTextField.delegate = self
//        
       
      
        
        tv.alwaysBounceVertical = true
        
        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIp = addr
            
        } else {
            print("No WiFi address")
        }
        
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        mobileNumber = defaults.string(forKey: Constant.DefaultsKeys.MobileNumber)
print("token",token)
       
        if ChangeProfessionalDetail == 1 {
            getProfessional()
            step3Btn.isHidden = true
            stepthreeView.isHidden = true
            step3Lbl.isHidden = true
            backView.isHidden = false
            nextLbl.text = "UPDATE"
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        
       
        tv.register(UINib(nibName: rowId, bundle: nil), forCellReuseIdentifier: rowId)
        tv.dataSource = self
        tv.delegate = self
        
    }
    
    
    @IBAction func skipAction(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
//        viewController.memberType = memType
        self.present(viewController, animated: true)
      
//            let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
//            let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
//            self.present(viewController, animated: true)
        
    }
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-91
                print("keyboardSize.height",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    
    
    
    
   
    
    
    
    
    
    @IBAction func getProfessional() {
            
            
         
            print("token",token)
        ProfileGetProfessionalRequest.call_request(token: token){ [self]
                (res) in
                
                let getProfessionalRes : GetProfessionalDetails = Mapper<GetProfessionalDetails>().map(JSONString: res)!
                
                if getProfessionalRes.status == true {
                    
                    
                    changeProfionalData = getProfessionalRes.getProfessionalData
                    tv.dataSource = self
                    tv.delegate  .self
                    
                    tv.reloadData()
//                    contributeSupportData = contributeModalRes.data
//                    
//                    for i in contributeModalRes.data {
//                        supportStr.append(i.supportName)
//                    }
    //                AlumniGalleryData = contributeModalRes.data
    //                for i in AlumniGalleryModalRes.data {
    //                    dropdownLbl.text = i.institute_name
    //
    //                    dropDownInstiId = i.institute_id
    //                }
    //                instituteId = dropDownInstiId
    //                getInstituteGalleryList()
    //
    //                cv.isHidden = false
    //                cv.dataSource = self
    //                cv.delegate = self
    //                cv.reloadData()
                    
    //            }else{
    //                let alert = UIAlertController(title: "Alert", message: contributeModalRes.message, preferredStyle: UIAlertController.Style.alert)
    //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    //                self.main.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
        }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Did select Not working")
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! ProfessionalTableViewCell
//        
//        
//        
//        
//        
//        
//        let professional : ProfileGetProfessionalDetail = changeProfionalData[indexPath.row]
//
//        
//
////        cell.companyName.text = professional.company_name
////
////        cell.desingnationTextField.text = professional.designation
//
//
//        print("cell.companyName",cell.companyName.text)
//        print("cell.desingnationTextField",cell.desingnationTextField.text)
        
       
        
        
        
    }
    
    @IBAction func dummyUpdate( ges : checkBoxGesture) {
        tv.dataSource = self
        tv.reloadData()
        print("23456789")
        print("ges.companyName",ges.curCompany)
        print("ges.desingnationTextField",ges.curDesign)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tv.dataSource = self
//        tv.delegate = self
    }
    
    
    @IBAction func nextVc() {

            

           

        if ChangeProfessionalDetail == 1 {
            
            
            
            if idss == "1"{
                
                
                
                
                var aryy :  [ProfessionalCompanyLists] = []
                
                
                print("yesNoText123",yesNoText)
                
                //                            for i in 0..<refer2.count{
                //
                //
                //
                //                                let companyListModal = ProfessionalCompanyLists ()
                //
                //
                //
                //                                companyListModal.company_name = refer2[i].company_name
                //
                //                                companyListModal.currently_working = yesNoText
                //
                //                                companyListModal.designation = refer2[i].designation
                //
                //
                //
                //                                aryy.append(companyListModal)
                //
                //                            }
                
                
                
                
                for (comName, desgName) in zip(existingCompanyNameArr, existingdesignationNameArr) {
                    print("Element from comName:", comName)
                    print("Element from desgName:", desgName)
                    
                    let companyListModal = ProfessionalCompanyLists ()
                    
                    
                    companyListModal.company_name = comName
                    companyListModal.designation = desgName
                    companyListModal.currently_working = yesNoText
                    //
                    //                    companyListModal.designation = refer2[i].designation
                    //
                    //
                    
                    print("companyListModal",companyListModal)
                    companyListArr.append(companyListModal)
                }
                
                let professionalModal = AlumniProfessionalDetailsModal ()
                
                professionalModal.company_lists = companyListArr
                
                
                
                let professionalModalStr = professionalModal.toJSONString()
                
                
                
                print("alumniProfessionRes2",professionalModal.toJSON())
                
                
                
                UpdateAlumniProfessionalDetail.call_request(param: professionalModalStr!,token: token) {
                    
                    //            UpdateAlumniProfessionalDetailRequest
                    
                    [self] (res) in
                    
                    
                    
                    let alumniProfessionRes : AlumniProfessionalDetailsResponse = Mapper<AlumniProfessionalDetailsResponse>().map(JSONString: res)!
                    
                    
                    
                    
                    
                    if alumniProfessionRes.status == true {
                        
                        
                        
                        let loginModal = LoginCredentialModal()
                        
                        
                        
                        loginModal.user_name = mobileNumber
                        
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
                                    
                                    
                                }
                                
                                //                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                //
                                //                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                //
                                //                                    self.present(viewController, animated: true)
                                //
                                //                                    //                    }
                                //
                                //                                    //                }
                                
                                
                                
                                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                viewController.alertShowType = 1
                                viewController.gifImage = "success"
                                viewController.messageResponse = loginRes.message
                                
                                viewController.EventRedirect = "CHANGE PROFESSIONAL"
                                //                            KRProgressHUD.dismiss()
                                self.present(viewController, animated: true)
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            }else{
                                
                                let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                                
                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                            
                            
                            
                            
                            
                        }
//                        //                        //
//                        //                        //
//                        //                        //
//                        //                        //            //                                let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
//                        //                        //
//                        //                        //            //                                let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
//                        //                        //
//                        //                        //            //                                viewController.type = "Alumni"
//                        //                        //
//                        //                        //            //                                viewController.token = token
//                        //                        //
//                        //                        //            //                                self.present(viewController, animated: true)
//                        //                        //
//                        //                        //
//                        //                        //
//                        //                        //                        }else{
//                        //                        //
//                        //                        //                            let alert = UIAlertController(title: "Alert", message: alumniProfessionRes.message, preferredStyle: UIAlertController.Style.alert)
//                        //                        //
//                        //                        //                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        //                        //
//                        //                        //                            self.present(alert, animated: true, completion: nil)
//                        //                        //
//                        //                    }
//                        //                    //
//                        //                    //
//                        //                    //
//                        //                    //
//                        //                    //
//                        //                }
//                        
                    }
//                    
                }
                    
                }
                    else{
                        
                        
                        
                        var aryy :  [ProfessionalCompanyLists] = []
                        
                        
                        
                        
                        
                        //                            for i in 0..<refer2.count{
                        //
                        //
                        //
                        //                                let companyListModal = ProfessionalCompanyLists ()
                        //
                        //
                        //
                        //                                companyListModal.company_name = refer2[i].company_name
                        //
                        //                                companyListModal.currently_working = refer2[i].currently_working
                        //
                        //                                companyListModal.designation = refer2[i].designation
                        //
                        //
                        //
                        //                                aryy.append(companyListModal)
                        //
                        //                            }
                        //
                        //
                        
                        for (comName, desgName) in zip(existingCompanyNameArr, existingdesignationNameArr) {
                            print("Element from comName:", comName)
                            print("Element from desgName:", desgName)
                            
                            let companyListModal = ProfessionalCompanyLists ()
                            
                            
                            companyListModal.company_name = comName
                            companyListModal.designation = desgName
                            companyListModal.currently_working = yesNoText
                            //
                            //                    companyListModal.designation = refer2[i].designation
                            //
                            //
                            
                            print("companyListModal",companyListModal)
                            companyListArr.append(companyListModal)
                        }
                        
                        
                        
                        let professionalModal = AlumniProfessionalDetailsModal ()
                        
                        professionalModal.company_lists = companyListArr
                        
                        
                        
                        let professionalModalStr = professionalModal.toJSONString()
                        
                        
                        
                        print("alumniProfessionRes3",professionalModal.toJSON())
                        
                        
                        
                        UpdateAlumniProfessionalDetail.call_request(param: professionalModalStr!,token: token) {
                            
                            //            UpdateAlumniProfessionalDetailRequest
                            
                            [self] (res) in
                            
                            
                            
                            let alumniProfessionRes : AlumniProfessionalDetailsResponse = Mapper<AlumniProfessionalDetailsResponse>().map(JSONString: res)!
                            
                            
                            
                            
                            
                            if alumniProfessionRes.status == true {
                                
                                
                                
                                let loginModal = LoginCredentialModal()
                                
                                
                                
                                loginModal.user_name = mobileNumber
                                
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
                                            
                                            
                                            
                                        }
                                        
                                        
                                        let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                        let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                        viewController.alertShowType = 1
                                        viewController.gifImage = "success"
                                        viewController.messageResponse = loginRes.message
                                        
                                        viewController.EventRedirect = "CHANGE PROFESSIONAL"
                                        //                            KRProgressHUD.dismiss()
                                        self.present(viewController, animated: true)
                                        
                                        //
                                        
                                        
                                        //                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                                        //
                                        //                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                                        //
                                        //                                    self.present(viewController, animated: true)
                                        //
                                        //                                    //                    }
                                        //
                                        //                                    //                }
                                        //
                                        //
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    }else{
                                        
                                        let alert = UIAlertController(title: "Alert", message: loginRes.message, preferredStyle: UIAlertController.Style.alert)
                                        
                                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                        
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                }
//                                //                        //
//                                //                        //
//                                //                        //
//                                //                        //            //                                let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
//                                //                        //
//                                //                        //            //                                let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
//                                //                        //
//                                //                        //            //                                viewController.type = "Alumni"
//                                //                        //
//                                //                        //            //                                viewController.token = token
//                                //                        //
//                                //                        //            //                                self.present(viewController, animated: true)
//                                //                        //
//                                //                        //
//                                //                        //
//                                //                        //                        }else{
//                                //                        //
//                                //                        //                            let alert = UIAlertController(title: "Alert", message: alumniProfessionRes.message, preferredStyle: UIAlertController.Style.alert)
//                                //                        //
//                                //                        //                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                                //                        //
//                                //                        //                            self.present(alert, animated: true, completion: nil)
//                                //                        //
//                                //                        //                        }
//                                //                        //
//                                //                        //
//                                //                        //
//                                //                        //
//                                //                        //
//                                //                        //                    }
//                                //
//                                //
//                                //
//                                //
//                                //
//                                //                    }
//                                //
//                                //
//                                //
//                                //
//                                //
//                                //
//                                //
//                                //
//                                //
                            }
//                            
                        }
                        
                    }
                }

            else{

                

                

                var aryy :  [ProfessionalCompanyLists] = []

                

                
//
//                for i in 0..<refer.count{
//
//                    
//
//                    let companyListModal = ProfessionalCompanyLists ()
//
//                    
//
//                    companyListModal.company_name = refer[i].company_name
//
//                    companyListModal.currently_working = refer[i].currently_working
//
//                    companyListModal.designation = refer[i].designation
//
//                    
//
//                    aryy.append(companyListModal)
//
//                }
//
//                
                
                
//                for i in 0..<companyNameArr.count{
//
//                    
//
                  print("1companyNameArrcompanyNameArr",companyNameArr)
//
                
                
                for (comName, desgName) in zip(companyNameArr, designationNameArr) {
                    print("Element from comName:", comName)
                    print("Element from desgName:", desgName)
                    
                    let companyListModal = ProfessionalCompanyLists ()

                    
                    companyListModal.company_name = comName
                    companyListModal.designation = desgName
                    companyListModal.currently_working = yesNoText
//
//                    companyListModal.designation = refer2[i].designation
//
//
                    
                    print("companyListModal",companyListModal)
                    companyListArr.append(companyListModal)
                }
                
 
                

                let professionalModal = AlumniProfessionalDetailsModal ()

                professionalModal.company_lists = companyListArr

                

                let professionalModalStr = professionalModal.toJSONString()

                

                print("alumniProfessionRes1",professionalModalStr)

                

                AlumniProfessionalDetailRequest.call_request(param: professionalModalStr!,token: token) {

                    //            UpdateAlumniProfessionalDetailRequest

                    [self] (res) in

                    

                    let alumniProfessionRes : AlumniProfessionalDetailsResponse = Mapper<AlumniProfessionalDetailsResponse>().map(JSONString: res)!

                    

                    

                    if alumniProfessionRes.status == true {

                        

                        let loginModal = LoginCredentialModal()

                        

                        loginModal.user_name = mobileNumber

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

                            

                            

                        }
//
//                        
//
//                        //                                let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
//
//                        //                                let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
//
//                        //                                viewController.type = "Alumni"
//
//                        //                                viewController.token = token
//
//                        //                                self.present(viewController, animated: true)
//
//                        
//
//                    }else{
//
//                        let alert = UIAlertController(title: "Alert", message: alumniProfessionRes.message, preferredStyle: UIAlertController.Style.alert)
//
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//                        self.present(alert, animated: true, completion: nil)
//
                    }
//
//                    
//
//                    
//
                }

            }

        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ChangeProfessionalDetail == 1 {
            
            if idss == "1"{
                
                return changeProfionalData.count+rowListId.count-1
            }else{
                
                
                return changeProfionalData.count
            }
           
        }else{
            return rowListId.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            

            if ChangeProfessionalDetail == 1 {

                

                

                if idss == "1"{

                    

                    

                    let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! ProfessionalTableViewCell

                    cell.selectionStyle = .none
                    cell.companyName.delegate = self
                    cell.desingnationTextField.delegate = self

                    
                    var comp  : String!
                    var desi : String!
                    
                    comp  = cell.companyName.text
                    
                    desi = cell.desingnationTextField.text
                    
//                    let dymmyGesture = checkBoxGesture(target: self, action: #selector(dummyUpdate))
//                    dymmyGesture.curCompany = comp
//                    dymmyGesture.curCompany = desi
//                    dummyUpdateView.addGestureRecognizer(dymmyGesture)
                    
 
                    

                    let yesGes = checkBoxGesture(target: self, action: #selector(yesAct))

                    yesGes.yesImg = cell.yesImg

                    yesGes.noImg = cell.noImg

                    yesGes.companyName = cell.companyName

                    yesGes.currentDesingnation = cell.desingnationTextField

                    cell.yesView.addGestureRecognizer(yesGes)

          

                    let noGes = checkBoxGesture(target: self, action: #selector(noAct))

                    noGes.noImg = cell.noImg

                    noGes.yesImg = cell.yesImg

                    noGes.companyName = cell.companyName

                    noGes.currentDesingnation = cell.desingnationTextField

                    cell.noView.addGestureRecognizer(noGes)

                    

                    

                    let tapGesture = checkBoxGesture(target: self, action: #selector(nextVc))

                    tapGesture.companyName = cell.companyName

                    tapGesture.currentDesingnation = cell.desingnationTextField

                    nextView.addGestureRecognizer(tapGesture)

                    cell.saveViews.isHidden = true

                    

                    let saveCell = checkBoxGesture(target: self, action: #selector (saveVc))

                    saveCell.companyName = cell.companyName

                    saveCell.currentDesingnation = cell.desingnationTextField

                    cell.saveViews.addGestureRecognizer(saveCell)

                    

                    

                    cell.btns.tag = indexPath.row

                    cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)

                    

                    let addSchoolListGesture = checkBoxGesture(target: self, action: #selector(addRows))

                    addSchoolListGesture.companyName  = cell.companyName

                    addSchoolListGesture.currentDesingnation  = cell.desingnationTextField

                    addCompanyView.addGestureRecognizer(addSchoolListGesture)

                    

                    return cell

                    

                }else{

                    let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! ProfessionalTableViewCell
                    
                    

                    cell.saveViews.isHidden = true
                    cell.selectionStyle = .none
//                    cell.companyName.text = professional.company_name
//
//                    cell.desingnationTextField.text = professional.designation

                  
                    cell.companyName.delegate = self
                    cell.desingnationTextField.delegate = self
                    
                    print("cell.companyName.textelsee",cell.companyName.text)
                    var comp  : String!
                    var desi : String!
                    
                    comp  = cell.companyName.text
                    desi = cell.desingnationTextField.text
                    
//                    let dymmyGesture = checkBoxGesture(target: self, action: #selector(dummyUpdate))
//                    dymmyGesture.curCompany = comp
//                    dymmyGesture.curCompany = desi
//                    dummyUpdateView.addGestureRecognizer(dymmyGesture)
//                    

                    let professional : ProfileGetProfessionalDetail = changeProfionalData[indexPath.row]

                    
                    
                    
                    

                    

                    cell.companyName.text = professional.company_name

                    cell.desingnationTextField.text = professional.designation

                  
                    
                    existingCompanyNameArr.append(professional.company_name)
                    existingdesignationNameArr.append(professional.designation)
                    
print("professional.curently_working",professional.curently_working)
                    if professional.curently_working == 1 {

                        cell.yesImg.image = UIImage(named: "ic_check_box")
                        cell.yesImg.tintColor = UIColor(named: "RegisterColor")

                        cell.noImg.image = UIImage(named: "ic_uncheck_box")
                        cell.noImg.tintColor = UIColor .lightGray
                        

                    }else{

                        cell.noImg.image = UIImage(named: "ic_check_box")
                        cell.noImg.tintColor = UIColor(named: "RegisterColor")

                        cell.yesImg.tintColor = UIColor .lightGray
                        cell.yesImg.image = UIImage(named: "ic_uncheck_box")

                    }

                    

                    

                    cell.RemoveView.isHidden = true

   
                        let modaldata = ProfessionalModalDataDetailCompanyLists()

                        modaldata.company_name = professional.company_name

                    modaldata.currently_working = professional.curently_working

                    modaldata.designation = professional.designation

                        

                        refer2.append(modaldata)


                    let addSchoolListGesture = checkBoxGesture(target: self, action: #selector(addRows))

                    addSchoolListGesture.companyName  = cell.companyName

                    addSchoolListGesture.currentDesingnation  = cell.desingnationTextField

                    addCompanyView.addGestureRecognizer(addSchoolListGesture)

                    

                    let saveCell = checkBoxGesture(target: self, action: #selector (saveVc))

                    saveCell.companyName = cell.companyName

                    saveCell.currentDesingnation = cell.desingnationTextField

                    cell.saveViews.addGestureRecognizer(saveCell)

                    

                    let tapGesture = checkBoxGesture(target: self, action: #selector(nextVc))

                    tapGesture.companyName = cell.companyName

                    tapGesture.currentDesingnation = cell.desingnationTextField

                    nextView.addGestureRecognizer(tapGesture)

                    let yesGes = checkBoxGesture(target: self, action: #selector(yesAct))

                    yesGes.yesImg = cell.yesImg

                    yesGes.noImg = cell.noImg

                    yesGes.companyName = cell.companyName

                    yesGes.currentDesingnation = cell.desingnationTextField

                    cell.yesView.addGestureRecognizer(yesGes)

          

                    let noGes = checkBoxGesture(target: self, action: #selector(noAct))

                    noGes.noImg = cell.noImg

                    noGes.yesImg = cell.yesImg

                    noGes.companyName = cell.companyName

                    noGes.currentDesingnation = cell.desingnationTextField

                    cell.noView.addGestureRecognizer(noGes)

                    

                    return cell

                }

            }else{

                

                let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! ProfessionalTableViewCell


                cell.saveViews.isHidden = true
                if indexPath.row == 0{

                    

                    cell.RemoveView.isHidden = true

                }

                else{

                    

                    cell.RemoveView.isHidden = false

                }

                

                let yesGes = checkBoxGesture(target: self, action: #selector(yesAct))

                yesGes.yesImg = cell.yesImg

                yesGes.noImg = cell.noImg

                yesGes.companyName = cell.companyName

                yesGes.currentDesingnation = cell.desingnationTextField

                cell.yesView.addGestureRecognizer(yesGes)

                let noGes = checkBoxGesture(target: self, action: #selector(noAct))

                noGes.noImg = cell.noImg

                noGes.yesImg = cell.yesImg

                noGes.companyName = cell.companyName

                noGes.currentDesingnation = cell.desingnationTextField

                cell.noView.addGestureRecognizer(noGes)

                

                

                let tapGesture = checkBoxGesture(target: self, action: #selector(nextVc))

                tapGesture.companyName = cell.companyName

                tapGesture.currentDesingnation = cell.desingnationTextField

                nextView.addGestureRecognizer(tapGesture)

                

                

                let saveCell = checkBoxGesture(target: self, action: #selector (saveVc))

                saveCell.companyName = cell.companyName

                saveCell.currentDesingnation = cell.desingnationTextField

                cell.saveViews.addGestureRecognizer(saveCell)

                

                

                cell.btns.tag = indexPath.row

                cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)

                

                let addSchoolListGesture = checkBoxGesture(target: self, action: #selector(addRows))

                addSchoolListGesture.companyName  = cell.companyName

                addSchoolListGesture.currentDesingnation  = cell.desingnationTextField

                addCompanyView.addGestureRecognizer(addSchoolListGesture)

                

                return cell

            }

        }

        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 350
    }
    
    
    @objc func handleRegister(_ sender: UIButton){
            rowListId.remove(at:sender.tag)

   
            if companyListArr.count == 0 {
                
                
            }else{
               
                companyListArr.removeLast()
                
  
               
            }
       tv.deleteRows(at:[IndexPath(row:sender.tag,section:0)],with:.none)
       
        }
    
    @IBAction func saveVc(ges : checkBoxGesture) {
            
        idss = "1"

            //        var  indexsss = rowListId.count

            //

            //

            //        var index = IndexPath(row: indexsss, section: 0)

            //

            //        let cell: ProfessionalTableViewCell = tv.cellForRow(at: index) as! ProfessionalTableViewCell

            //

                

                

                if ges.companyName.text == "Current Designation" && ges.currentDesingnation.text == "Company You are working"{

                    

                    let refreshAlert = UIAlertController(title: "Please enter all field's", message: "", preferredStyle: UIAlertController.Style.alert)

                    

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in

                        

                    }))

                    present(refreshAlert, animated: true, completion: nil)

                    

                    

                   

                }

                

                

                

                else if ges.companyName.text == "" && ges.currentDesingnation.text == ""{

                    

                    let refreshAlert = UIAlertController(title: "Please enter all field's", message: "", preferredStyle: UIAlertController.Style.alert)

                    

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in

                        

                    }))

                    present(refreshAlert, animated: true, completion: nil)

                }

                else{

                    let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)

                    

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in

                        
                        print("modaldatamodaldata53e365e32")
                        print("5678idss",idss)

                        if idss == "1"{

                            
                            print("yesNoText11",yesNoText)
                            let modaldata = ProfessionalModalDataDetailCompanyLists()

                            

                            modaldata.company_name = ges.companyName.text

                            modaldata.designation = ges.currentDesingnation.text

                            modaldata.currently_working = yesNoText
                            print("modaldatamodaldataIDS1",modaldata)
                            print("yesNoText",yesNoText)

                            refer2.append(modaldata)

                        }else{

                            
                            print("yesNoText222",yesNoText)
                            

                            let modaldata = ProfessionalModalDataDetailCompanyLists()

                            

                            modaldata.company_name = ges.companyName.text

                            modaldata.designation = ges.currentDesingnation.text

                            modaldata.currently_working = yesNoText

                            print("modaldatamodaldata",modaldata)
                            refer.append(modaldata)

                        }

                       

                        

                    }))

                    

                    refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in

                        print("Handle Cancel Logic here")

                    }))

                    

                    present(refreshAlert, animated: true, completion: nil)

                    

                    

                    

                }

                    

                    

                    

                    

                    

                }

            

            @IBAction func addRows( ges : checkBoxGesture) {

                idss = "1"

                if ges.companyName.text != ""{

                    

                    if ges.currentDesingnation.text != ""{

                        rowListId += [1]

                        print("rowListId",rowListId)

                        tv.dataSource  = self

                        tv.delegate = self

                        

                        tv.reloadData()

                    }

                }else{

                    let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                    self.present(alert, animated: true, completion: nil)

                }
            
        }
    
    
    
    
    
    @IBAction func yesAct( ges : checkBoxGesture) {
        
        idss = "1"

//        companyNameArr.removeAll()
//        designationNameArr.removeAll()
        ges.yesImg.image = UIImage(named: "ic_check_box")
        ges.yesImg.tintColor = UIColor(named: "RegisterColor")

        
        companyNameText  =  ges.companyName.text
        deignationText = ges.currentDesingnation.text
        
        
        let setWithoutDuplicates = Set(companyNameArr)

        // Convert the set back to an array if needed
        let arrayWithoutDuplicates = Array(setWithoutDuplicates)

        print("arrayWithoutDuplicates",arrayWithoutDuplicates)
        
        
        
        existingCompanyNameArr.append(companyNameText)
        existingdesignationNameArr.append(deignationText)
        
        print("existingCompanyNameArr",existingCompanyNameArr)
        print("existingdesignationNameArr",existingdesignationNameArr)

        companyNameArr.append(companyNameText)
        designationNameArr.append(deignationText)
        print("ges.companyNameStr",ges.companyNameStr)
        print("ges.currentDesingnationStr",designationNameArr)
        print("companyNameArr",companyNameArr)
//        ges.yesNoLbl.text = "1"
        yesNoText = 1
        var yesNoArrStr = "1"
        yesNoArr.append(yesNoArrStr)
        print("yesNoTextValue",yesNoText)
        ges.noImg.image = UIImage(named: "ic_uncheck_box")
        ges.noImg.tintColor = UIColor .lightGray

        
    }
    @IBAction func noAct( ges : checkBoxGesture) {
        idss = "1"

//        companyNameArr.removeAll()
//        designationNameArr.removeAll()
        
        
        
        
        ges.noImg.image = UIImage(named: "ic_check_box")
        ges.noImg.tintColor = UIColor(named: "RegisterColor")

//        ges.yesNoLbl.text = "0"
        yesNoText = 0
        
        
        companyNameText  =  ges.companyName.text
        deignationText = ges.currentDesingnation.text
        
        
        existingCompanyNameArr.append(companyNameText)
        existingdesignationNameArr.append(deignationText)
        
        print("existingCompanyNameArr",existingCompanyNameArr)
        print("existingdesignationNameArr",existingdesignationNameArr)

        var yesNoArrStr = "0"
        yesNoArr.append(yesNoArrStr)
        companyNameArr.append(companyNameText)
        designationNameArr.append(deignationText)
        print("ges.companyNameStr",ges.companyNameStr)
        print("ges.currentDesingnationStr",designationNameArr)
        print("companyNameArr",companyNameArr)
        print("yesNoTextValue",yesNoText)
        
        let setWithoutDuplicates = Set(companyNameArr)

        // Convert the set back to an array if needed
        let arrayWithoutDuplicates = Array(setWithoutDuplicates)

        print("arrayWithoutDuplicates",arrayWithoutDuplicates)
        
        
        
        
        
//        companyNameText  =  ges.companyName.text
//        deignationText = ges.currentDesingnation.text
//        designationNameArr.append(deignationText)
//        companyNameArr.append(companyNameText)
//        print("ges.companyNameStr",ges.companyNameStr)
//        print("ges.currentDesingnationStr",ges.currentDesingnationStr)
//        print("companyNameArr",companyNameArr)
        ges.yesImg.image = UIImage(named: "ic_uncheck_box")
        ges.yesImg.tintColor = UIColor .lightGray

        
    }
}



class checkBoxGesture : UITapGestureRecognizer {
    
    var yesImg : UIImageView!
    var noImg : UIImageView!
    var tapView : UIView!
     var currentDesingnation : UITextField!
    var yesNoLbl : UILabel!
    var companyName : UITextField!
    
    var currentDesingnationStr : String!
   var companyNameStr : String!
    
    
    
    var curCompany : String!
   var curDesign : String!
}
