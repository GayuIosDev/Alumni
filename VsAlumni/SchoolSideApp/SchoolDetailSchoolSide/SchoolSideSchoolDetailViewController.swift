//
//  SchoolSideSchoolDetailViewController.swift
//  VsAlumni
//
//  Created by admin on 11/12/23.
//

import UIKit
import ObjectMapper
import DropDown
import AWSS3
import ALCameraViewController
import BSImagePicker
import Photos
import AWSCore
import AWSCognito
import AWSS3
import CryptoSwift
import CryptoKit
import BCrypt
import Foundation
import SystemConfiguration


//enum CryptoError: Error {
//    case encryptionFailed
//    case decryptionFailed
//    case invalidKey
//    // Add more error cases as needed
//}



class SchoolSideSchoolDetailViewController: UIViewController,UIImagePickerControllerDelegate,UITextFieldDelegate   {
  

    
    @IBOutlet weak var contactPersonNameTextField: UITextField!
    
    
    @IBOutlet weak var nextViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var designationTextField: UITextField!
    
    @IBOutlet weak var instituteNameView: UIViewX!
    @IBOutlet weak var selectPhotoView: UIView!
    @IBOutlet weak var uploadImg: UIImageView!
    
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var districtView: UIViewX!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var UploadimageView: UIViewX!
    
  
    @IBOutlet weak var districtTextFied: UITextField!
    
    @IBOutlet weak var contactNumberTextfield: UITextField!
    
    @IBOutlet weak var stateView: UIViewX!
    @IBOutlet weak var yearView: UIViewX!
    
    
    @IBOutlet weak var createPasswordTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var selectCountryView: UIViewX!
    
    
    
    
    @IBOutlet weak var instituteNameTextField: UITextField!
    
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var picker_view: UIPickerView!
    
    @IBOutlet weak var mailIdTextfield: UITextField!
    
    
    
    @IBOutlet weak var selectCountryTextField: UITextField!
    
    let randomKey = SymmetricKey(size: .bits256)

    // Generate a random 128-bit (16-byte) IV
    let randomIV = SymmetricKey(size: .bits128)
    var getSchoolId : Int!
    
    var image_choose: Bool = false
    var stateId : Int!
    var districtId : Int!
    var getCountryId : Int!
    var country : [String] = []
    var countryID : [Int] = []
    var countryId : Int!
  
    @IBOutlet weak var backView: UIView!
    var instituteId : Int!
    var countryNme : String!
//
    var country_data : [CountryData] = []
//    var country : [String] = []
    var state : [String] = []
    var stateID : [Int] = []
    var district : [String] = []
    var districtIdArr : [Int] = []
    var schoolList : [String] = []
    var schoolListIDarr : [Int] = []

    var state_data : [StateData] = []
    var district_data_list : [DistrictData] = []
    
    var schoolListData : [SchoolListData] = []
    var imgCountGet : Int  = 1
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    
    
    @IBOutlet weak var createPasswordEyeImg: UIImageView!
    
    @IBOutlet weak var confirmPasswordEyeImg: UIImageView!
    @IBOutlet weak var pickUIView: UIView!
    
    @IBOutlet weak var confirmPasswordVire: UIViewX!
    
    @IBOutlet weak var createPasswordVire: UIViewX!
    
    @IBOutlet weak var confirmPasswordHeight: NSLayoutConstraint!
    @IBOutlet weak var createPasswordHeight: NSLayoutConstraint!
    var getStateId : Int!
    var getDistId : Int!
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr : String! = ""
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    var drop_down = DropDown()

    var mobileNumber : String!
    var stateIDArr : [Int] = []
    var getIpAddress : String = ""
    var show_password = true
    var countryIdArr : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        createPasswordVire.isHidden = true
        confirmPasswordVire.isHidden = true
        
        createPasswordHeight.constant = 0
        confirmPasswordHeight.constant = 0
        uploadImg.layer.cornerRadius = 50
        
