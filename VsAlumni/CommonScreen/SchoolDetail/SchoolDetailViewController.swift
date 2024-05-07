//
//  SchoolDetailViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit
import iOSDropDown
import ObjectMapper



class SchoolDetailViewController: UIViewController,UITextFieldDelegate {
    
    
  
    @IBOutlet weak var locatedStateTextField: DropDown!
    
    
    @IBOutlet weak var locatedDistrictTextfield: DropDown!
    @IBOutlet weak var mailIdTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBOutlet weak var submitView: UIView!
    @IBOutlet weak var locatedDistrictView: UIViewX!
    @IBOutlet weak var locatedStateView: UIViewX!
    
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var areaTextField: UITextField!
    
    var district_data : [DistrictData] = []
    var state_data : [StateData] = []
    var school_list_data : [SchoolListData] = []
    
    
    var district : [String] = []
    var state : [String] = []
    var stateIDArr : [Int] = []
    var districtId : Int!
    var stateId : Int!
    var countryId : Int!
    var districtIdArr : [Int] = []
    
    
    var token : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        mailIdTextField.delegate = self
        contactNumberTextField.delegate = self
        schoolNameTextField.delegate = self
        placeNameTextField.delegate = self
        yourNameTextField.delegate = self
        
        
        getStateList()
        
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addSchoolList))
        submitView.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
    
    @IBAction func nextVc() {
        let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func getStateList() {

        let param : [String : Any] =
        [
            "countryId": countryId
            
        ]
        
        print("Stateparam",param)
        GetStateListCountryIdRequest.call_request(param: param){ [self]
            (res) in
            
            let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!
            
            if state_response.status == true {
                state_data = state_response.data
                
                
                var StateArray : [String] = []
                 state_data.forEach {(arrType)  in
                     
                     StateArray.append((arrType.stateName))
                     
                 }
                 
                locatedStateTextField.optionArray = StateArray
                 
                locatedStateTextField.isSearchEnable = true
                 
                 
                 
                 var StateIdArray : [Int] = []
                 state_data.forEach {(arrType)  in
                     
                     StateIdArray.append((arrType.idState))
                     
                 }
                 
//              /*   var stateId : In*/t!
                 
                 
                 
                locatedStateTextField.didSelect{ [self](selectedText , index ,id) in
                     
                     print("SelectInstitute",selectedText)
                     
                     stateId = StateIdArray[index]
                  
                     
                     
                     getDistrictList()
                 }
            }else{
                
                let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//
                
            }
        }
        
    }
    
    @IBAction func getDistrictList() {

        let param : [String : Any] =
        [
            "state_id": stateId
            
        ]
        print("param",param)
        GetDistrictListByStateIdRequest.call_request(param: param){ [self]
            (res) in
            
            let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!
            
            if district_response.status == true {
           district_data = district_response.data
                
                
                
                
                var DistrictArray : [String] = []
                district_data.forEach {(arrType)  in
                    
                    DistrictArray.append((arrType.districtName))
                    
                }
                
                locatedDistrictTextfield.optionArray = DistrictArray
                
                locatedDistrictTextfield.isSearchEnable = true
                
                
                
                var DistrictIdArray : [Int] = []
                district_data.forEach {(arrType)  in
                    
                    DistrictIdArray.append((arrType.idDistrict))
                    
                }
                
//                var distId : Int!
                
                
                
                locatedDistrictTextfield.didSelect{ [self](selectedText , index ,id) in
                    
                    print("SelectInstitute",selectedText)
                    
                    districtId = DistrictIdArray[index]
//
//                    getSchoolList()
                }
            }else{
                
                let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//
                
            }
        }
        
    }
    
    
    
    
    @IBAction  func addSchoolList () {
        
        
        
        
        if locatedStateTextField.text != "" ||  locatedDistrictTextfield.text != "" || schoolNameTextField.text != "" || placeNameTextField.text !=  "" || yourNameTextField.text != "" ||  contactNumberTextField.text != "" ||  mailIdTextField.text != ""  {
            
            //            print("stateTextField.text",stateTextField.text)
            //            print("countryTextField.text",countryTextField.text)
            
         
                    
                    
                    let schoolModal = AddNewInstituteDetailModal()
                    schoolModal.state_id = stateId
                    schoolModal.district_id = districtId
                    schoolModal.institute_name = schoolNameTextField.text
                    schoolModal.area = areaTextField.text
                    schoolModal.city = cityTextField.text
                    schoolModal.country_id = 1
                  
                    
                    
                    var  schoolModalStr = schoolModal.toJSONString()
                    print("schoolModalStr",schoolModal.toJSON())
            print("token",token)
                    AddNewInstituteDetailRequest.call_request(param: schoolModalStr!,token: token) {
                        
                        [self] (res) in
                        
                        let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
                        
                        
                        if schoolRegRes.status == true {
                            let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
                            self.present(viewController, animated: true)
                            
                        }else{
                            let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        
                    }
//                }
//                else{
//                    let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                }
           
           
            }else{
                let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        
        
    }
        
    
    
    
}