        overrideUserInterfaceStyle = .light

        contactNumberTextfield.delegate = self
        designationTextField.delegate = self
        stateTextField.delegate = self
        selectCountryTextField.delegate = self
        contactPersonNameTextField.delegate = self
        mailIdTextfield.delegate = self
        
        instituteNameTextField.delegate = self
        yearTextField.delegate = self
        mailIdTextfield.delegate = self
        
        
        addDoneButtonOnKeyboard()
     
        
        let defaults =  UserDefaults.standard
        mobileNumber = defaults.string(forKey: Constant.DefaultsKeys.MobileNumber)

        
//        selectPhotoView.isHidden = true
        
        getCountryList()
        
//        nextViewTopConstraint.constant = 50
        backView.isHidden = false
        let stateGest = UITapGestureRecognizer(target: self, action: #selector(pickState))
        stateView.addGestureRecognizer(stateGest)
        
        
        let discGest = UITapGestureRecognizer(target: self, action: #selector(pickDistrict))
        districtView.addGestureRecognizer(discGest)
        
        
        let nextGest = UITapGestureRecognizer(target: self, action: #selector(uploadPersonalDetail))
        nextView.addGestureRecognizer(nextGest)
        
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
        
        
        let countryGest = UITapGestureRecognizer(target: self, action: #selector(pickCountryList))
        selectCountryView.addGestureRecognizer(countryGest)
        
//        let districtGes = UITapGestureRecognizer(target: self, action: #selector(pickDistrict))
//        districtView.addGestureRecognizer(districtGes)
        
        let selectPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        UploadimageView.addGestureRecognizer(selectPhotoGes)
        // Do any additional setup after loading the view.
        
        
        let schoolGest = UITapGestureRecognizer(target: self, action: #selector(getSchoolList))
        instituteNameView.addGestureRecognizer(schoolGest)
//        
        
        
        let yearGest = UITapGestureRecognizer(target: self, action: #selector(pickEstblishYear))
        yearView.addGestureRecognizer(yearGest)
//
      
       //
        
//        pickEstblishYear()
        if let addr = Constant.getWiFiAddress() {
            print("address",addr)
            getIpAddress = addr
            
        } else {
            print("No WiFi address")
        }
        
     
        
        let createPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(toggle_password))
        createPasswordVire.addGestureRecognizer(createPasswordEyeGesture)
        
        let confirmPasswordEyeGesture = UITapGestureRecognizer(target: self, action: #selector(confirm_toggle_password))
        confirmPasswordVire.addGestureRecognizer(confirmPasswordEyeGesture)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }



    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    
    
    @IBAction func backVc(){
      dismiss(animated: true)
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
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//     return range.location <= 9
//    }
//    
    
    
    @IBAction func clickSelectPhoto () {
        
        let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
        
        for i in ["Gallery","Camera"] {
            
            alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
            
        }
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    func choose_image_handler(action: UIAlertAction){
        
        
        let alert = UIAlertController(title: "Select Attachment", message: "", preferredStyle: .actionSheet)
        
        print(action.title!)
        
        if ((action.title!.elementsEqual("Gallery"))){
            
            print("camera")
            

            print("gallery")
//            voiceRecordView.isHidden = true
//            imgShowView.isHidden = true
   clickGallery()

            
        }else if ((action.title!.elementsEqual("Camera"))){
            
            
            
            clickCamera()
            
        }
        
        else {
            
            
            
            let optionMenu = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            
            self.present(optionMenu, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    
    func choose_image_handlerGallery(action: UIAlertAction){
        
        
        
        print(action.title!)
        
        if ((action.title!.elementsEqual("Camera"))){
            
            print("camera1")
            
          clickCamera()
            
        }else if ((action.title!.elementsEqual("Gallery"))){
            
            print("gallery")
           clickGallery()
        }
        else {
            
            
            
            let optionMenu = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            
            self.present(optionMenu, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    
    @IBAction func pickEstblishYear() {
        
        print("pickEstblishYear")
        
        
        
        
            var optionArray =
//        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",
//                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",
//                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"
//                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"
//                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"
//                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"
//                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"
        [
                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",
                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",
                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",
                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",
                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",
                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",
                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",
                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",
                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"
                                     ]
//                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070
//                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080
//                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090
//                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100
//              ]
        
       
        
     
//            state_data.forEach { (stateName) in
//                state.append(stateName.stateName)
//                stateIDArr.append(stateName.idState)
//            }

            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                yearTextField.text = item
//    stateId = stateIDArr[index]
              
            }
            
            drop_down.dataSource = optionArray
            drop_down.anchorView = yearView
        drop_down.direction  = .top
            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
            drop_down.show()
         
            
//        }
        
    }
    
    @IBAction func pickCountryList() {

       print("drop")
     
        
        drop_down.dataSource = country
        drop_down.anchorView = selectCountryView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()
        
        country_data.forEach { (countryName) in

//            country.append(countryName.countryName)
            countryIdArr.append(countryName.idCountry)
        }
        
       
        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
          selectCountryTextField.text = item

            countryNme = item
            print("index)",countryId)

            countryId = countryIdArr[index]
            getCountryId = countryId

            getStateList()
        
           
        }
       
        
    }
    
    
    @IBAction func pickState() {

       

        state_data.forEach { (stateName) in
            state.append(stateName.stateName)
            stateIDArr.append(stateName.idState)
        }

        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            stateTextField.text = item
stateId = stateIDArr[index]
            getStateId = stateId
          
            getDistrictList()
        }
        
        drop_down.dataSource = state
        drop_down.anchorView = stateView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()

    }
    
    
    @IBAction func pickDistrict() {

       

        district_data_list.forEach { (stateName) in

            district.append(stateName.districtName)
            districtIdArr.append(stateName.idDistrict)
        }

        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            districtTextFied.text = item
districtId = districtIdArr[index]
            getDistId = districtId
          

          
        }

        drop_down.dataSource = district
        drop_down.anchorView = districtView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()

    }
    
    
    
    @IBAction func getStateList() {

        let param : [String : Any] =
        [
            "countryId": countryId
            
        ]
        print("param",param)
        GetStateListCountryIdRequest.call_request(param: param){ [self]
            (res) in
            
            let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!
            
            if state_response.status == true {
//                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    
                state_data = state_response.data
                
                
                
//                    let defaults = UserDefaults.standard
////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
//                    let vc = LoginViewController(nibName: nil, bundle: nil)
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
//                }
            }else{
                
                let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//
                
            }
        }
        
    }

    @IBAction func pickSchoolList() {

        drop_down.show()
        print("School List")
        drop_down.dataSource = schoolList
        drop_down.anchorView = instituteNameView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
       
        drop_down.direction = .bottom

        print("SchooList",schoolListData.count)
        
        
        schoolListData.forEach { (stateName) in
//            schoolList.append(stateName.schoolName)
            schoolListIDarr.append(stateName.schoolId)
        }

        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            instituteNameTextField.text = item
getSchoolId = schoolListIDarr[index]
//            getSchoolList()

          
        }
        
       

          

        }
    
    @IBAction func getDistrictList() {

        
        print("getStateId",getStateId)
        let param : [String : Any] =
        [
            "state_id": getStateId
            
        ]
        print("districtparam",param)
        GetDistrictListByStateIdRequest.call_request(param: param){ [self]
            (res) in
            
            let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!
            
            if district_response.status == true {
//                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    
                district_data_list = district_response.data
           

                
            }else{
                
                let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//
                
            }
        }
        
    }
    
    
    
  
    
    
    @IBAction func getCountryList() {

        GetAllCountryListRequest.call_request(){
            (res) in
            
            let country_response : GetCountryListResponse = Mapper<GetCountryListResponse>().map(JSONString: res)!
            
            if country_response.status == true {
//                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [self] in
                    
                    
                    country_data = country_response.data
                    print("country_response.data",country_response.data)
   
                    
                    for i in country_response.data{
                        
                        country.append(i.countryName)
                        
                    }
                    
//                    let defaults = UserDefaults.standard
////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
//                    let vc = LoginViewController(nibName: nil, bundle: nil)
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                }
            }else{
                
                let alert = UIAlertController(title: "Alert", message: country_response.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
//                _ =  SweetAlert().showAlert(" The request is invalid",subTitle: "",style: .warning,buttonTitle: "OK",buttonColor:.black)
                
            }
        }
        
    }
    
    
    @IBAction func getSchoolList() {
        
        
  
        var keywordKey : String!
        keywordKey = instituteNameTextField.text
        
        let param : [String : Any] =
        [
            "keyword" : instituteNameTextField.text!,
            "countryid" : getCountryId!,
            "stateid" : getStateId!,
            "districtid" : getDistId!
            
        ]
        
       print("param",param)
        GetSchoolListRequest.call_request(param: param) {
            
            [self] (res) in
            
            let schoolListRes : GetSchoolListResponse = Mapper<GetSchoolListResponse>().map(JSONString: res)!
            
            
            if schoolListRes.status == true {
                
                
                
                
                schoolListData =  schoolListRes.data
                
                
                print("schoolListData",schoolListData.count)
              
                schoolList.removeAll()
                for i in schoolListRes.data{
                                    
                                    schoolList.append(i.schoolName)
                                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.pickSchoolList()
                }

            }else{
                let alert = UIAlertController(title: "Alert", message: schoolListRes.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
        
    }
   
        
    }
    
  
    
    @IBAction  func uploadPersonalDetail () {
        
        
        
        
        if selectCountryTextField.text != "" && stateTextField.text != "" &&  instituteNameTextField.text != "" && contactNumberTextfield.text !=  "" && mailIdTextfield.text != "" &&  yearTextField.text != "" && contactNumberTextfield.text !=  "" && designationTextField.text != "" {
            
            
            if contactNumberTextfield.text?.count == 10 {
                //            print("stateTextField.text",stateTextField.text)
                //            print("countryTextField.text",countryTextField.text)
                //            if createPasswordTextField.text == confirmPasswordTextField.text {
                
                
                
                //                let password = createPasswordTextField.text
                //
                //                    do {
                //                        let salt = try BCrypt.Salt()
                //                        let hashed = try BCrypt.Hash(password!, salt: salt)
                //                        print("Hashed result is: \(hashed)")
                //
                
                
                let schoolModal = SchoolSideRegistrationModal()
                //            for i in schoolListID {
                schoolModal.m_institute_id = getSchoolId
                print("schoolModal.m_institute_id",getSchoolId)
                //            }
                schoolModal.school_pic = imageStr
                schoolModal.name = instituteNameTextField.text
                schoolModal.designation = designationTextField.text
                schoolModal.contact_number = contactNumberTextfield.text
                schoolModal.mail_id = mailIdTextfield.text
                schoolModal.established_year = Int(yearTextField.text!)
                //                    schoolModal.password_key = hashed
                //                    schoolModal.visible_pwd = confirmPasswordTextField.text
                schoolModal.ip_address = getIpAddress
                schoolModal.user_agent = "iphone"
                
                
                
                
                
                
                var  schoolModalStr = schoolModal.toJSONString()
                print("schoolModalStr",schoolModal.toJSON())
                SchoolSideRegistrationRequest.call_request(param: schoolModalStr!) {
                    
                    [self] (res) in
                    
                    let schoolRegRes : SchoolSideRegistrationResponse = Mapper<SchoolSideRegistrationResponse>().map(JSONString: res)!
                    
                    
                    if schoolRegRes.status == true {
                        
                        let loginModal = LoginCredentialModal()
                        
                        loginModal.user_name = mobileNumber
                        //                            loginModal.password_key = password
                        loginModal.user_agent = "iphone"
                        loginModal.ip_address = getIpAddress
                        
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
                        //                        //                            let defaults = UserDefaults.standard
                        //                        //                            defaults.removeObject(forKey: Constant.DefaultsKeys.memberTypeId)
                        //                        //
                        //                        //                            defaults.set(schoolRegRes.token, forKey: Constant.DefaultsKeys.token)
                        //                        //                            defaults.set(contactNumberTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
                        //                        //                            defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                        //                        //                            defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                        //                        //
                        //                        //                            print("Constant.DefaultsKeys.memberTypeId",Constant.DefaultsKeys.memberTypeId)
                        //                        //                            for i in schoolRegRes.data {
                        //                        //                                defaults.set(i.memberTypeId, forKey: Constant.DefaultsKeys.memberTypeId)
                        //                        //                                print("Constan.memberTypeId",Constant.DefaultsKeys.memberTypeId)
                        //                        //
                        //                        //                            }
                        //                        //                            let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
                        //                        //                            let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
                        //                        //                            viewController.type = "institute"
                        //                        //                            viewController.token = schoolRegRes.token
                        //                        //                            self.present(viewController, animated: true)
                        //
                        //                    }else{
                        //                        let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
                        //                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        //                        self.present(alert, animated: true, completion: nil)
                        //                    }
                        //
                        //
                        //
                        //                }
                        //                    }
                        //                    catch {
                        //                        print("An error occured: \(error)")
                        //                    }
                        //            }
                        //                else{
                        //                    let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
                        //                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        //                    self.present(alert, animated: true, completion: nil)
                    }
                }
                
            }else{
                let alert = UIAlertController(title: "Alert", message: "Mobile Number Invalid", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            }else{
                let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
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

        contactNumberTextfield.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            contactNumberTextfield.resignFirstResponder()
        }
    
    
    func convertAssetToImages() -> Void {


              if SelectedAssets.count != 0 {

                  for i in 0..<SelectedAssets.count {

                      let manager = PHImageManager.default()

                      let option = PHImageRequestOptions()

                      var thumbnail = UIImage()

                      option.isSynchronous = true

                      manager.requestImage(for: SelectedAssets[i],targetSize: CGSize( width : 200,height : 200), contentMode: .aspectFill, options: option, resultHandler: {(result, info) ->  Void in



                          thumbnail = result!

                      })
                      
                      let data  = thumbnail.jpegData(compressionQuality: 0.7)

                      let newImage = UIImage(data: data!)
                   
                      self.photoArray.append(newImage! as UIImage)
                      self.uploadImg.image = self.photoArray[0]
                      self.uploadImg.contentMode = .scaleToFill
                      getImageURL(images: photoArray)
                  }

             print("photoArray.count" ,photoArray.count)

//              uploadImage(imageData: photoArray[0])


                 print("photoArray.count" ,photoArray.count)
                
              }

              print("complete phto array \(self.photoArray)")

          }
    
    
    
    
    @IBAction func clickCamera() {
//        selectPhotoView.isHidden = true
        
        let camera_controller = CameraViewController
        
       
        { [weak self] image, asset in

            
            self!.photoArray.append(image! as UIImage)
            //
            
            
            
            
            self!.getImageURL(images: self!.photoArray)
            
            self!.uploadImg.image = image!
          
          
            self?.dismiss(animated: true, completion: nil)

        }

        present(camera_controller, animated: true, completion: nil)

    }
    
    
    @IBAction func clickGallery() {
        photoArray.removeAll()
        SelectedAssets.removeAll()
        arrSelectedFilePath.removeAll()
//        selectPhotoView.isHidden = true
        let imagePicker = ImagePickerController()

    print("imgCountGet1",imgCountGet)

        imagePicker.settings.selection.max = imgCountGet
    
   
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]


        presentImagePicker(imagePicker, animated: true, select:{ (asset: PHAsset) -> Void in

        }, deselect: { (assets : PHAsset) -> Void in


        }, cancel: {(assets: [PHAsset]) -> Void in

        }, finish: { [self](assets: [PHAsset]) -> Void in


            self.image_choose = true

            

            for i in 0..<assets.count



                      {

                          let resource = PHAssetResource.assetResources(for: assets[i]).first

                          let name = resource?.originalFilename

                          let PicsLocalPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(name!)

            
                          self.arrSelectedFilePath.append(PicsLocalPath)
                
                         print("pathImg",PicsLocalPath)

                          self.SelectedAssets.append(assets[i])
                
                
                print("SelectedAssets",SelectedAssets)
}

            self.convertAssetToImages()

        })

    }
    
    func getImageURL(images : [UIImage]){
        
      
        self.originalImagesArray = images
        self.totalImageCount = images.count
        if currentImageCount < images.count{
            self.uploadAWS(image: images[currentImageCount])
        }
    }
    
    
    
    
    
    func uploadAWS(image : UIImage){
        
      
        let S3BucketName = "alumnite-chalkpz"
        let CognitoPoolID = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a"
        let Region = AWSRegionType.APSouth1
        
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:Region,identityPoolId:CognitoPoolID)
        let configuration = AWSServiceConfiguration(region:Region, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        // url for image in the bundle
        
        let currentTimeStamp = NSString.init(format: "%ld",Date() as CVarArg)
        let imageNameWithoutExtension = NSString.init(format: "vc_%@",currentTimeStamp)
        let imageName = NSString.init(format: "%@%@",imageNameWithoutExtension, ".png")
        
        // signatureImageName = imageName as String
        
        let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "dd-MM-yyyy"

                let  currentDate =   dateFormatter.string(from: Date())
                
                
           
                
               
                
                let ext = imageName as String
              
                let fileName = imageNameWithoutExtension
                let fileType = ".jpg"
                
                let imageURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(ext)
                let data = image.jpegData(compressionQuality: 0.9)
                do {
                    try data?.write(to: imageURL)
                }
                catch {}
                
                print(imageURL)
                
                let uploadRequest = AWSS3TransferManagerUploadRequest()
                uploadRequest?.body = imageURL
                uploadRequest?.key =   currentDate +  "/" + "File_" + ext
                uploadRequest?.bucket = S3BucketName
                uploadRequest?.contentType = "image/png"
        // upload
        // upload
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest!).continueWith { [self] (task) -> AnyObject? in
            
            if let error = task.error {
//                self.hideLoading()
                print("Upload failed : (\(error))")
            }
            var imageFilePath = NSMutableArray()
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent((uploadRequest?.bucket!)!).appendingPathComponent((uploadRequest?.key!)!)
                if let absoluteString = publicURL?.absoluteString {
                    print("Uploaded to:\(absoluteString)")
                    
                    imageStr = absoluteString
                    let imageDicthome = NSMutableDictionary()
                    imageDicthome["path"] = absoluteString
                    imageDicthome["type"] = "IMAGE"
                    let imageDict = NSMutableDictionary()
                    var emptyDictionary = [String: String]()
                   
                    imageFilePath.add(imageDicthome)
                    
                    
                    
                    self.imageUrlArray.add(imageDict)
                  
//                    append(emptyDictionary)
//
                    self.currentImageCount = self.currentImageCount + 1
                    if self.currentImageCount < self.totalImageCount{
                         DispatchQueue.main.async {
                                                       self.getImageURL(images: self.originalImagesArray)
                                                   }
                    }else{
                        self.convertedImagesUrlArray = self.imageUrlArray
                       
                       
                    }
                }
            }
//            else {
//                self.hideLoading()
//                print("Unexpected empty result.")
//            }
            return nil
        }
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
  
    
   
        
   

@objc func keyboardWillShow(notification: NSNotification) { // -----> to set key board set height
    
//        print("open",keyboardSize.height)
    
    
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
    
    
    
}
