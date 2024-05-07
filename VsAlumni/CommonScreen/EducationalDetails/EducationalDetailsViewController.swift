//
//  EducationalDetailsViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit
import ObjectMapper
import DropDown
//import iOSDropDown

struct CombinedElements {
    
    let existingcontryNameArr: Int
    let existingdistrictNameArr: Int
    let existingstateNameArr: Int
    let existingInstituteNameArr: String
    let existingclassJoinedNameArr: String
    let existingclassPassedOutNameArr: String
    let existingyearJoinedNameArr: Int
    let existingyearPassedOutNameArr: Int
}



class EducationalDetailsViewController: UIViewController,UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var nextLbl: UILabel!
    
    
    @IBOutlet weak var step2Lbl: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var intrestView: UIViewX!
    @IBOutlet weak var schoolNameLbl: UILabel!
    
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var IntrestedTextField: UITextField!
    
    @IBOutlet weak var classJoinedTextField: UITextField!
    @IBOutlet weak var highestClassStudiedTextField: UITextField!
    
    
    @IBOutlet weak var classPassedOut: DropDown!
    @IBOutlet weak var schoolDistrictTextField: DropDown!
    
    @IBOutlet weak var schoolNameTextField: DropDown!
    
    
    @IBOutlet weak var schoolStateTextField: DropDown!
    
    
    @IBOutlet weak var interestedParticipateTextField: DropDown!
    
    @IBOutlet weak var yearJoinedTextField: DropDown!
    @IBOutlet weak var schoolStateView: UIViewX!
    @IBOutlet weak var schoolDistrictView: UIViewX!
    @IBOutlet weak var schoolNameView: UIViewX!
    @IBOutlet weak var yearPassedOutView: UIViewX!
    @IBOutlet weak var interestedParticipateView: UIViewX!
    @IBOutlet weak var VolunteerDonorTextField: UITextField!
    
    @IBOutlet weak var yearPassedOutTextField: DropDown!
    
    @IBOutlet weak var addSchoolLbl: UILabel!
    @IBOutlet weak var addSchoolView: UIView!
    @IBOutlet weak var nextView: UIView!
    var changeEducationalData : [ProfileGetEducationDetail] = []
    var profileInstituteList : [ProfileGetInstituteList]!
    var schoolNameArr : [String] = []
    
    var district_data : [DistrictData] = []
    var state_data : [StateData] = []
    var school_list_data : [SchoolListData] = []
    var rowsId = [1]
    var drop_down = DropDown()
    var instituteListArr : [AlumniInstituteEducationDetailModal] = []
    
    var instituteListObj : [AlumniInstituteEducationDetailModal] = []
    //    var instituteEduList :   AlumniInstituteEducationDetailModal
    var district : [String] = []
    var state : [String] = []
    var stateIDArr : [Int] = []
    var school : [String] = []
    var schoolIdArr : [Int] = []
    var schoolId : Int!
    var districtId : Int!
    var highClassText : Int! = 0
    var classJoinedTextStr : String! = "0"
    var stateId : Int!
    var districtIdArr : [Int] = []
    
    var token : String!
    var schoolList : [String] = []
    var schoolListIDarr : [Int] = []
    var supportStr : [String] = []
    var supportContentStr : [String] = []
    var supportIdArr : [Int] = []
    var supportId : Int!
    var getSchoolId : Int!
    var contributeSupportData : [GetContributeSupportListData] = []
    
    var country : [String] = []
    var countryID : [Int] = []
    var country_data : [CountryData] = []
    var alumniEducation : [AlumniInstituteEducationDetailModal] = []
    
    let rowIdentifier = "EducationCollectionViewCell"
    
    var countryId : Int!
    var getInstituteId : Int!
    
    
    var getDistId : Int!
    var countryText : String!
    var stateText : String!
    var districtText : String!
    var schoolNameText : String!
    var yearJoinedText : String!
    var yearPassedOutText : String!
    var classPassedOutText : String!
    var intrestedParticipateText : String!
    var AllModalVale : [EducationDataDetailModal] = []
    var editId : String!
    
    var ChangeEducationalDetail : Int!
    //    var changeProfionalData : [ProfileGetProfessionalDetail] = []
    var countryNameEdit : [String]  = []
    
    
    
    var contryNameArr : [String] = []
    var districtNameArr : [String] = []
    var stateNameArr : [String] = []
    var InstituteNameArr : [String] = []
    var classJoinedNameArr : [Int] = []
    var classPassedOutNameArr : [String] = []
    var yearJoinedNameArr : [Int] = []
    var yearPassedOutNameArr : [Int] = []

    var existingcontryNameArr : [Int] = []
    var existingdistrictNameArr : [Int] = []
    
    var existingstateNameArr : [Int] = []
    var existingInstituteNameArr : [String] = []
    
    var existingclassJoinedNameArr : [String] = []
    var existingclassPassedOutNameArr : [String] = []
    
    var existingyearJoinedNameArr : [Int] = []
    var existingyearPassedOutNameArr : [Int] = []
    
    
    
    
    
    
    
    
    
  
//        
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        print("Edutoken",token)
        
        VolunteerDonorTextField.delegate = self
        
        //        highestClassStudiedTextField.delegate = self
        IntrestedTextField.delegate = self
        //        classJoinedTextField.delegate = self
        //        VolunteerDonorTextField.delegate = self
        //        classJoinedTextField.delegate = self
        //        highestClassStudiedTextField.delegate = self
        
        //
        
        overrideUserInterfaceStyle = .light
        
        
        
        getCountryList()
        
        getContributrSupport()
        //        let schoolListGesture = UITapGestureRecognizer(target: self, action: #selector(getSchoolList))
        //        schoolNameView.addGestureRecognizer(schoolListGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        if ChangeEducationalDetail == 1 {
            getEducational()
//            cv.dataSource = self
//            cv.delegate = self
            step2Lbl.isHidden = true
            nextLbl.text = "UPDATE"
        }else{
            cv.dataSource = self
            nextLbl.text = "NEXT"
            cv.delegate = self
        }
        
        
        
        
//        if ChangeEducationalDetail == 1 {
//
//            getEducational()
//
//        }else{
//
//            cv.dataSource = self
//
//                  cv.delegate = self
//
//        }
//        
        //        yearPassedOut()
        //        classPassedOutVc()
        //        pickIntrestParticipate()
        
        //
        //        tv.delegate = self
        //        tv.dataSource = self
        //
        
        //        tv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)
        //
        
        
        
        let menuRowNib = UINib(nibName: rowIdentifier, bundle: nil)
        cv.register(menuRowNib, forCellWithReuseIdentifier: rowIdentifier)
        
        
        let backGes = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGes)
        //        var drop_down = DropDown()
        //        schoolListData.forEach { (school) in
        //
        //            schoolList.append(school.schoolName)
        ////            stateID.append(stateName.idState)
        //        }
        //
        //        instituteNameTextField.didSelect{ [self](selectedText , index ,id) in
        //
        //                             print("SelectInstitute",selectedText)
        //            var ClgId : [Int] = []
        //
        //            schoolListData.forEach {(arrType)  in
        //
        //                ClgId.append((arrType.schoolId))
        //
        //
        //
        //            }
        //
        //
        //            instituteId = ClgId[index]
        //
        //            print("instituteId",instituteId)
        //        }
        //
        
        
        
        //        let stateGesture = UITapGestureRecognizer(target: self, action: #selector(pickState))
        //        schoolStateView.addGestureRecognizer(stateGesture)
        
        print("ChangeEducationalDetail",ChangeEducationalDetail)
        
        //
    }
    
    //    @IBAction func getCountryList() {
    //
    //
    //        GetAllCountryListRequest.call_request(){
    //            (res) in
    //
    //            let country_response : GetCountryListResponse = Mapper<GetCountryListResponse>().map(JSONString: res)!
    //
    //            if country_response.status == true {
    //                //                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
    //                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [self] in
    //
    //
    //                    country_data = country_response.data
    //
    //                    var countryArray : [String] = []
    //                    country_data.forEach {(arrType)  in
    //
    //                        countryArray.append((arrType.countryName))
    //
    //                    }
    //
    //                    selectCountryTextField.optionArray = countryArray
    //
    //                    selectCountryTextField.isSearchEnable = true
    //
    //
    //
    //                    var countryIdArray : [Int] = []
    //                    country_data.forEach {(arrType)  in
    //
    //                        countryIdArray.append((arrType.idCountry))
    //
    //                    }
    //
    //                    var stateId : Int!
    //
    //
    //
    //                    selectCountryTextField.didSelect{ [self](selectedText , index ,id) in
    //
    //                        print("SelectInstitute",selectedText)
    //
    //                        getCountryId = countryIdArray[index]
    //                        //                         getStateId  = stateId
    //                        print("getCountryId",getCountryId)
    //
    //
    //                        print("country_response.data",country_response.data)
    //                        //                    let defaults = UserDefaults.standard
    //                        ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
    //                        //                    let vc = LoginViewController(nibName: nil, bundle: nil)
    //                        //                    vc.modalPresentationStyle = .fullScreen
    //                        //                    self.present(vc, animated: true, completion: nil)
    //                    }
    //                }
    //                }else{
    //
    //                    //                _ =  SweetAlert().showAlert(" The request is invalid",subTitle: "",style: .warning,buttonTitle: "OK",buttonColor:.black)
    //
    //
    //            }
    //
    //        }
    //    }
    
    
    
//    @IBAction func backVc() {
//        
//        
//        
//        dismiss(animated: true)
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @objc func keyboardWillShow(notification: NSNotification) { // -----> to set key board set height
//        
//        
//        
//        
//        
//        
//        
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            
//            
//            
//            if self.view.frame.origin.y == 0 {
//                
//                
//                
//                self.view.frame.origin.y -= keyboardSize.height-91
//                
//                
//                
//                print("keyboardSize.height",keyboardSize.height)
//                
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        
//        
//        
//        if self.view.frame.origin.y != 0 {
//            
//            
//            
//            self.view.frame.origin.y = 0
//            
//            
//            
//        }
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func clickHereAction() {
//        
//        
//        
//        
//        
//        
//        
//        let storyboard = UIStoryboard(name: "SchoolDetailStoryboard", bundle: nil)
//        
//        
//        
//        let viewController = storyboard.instantiateInitialViewController() as! SchoolDetailViewController
//        
//        
//        
//        self.present(viewController, animated: true)
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func getContributrSupport() {
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        print("token",token)
//        
//        
//        
//        SupportListRequest.call_request(token: token){ [self]
//            
//            
//            
//            (res) in
//            
//            
//            
//            
//            
//            
//            
//            let contributeModalRes : getContributeSupportList = Mapper<getContributeSupportList>().map(JSONString: res)!
//            
//            
//            
//            
//            
//            
//            
//            if contributeModalRes.status == true {
//                
//                
//                
//                contributeSupportData = contributeModalRes.data
//                
//                
//                
//                IntrestedTextField.text = contributeModalRes.data[0].supportName
//                VolunteerDonorTextField.text = contributeModalRes.data[0].supportName
//                
//                
//                for i in contributeModalRes.data {
//                    
//                    
//                    
//                    supportStr.append(i.supportName)
//                    
//                    
//                    
//                }
//                
//                
//                
//                //                AlumniGalleryData = contributeModalRes.data
//                
//                
//                
//                //                for i in AlumniGalleryModalRes.data {
//                
//                
//                
//                //                    dropdownLbl.text = i.institute_name
//                
//                
//                
//                //
//                
//                
//                
//                //                    dropDownInstiId = i.institute_id
//                
//                
//                
//                //                }
//                
//                
//                
//                //                instituteId = dropDownInstiId
//                
//                
//                
//                //                getInstituteGalleryList()
//                
//                
//                
//                //
//                
//                
//                
//                //                cv.isHidden = false
//                
//                
//                
//                //                cv.dataSource = self
//                
//                
//                
//                //                cv.delegate = self
//                
//                
//                
//                //                cv.reloadData()
//                
//                
//                
//                
//                
//                
//                
//                //            }else{
//                
//                
//                
//                //                let alert = UIAlertController(title: "Alert", message: contributeModalRes.message, preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                //                self.main.present(alert, animated: true, completion: nil)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func nextVc( ges : EducationCheckBoxGesture) {
//        
//        
//        
//        
//        
//        
//        
//        print("nextWorking")
//        
//        
//        
//        
//        
//        
//        
//        //        var schoolNameArr : String!
//        
//        
//        
//        
//        
//        
//        
//        //
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            if editId == "1"{
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                var aryy :  [AlumniInstituteEducationDetailModal] = []
//                
//                
//                
//                for i in 0..<AllModalVale.count{
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//                    
//                    
//                    
//                    //        for i in schoolNameArr {
//                    
//                    
//                    
//                    alumniInstituteEdu.institute_id = AllModalVale[i].institute_id
//                    
//                    
//                    
//                    alumniInstituteEdu.class_joined = AllModalVale[i].class_joined
//                    
//                    
//                    
//                    alumniInstituteEdu.year_joined = AllModalVale[i].year_joined
//                    
//                    
//                    
//                    alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out
//                    
//                    
//                    
//                    alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    aryy.append(alumniInstituteEdu)
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                let alumniInstituteModal = AlumniEducationDetailModal()
//                
//                
//                
//                alumniInstituteModal.institute_list = aryy
//                
//                
//                
//                alumniInstituteModal.participation_interest = IntrestedTextField.text
//                
//                
//                
//                
//                
//                
//                
//                //
//                
//                
//                
//                
//                
//                
//                
//                var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//                
//                
//                
//                print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//                
//                
//                
//                print("token",token)
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    [self] (res) in
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    if schoolRegRes.status == true {
//                        
//                        
//                        
//                        //                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//                        //
//                        //
//                        //
//                        //                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//                        //
//                        //
//                        //
//                        //                                self.present(viewController, animated: true)
//                        //
//                        
//                        
//                        dismiss(animated: true)
//                        
//                        
//                        
//                        
//                    }else{
//                        
//                        
//                        
//                        let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//                        
//                        
//                        
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        
//                        
//                        
//                        self.present(alert, animated: true, completion: nil)
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            else{
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                print("profileInstituteListprofileInstituteList",profileInstituteList.count)
//                
//                
//                
//                
//                
//                
//                
//                var aryy :  [AlumniInstituteEducationDetailModal] = []
//                
//                
//                
//                for i in 0..<profileInstituteList.count{
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//                    
//                    
//                    
//                    //        for i in schoolNameArr {
//                    
//                    
//                    
//                    alumniInstituteEdu.institute_id = profileInstituteList[i].institute_id
//                    
//                    
//                    
//                    alumniInstituteEdu.class_joined = profileInstituteList[i].class_joined
//                    
//                    
//                    
//                    alumniInstituteEdu.year_joined = profileInstituteList[i].year_joined
//                    
//                    
//                    
//                    alumniInstituteEdu.class_passed_out = profileInstituteList[i].class_passed_out
//                    
//                    
//                    
//                    alumniInstituteEdu.year_passed_out = profileInstituteList[i].year_passed_out
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    aryy.append(alumniInstituteEdu)
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                let alumniInstituteModal = AlumniEducationDetailModal()
//                
//                
//                
//                alumniInstituteModal.institute_list = aryy
//                
//                
//                
//                alumniInstituteModal.participation_interest = IntrestedTextField.text
//                
//                
//                
//                
//                
//                
//                
//                //
//                
//                
//                
//                
//                
//                
//                
//                var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//                
//                
//                
//                print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//                
//                
//                
//                print("token",token)
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    [self] (res) in
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    if schoolRegRes.status == true {
//                        
//                        
//                        
//                        //                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//                        //
//                        //
//                        //
//                        //                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//                        //
//                        //
//                        //
//                        //                                self.present(viewController, animated: true)
//                        //
//                        //
//                        
//                        
//                        dismiss(animated: true)
//                        
//                        
//                        
//                        
//                    }else{
//                        
//                        
//                        
//                        let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//                        
//                        
//                        
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        
//                        
//                        
//                        self.present(alert, animated: true, completion: nil)
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//        }else{
//            
//            
//            
//            let modl = EducationDataDetailModal()
//            
//            
//            
//            
//            
//            
//            
//            modl.class_joined = ges.classJoinedTextField.text
//            
//            
//            
//            modl.class_passed_out = ges.classPassedOutTextField.text
//            
//            
//            
//            modl.institute_id =  getSchoolId
//            
//            
//            
//            modl.year_joined = Int(ges.yearJoinedTextField.text!)
//            
//            
//            
//            modl.year_passed_out = Int(ges.yearPassedOutTextField.text!)
//            
//            
//            
//            
//            
//            
//            
//            AllModalVale.append(modl)
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            var aryy :  [AlumniInstituteEducationDetailModal] = []
//            
//            
//            
//            for i in 0..<AllModalVale.count{
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//                
//                
//                
//                //        for i in schoolNameArr {
//                
//                
//                
//                alumniInstituteEdu.institute_id = AllModalVale[i].institute_id
//                
//                
//                
//                alumniInstituteEdu.class_joined = AllModalVale[i].class_joined
//                
//                
//                
//                alumniInstituteEdu.year_joined = AllModalVale[i].year_joined
//                
//                
//                
//                alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out
//                
//                
//                
//                alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out
//                
//                
//                
//                
//                
//                
//                
//                aryy.append(alumniInstituteEdu)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            let alumniInstituteModal = AlumniEducationDetailModal()
//            
//            
//            
//            alumniInstituteModal.institute_list = aryy
//            
//            
//            
//            alumniInstituteModal.participation_interest = IntrestedTextField.text
//            
//            
//            
//            
//            
//            
//            
//            //
//            
//            
//            
//            
//            
//            
//            
//            var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//            
//            
//            
//            print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//            
//            
//            
//            print("token",token)
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            AlumniEducationDetailRequest.call_request(param: alumniInstituteModalStr!,token: token) {
//                
//                
//                
//                
//                
//                
//                
//                [self] (res) in
//                
//                
//                
//                
//                
//                
//                
//                let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                if schoolRegRes.status == true {
//                    
//                    
//                    
//                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//                    
//                    
//                    
//                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//                    
//                    
//                    
//                    self.present(viewController, animated: true)
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                }else{
//                    
//                    
//                    
//                    let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//                    
//                    
//                    
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    
//                    
//                    
//                    self.present(alert, animated: true, completion: nil)
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                //            else{
//                
//                
//                
//                //                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                //                self.present(alert, animated: true, completion: nil)
//                
//                
//                
//                //            }
//                
//                
//                
//                //
//                
//                
//                
//                //
//                
//                
//                
//                //            else{
//                
//                
//                
//                //                let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                //                self.present(alert, animated: true, completion: nil)
//                
//                
//                
//                //            }
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    ////   }
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    ////        let storyboard = UIStoryboard(name: "SchoolDetailStoryboard", bundle: nil)
//    
//    
//    
//    ////        let viewController = storyboard.instantiateInitialViewController() as! SchoolDetailViewController
//    
//    
//    
//    ////        self.present(viewController, animated: true)
//    
//    
//    
//    //    }
//    
//    
//    
//    
//    
//    
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        
//        
//        self.view.endEditing(true)
//        
//        
//        
//        return false
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //    @IBAction func getStateList() {
//    
//    
//    
//    //
//    
//    
//    
//    //        let param : [String : Any] =
//    
//    
//    
//    //        [
//    
//    
//    
//    //            "countryId": 1
//    
//    
//    
//    //
//    
//    
//    
//    //        ]
//    
//    
//    
//    //
//    
//    
//    
//    //        print("Stateparam",param)
//    
//    
//    
//    //        GetStateListCountryIdRequest.call_request(param: param){ [self]
//    
//    
//    
//    //            (res) in
//    
//    
//    
//    //
//    
//    
//    
//    //            let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!
//    
//    
//    
//    //
//    
//    
//    
//    //            if state_response.status == true {
//    
//    
//    
//    //                state_data = state_response.data
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //                var StateArray : [String] = []
//    
//    
//    
//    //                 state_data.forEach {(arrType)  in
//    
//    
//    
//    //
//    
//    
//    
//    //                     StateArray.append((arrType.stateName))
//    
//    
//    
//    //
//    
//    
//    
//    //                 }
//    
//    
//    
//    //
//    
//    
//    
//    //                 schoolStateTextField.optionArray = StateArray
//    
//    
//    
//    //
//    
//    
//    
//    //                schoolStateTextField.isSearchEnable = true
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //                 var StateIdArray : [Int] = []
//    
//    
//    
//    //                 state_data.forEach {(arrType)  in
//    
//    
//    
//    //
//    
//    
//    
//    //                     StateIdArray.append((arrType.idState))
//    
//    
//    
//    //
//    
//    
//    
//    //                 }
//    
//    
//    
//    //
//    
//    
//    
//    ////              /*   var stateId : In*/t!
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //                schoolStateTextField.didSelect{ [self](selectedText , index ,id) in
//    
//    
//    
//    //
//    
//    
//    
//    //                     print("SelectInstitute",selectedText)
//    
//    
//    
//    //
//    
//    
//    
//    //                     stateId = StateIdArray[index]
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //
//    
//    
//    
//    //                     getDistrictList()
//    
//    
//    
//    //                 }
//    
//    
//    
//    //            }else{
//    
//    
//    
//    //
//    
//    
//    
//    //                let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)
//    
//    
//    
//    //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//    
//    
//    
//    //                self.present(alert, animated: true, completion: nil)
//    
//    
//    
//    //
//    
//    
//    
//    ////
//    
//    
//    
//    //
//    
//    
//    
//    //            }
//    
//    
//    
//    //        }
//    
//    
//    
//    //
//    
//    
//    
//    //    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
////    @IBAction func getEducational() {
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        
////        print("token",token)
////        
////        
////        
////        ProfileGetEducationalRequest.call_request(token: token){ [self]
////            
////            
////            
////            (res) in
////            
////            
////            
////            
////            
////            
////            
////            let getEducationalRes : ProfileGetEducationalDetails = Mapper<ProfileGetEducationalDetails>().map(JSONString: res)!
////            
////            
////            
////            
////            
////            
////            
////            if getEducationalRes.status == true {
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                changeEducationalData = getEducationalRes.getEduData
////                
////                
////                
////                print("changeEducationalData",changeEducationalData.count)
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                
////                for i in changeEducationalData {
////                    
////                    
////                    
////                    //                        profileInstituteList = edu.profileInstituteList
////                    
////                    
////                    
////                    
////                    
////                    
////                    
////                    profileInstituteList = i.profileInstituteList
////                    
////                    
////                    
////                    VolunteerDonorTextField.text = i.participation_interest
////                    
////                    
////                    
////                    IntrestedTextField.text = i.participation_interest
////                    
////                    
////                    
////                    
////                    
////                    
////                    
////                    for ix in i.profileInstituteList{
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                        countryId = ix.country_id
////                        
////                        
////                        
////                        
////                        
////                        
////                        
////                    }
////                    
////                    
////                    
////                    
////                    
////                    
////                    
////                }
////                
////                print("profileInstituteList",profileInstituteList.count)
////                
////                
////                
////                
////                
////                
////                
////                getStateList()
////                
////                
////            
////            }
////            
////            
////            
////        }
////        
////        
////        
////    }
//    
//    @IBAction func getEducational() {
//
//                
//
//                
//
//             
//
//                print("token",token)
//
//            ProfileGetEducationalRequest.call_request(token: token){ [self]
//
//                    (res) in
//
//                    
//
//                    let getEducationalRes : ProfileGetEducationalDetails = Mapper<ProfileGetEducationalDetails>().map(JSONString: res)!
//
//                    
//
//                    if getEducationalRes.status == true {
//
//                        
//
//                        
//
//                        changeEducationalData = getEducationalRes.getEduData
//
//                        print("changeEducationalData",changeEducationalData.count)
//
//                        for i in changeEducationalData {
//
//    //                        profileInstituteList = edu.profileInstituteList
//
//
//
//                            profileInstituteList = i.profileInstituteList
//
//                            VolunteerDonorTextField.text = i.participation_interest
//
//                            IntrestedTextField.text = i.participation_interest
//
//
//
//                        }
//
//                        print("profileInstituteList",profileInstituteList.count)
//
//
//
//                        cv.dataSource = self
//
//                        cv.delegate  .self
//
//                        
//
//                        cv.reloadData()
//
//    //                    contributeSupportData = contributeModalRes.data
//
//    //
//
//    //                    for i in contributeModalRes.data {
//
//    //                        supportStr.append(i.supportName)
//
//    //                    }
//
//        //                AlumniGalleryData = contributeModalRes.data
//
//        //                for i in AlumniGalleryModalRes.data {
//
//        //                    dropdownLbl.text = i.institute_name
//
//        //
//
//        //                    dropDownInstiId = i.institute_id
//
//        //                }
//
//        //                instituteId = dropDownInstiId
//
//        //                getInstituteGalleryList()
//
//        //
//
//        //                cv.isHidden = false
//
//        //                cv.dataSource = self
//
//        //                cv.delegate = self
//
//        //                cv.reloadData()
//
//                        
//
//        //            }else{
//
//        //                let alert = UIAlertController(title: "Alert", message: contributeModalRes.message, preferredStyle: UIAlertController.Style.alert)
//
//        //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//        //                self.main.present(alert, animated: true, completion: nil)
//
//                    }
//
//                    
//
//                    
//
//                    
//
//                }
//
//            }
//   
//   
//   
//   
//   
//   
//   //
//   //
//   //
//   //
//   //
//    
//    @IBAction func getDistrictList() {
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            
//            
//            if editId == "1"{
//                
//                
//                
//                
//                
//                let param : [String : Any] =
//                
//                
//                
//                [
//                    
//                    
//                    
//                    "state_id": stateId
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                ]
//                
//                
//                
//                print("param",param)
//                
//                
//                
//                GetDistrictListByStateIdRequest.call_request(param: param){ [self]
//                    
//                    
//                    
//                    (res) in
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    if district_response.status == true {
//                        
//                        
//                        
//                        district_data = district_response.data
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        for i in district_response.data{
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            district.append(i.districtName)
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                        }
//                        
//                        
//                        
//                        
//                        
//                        cv.dataSource = self
//                        
//                        cv.delegate  = self
//                        
//                        cv.reloadData()
//                  
//                        
//                     
//                    }else{
//                        
//                        
//                        let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)
//                        
//                        
//                        
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        
//                        
//                        
//                        self.present(alert, animated: true, completion: nil)
//                        
//                        
//                    }
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//            }
//            
//            
//            
//            else{
//                
//                for i in  profileInstituteList{
//                    
//                    
//                    
//                    let param : [String : Any] =
//                    
//                    
//                    
//                    [
//                        
//                        
//                        
//                        "state_id": i.state_id
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                    ]
//                    
//                    
//                    
//                    print("param",param)
//                    
//                    
//                    
//                    GetDistrictListByStateIdRequest.call_request(param: param){ [self]
//                        
//                        
//                        
//                        (res) in
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        if district_response.status == true {
//                            
//                            
//                            
//                            district_data = district_response.data
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            for i in district_response.data{
//                                
//                                
//                                
//                                
//                                
//                                
//                                
//                                district.append(i.districtName)
//                                
//                                
//                                
//                                
//                                
//                                
//                                
//                            }
//                            
//                            
//                            
//                            
//                            
//                            cv.dataSource = self
//                            
//                            cv.delegate  = self
//                            
//                            cv.reloadData()
//                            
//                            
//                            
//                        }else{
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)
//                            
//                            
//                            
//                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                            
//                            
//                            
//                            self.present(alert, animated: true, completion: nil)
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            //
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                        }
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        else{
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            let param : [String : Any] =
//            
//            
//            
//            [
//                
//                
//                
//                "state_id": stateId
//                
//                
//                
//                
//                
//                
//                
//            ]
//            
//            
//            
//            print("param",param)
//            
//            
//            
//            GetDistrictListByStateIdRequest.call_request(param: param){ [self]
//                
//                
//                
//                (res) in
//                
//                
//                
//                
//                
//                
//                
//                let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!
//                
//                
//                
//                
//                
//                
//                
//                if district_response.status == true {
//                    
//                    
//                    
//                    district_data = district_response.data
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    for i in district_response.data{
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        district.append(i.districtName)
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                    cv.dataSource = self
//                    
//                    cv.delegate  = self
//                    
//                    cv.reloadData()
//                    
//                    
//                   
//                    
//                    
//               
//                }else{
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)
//                    
//                    
//                    
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    
//                    
//                    
//                    self.present(alert, animated: true, completion: nil)
//                    
//                    
//                    
//                    
//                }
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func pickCountry(ges : EducationCheckBoxGesture) {
//        
//        
//        
//        
//        
//        
//        
//        print("pickCountry")
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            drop_down.dataSource = country
//            
//            
//            
//            drop_down.anchorView = ges.countryView
//            
//            
//            
//            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//            
//            
//            
//            drop_down.show()
//            
//            
//            
//            
//            
//            
//            
//            country_data.forEach { (stateName) in
//                
//                
//                
//                
//                
//                
//                
//                //            country.append(stateName.countryName)
//                
//                
//                
//                countryID.append(stateName.idCountry)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                
//                
//                
//                print("Selected item: \(item) at index: \(index)")
//                
//                
//                
//                ges.countryTextField.text = item
//                
//                
//                
//                countryId = countryID[index]
//                
//                
//                
//                getStateList()
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        else{
//            
//            
//            
//            
//            
//            
//            
//            drop_down.dataSource = country
//            
//            
//            
//            drop_down.anchorView = ges.countryView
//            
//            
//            
//            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//            
//            
//            
//            drop_down.show()
//            
//            
//            
//            
//            
//            
//            
//            country_data.forEach { (stateName) in
//                
//                
//                
//                
//                
//                
//                
//                //            country.append(stateName.countryName)
//                
//                
//                
//                countryID.append(stateName.idCountry)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                
//                
//                
//                print("Selected item: \(item) at index: \(index)")
//                
//                
//                
//                ges.countryTextField.text = item
//                
//                
//                
//                countryId = countryID[index]
//                
//                
//                
//                getStateList()
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func pickState(ges : EducationCheckBoxGesture) {
//        
//        
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            
//            
//            
//            
//            
//            
//            drop_down.dataSource = state
//            
//            
//            
//            drop_down.anchorView = ges.stateView
//            
//            
//            
//            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//            
//            
//            
//            drop_down.show()
//            
//            
//            
//            state_data.forEach { (stateName) in
//                
//                
//                
//                
//                
//                
//                
//                //            state.append(stateName.stateName)
//                
//                
//                
//                stateIDArr.append(stateName.idState)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                
//                
//                
//                print("Selected item: \(item) at index: \(index)")
//                
//                editId = "1"
//                
//                ges.stateTextField.text = item
//                
//                
//                
//                stateId = stateIDArr[index]
//                
//                
//                
//                getDistrictList()
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        else{
//            
//            
//            
//            drop_down.dataSource = state
//            
//            
//            
//            drop_down.anchorView = ges.stateView
//            
//            
//            
//            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//            
//            
//            
//            drop_down.show()
//            
//            
//            
//            state_data.forEach { (stateName) in
//                
//                
//                
//                
//                
//                
//                
//                //            state.append(stateName.stateName)
//                
//                
//                
//                stateIDArr.append(stateName.idState)
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//            
//            
//            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                
//                
//                
//                print("Selected item: \(item) at index: \(index)")
//                
//                
//                
//                ges.stateTextField.text = item
//                
//                
//                
//                stateId = stateIDArr[index]
//                
//                
//                
//                getDistrictList()
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//            
//            
//        }
//        
//        
//        
//        
//    }
//    
// 
//    
//    @IBAction func pickDistrict(ges : EducationCheckBoxGesture) {
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        print("pickDistrict")
//        
//        
//        
//        drop_down.dataSource = district
//        
//        
//        
//        drop_down.anchorView = ges.districtView
//        
//        
//        
//        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//        
//        
//        
//        drop_down.show()
//        
//        
//        
//        
//        
//        district_data.forEach { (stateName) in
//            
//            
//            
//            
//            
//            
//            
//            district.append(stateName.districtName)
//            
//            
//            
//            districtIdArr.append(stateName.idDistrict)
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//            
//            
//            
//            print("Selected item: \(item) at index: \(index)")
//            
//            
//            
//            ges.districtTextField.text = item
//            
//            
//            
//            districtId = districtIdArr[index]
//            
//            getDistId = districtId
//            
//            
//            
//            
//            
//        }
//        
//        
//    }
//    
//    
//    
//    @IBAction func pickIntrestParticipate( ges: EducationCheckBoxGesture) {
//        
//        
//        
//        
//        drop_down.dataSource = supportStr
//        
//        
//        
//        drop_down.anchorView = ges.intrestedParticipateView
//        
//        
//        
//        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//        
//        
//        
//        drop_down.show()
//        
//        
//        
//        
//        
//        
//        
//        contributeSupportData.forEach { (support) in
//            
//            
//            
//            supportContentStr.append(support.content)
//            
//            
//            
//            
//            
//            
//            
//            supportIdArr.append(support.id)
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//            
//            
//            
//            print("Selected item: \(item) at index: \(index)")
//            
//            
//            
//            VolunteerDonorTextField.text = item
//            
//            
//            
//            IntrestedTextField.text = item
//            
//            
//            
//            supportId = supportIdArr[index]
//            
//            
//            
//        }
//        
//        
//    }
//    
//    
//    @IBAction func getSchoolList(ges : EducationCheckBoxGesture) {
//        
//        
//        
//        
//        
//        
//        
//        var keyWord = ges.schoolNameTextfield.text!
//        
//        
//        
//        let param : [String : Any] =
//        
//        
//        
//        [
//            
//            
//            
//            "keyword": ges.schoolNameTextfield.text!,
//            
//            
//            
//            "countryid": countryId!,
//            
//            
//            
//            "stateid": stateId!,
//            
//            
//            
//            "districtid" : getDistId!
//            
//            
//            
//        ]
//        
//        
//        
//        
//        
//        
//        
//        print(param)
//        
//        
//        
//        
//        
//        
//        
//        GetSchoolListRequest.call_request(param: param){ [self]
//            
//            
//            
//            (res) in
//            
//            
//            
//            
//            
//            
//            
//            let get_school_response : GetSchoolListResponse = Mapper<GetSchoolListResponse>().map(JSONString: res)!
//            
//            
//            
//            
//            
//            
//            
//            if get_school_response.status == true {
//                
//                
//                
//                //                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
//                
//                
//                
//                //                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
//                
//                
//                
//                
//                
//                
//                
//                school_list_data = get_school_response.data
//                
//                
//                
//                print("School List")
//                drop_down.dataSource = schoolList
//                drop_down.anchorView = ges.schoolView
//                drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//                drop_down.show()
//                
//                print("school_list_data",school_list_data.count)
//                
//                
//                school_list_data.forEach { (stateName) in
//                    schoolList.append(stateName.schoolName)
//                    schoolListIDarr.append(stateName.schoolId)
//                }
//                
//                drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print("Selected item: \(item) at index: \(index)")
//                    ges.schoolNameTextfield.text = item
//                    getSchoolId = schoolListIDarr[index]
//                    //            getSchoolList()
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                var myaryy : [String] = []
//                
//                
//                
//                for i in get_school_response.data{
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    myaryy.append(i.schoolName)
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    school.append(i.schoolName)
//                    
//                    
//                    
//                }
//                
//                
//                
//                school_list_data.forEach { (stateName) in
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    //                    school.append(stateName.schoolName)
//                    
//                    
//                    
//                    schoolIdArr.append(stateName.schoolId)
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                drop_down.dataSource = myaryy
//                
//                
//                
//                drop_down.anchorView = ges.schoolView
//                
//                
//                
//                drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//                
//                
//                
//                drop_down.show()
//                
//                
//                
//                
//                
//                
//                
//                drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//                    
//                    
//                    
//                    print("Selected item: \(item) at index: \(index)")
//                    
//                    
//                    
//                    ges.schoolNameTextfield.text = item
//                    
//                    
//                    
//                    schoolNameLbl.text = item
//                    
//                    
//                    
//                    schoolId = schoolIdArr[index]
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                //                    let defaults = UserDefaults.standard
//                
//                
//                
//                ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
//                
//                
//                
//                //                    let vc = LoginViewController(nibName: nil, bundle: nil)
//                
//                
//                
//                //                    vc.modalPresentationStyle = .fullScreen
//                
//                
//                
//                //                    self.present(vc, animated: true, completion: nil)
//                
//                
//                
//                //                }
//                
//                
//                
//            }else{
//                
//                
//                
//                
//                
//                
//                
//                let alert = UIAlertController(title: "Alert", message: get_school_response.message, preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                self.present(alert, animated: true, completion: nil)
//                
//                
//                
//                
//                
//                
//                
//                //
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @IBAction func getStateList() {
//        
//        
//        print("statesssssssss")
//        
//        
//        
//        let param : [String : Any] =
//        
//        
//        
//        [
//            
//            
//            
//            "countryId": countryId
//            
//            
//            
//            
//            
//            
//            
//        ]
//        
//        
//        
//        
//        
//        
//        
//        GetStateListCountryIdRequest.call_request(param: param){ [self]
//            
//            
//            
//            (res) in
//            
//            
//            
//            
//            
//            
//            
//            let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!
//            
//            
//            
//            
//            
//            
//            
//            if state_response.status == true {
//                
//                
//                
//                state_data = state_response.data
//                
//                
//                for i in state_response.data{
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    state.append(i.stateName)
//                    
//                    //                        stateId = i.idState
//                    
//                    
//                    
//                }
//                
//                      
//                
//            }else{
//                
//                
//                
//                
//                
//                
//                
//                let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                self.present(alert, animated: true, completion: nil)
//                
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//    }
//    
//    
//    
//    @IBAction func getCountryList() {
//        
//        
//        
//        GetAllCountryListRequest.call_request(){
//            
//            
//            
//            (res) in
//            
//            
//            
//            
//            
//            
//            
//            let country_response : GetCountryListResponse = Mapper<GetCountryListResponse>().map(JSONString: res)!
//            
//            
//            
//            
//            
//            
//            
//            if country_response.status == true {
//                
//                
//                
//                //                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
//                
//                
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
//                    
//                    
//                    
//                    
//                    country_data = country_response.data
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    for i in country_response.data{
//                        
//                        
//                        
//                        country.append(i.countryName)
//                        
//                        
//                        
//                        
//                        countryNameEdit.append(i.countryName)
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    print("country_response.data",country_response.data)
//                    
//                    
//                    
//                    //                    let defaults = UserDefaults.standard
//                    
//                    
//                    
//                    ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
//                    
//                    
//                    
//                    //                    let vc = LoginViewController(nibName: nil, bundle: nil)
//                    
//                    
//                    
//                    //                    vc.modalPresentationStyle = .fullScreen
//                    
//                    
//                    
//                    //                    self.present(vc, animated: true, completion: nil)
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    if ChangeEducationalDetail == 1 {
//                        
//                        
//                        getEducational()
//                        
//                        //                            }else{
//                        //                                getStateList()
//                    }
//                    
//                    
//                    
//                }
//                
//                
//                
//            }else{
//                
//             
//                
//                
//            }
//            
//            
//            
//        }
//        
//        
//        
//    }
//    
//    
//    
//    @IBAction func classPassedOutVc(ges : EducationCheckBoxGesture) {
//        
//        
//        print("drop")
//        
//        
//        drop_down.anchorView = ges.classPassedOutView
//        
//        
//        
//        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//        
//        
//        
//        drop_down.show()
//        
//        
//        
//        
//        
//        
//        
//        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//            
//            
//            
//            print("Selected item: \(item) at index: \(index)")
//            
//            
//            
//            ges.classPassedOutTextField.text = item
//            
//            
//            
//        }
//        
//        
//        
//        drop_down.dataSource =  [
//            
//            
//            
//            "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",
//            
//            "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",
//            
//            "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",
//            
//            "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",
//            
//            "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",
//            
//            "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",
//            
//            "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",
//            
//            "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",
//            
//            "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"]
//        
//        //                classPassedOut.optionArray =
//        
//        
//        
//        ////        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",
//        
//        
//        
//        ////                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",
//        
//        
//        
//        ////                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"
//        
//        
//        
//        ////                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"
//        
//        
//        
//        ////                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"
//        
//        
//        
//        ////                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"
//        
//        
//        
//        ////                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"
//        
//        
//        
//        //        [
//        
//        
//        
//        //                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",
//        
//        
//        
//        //                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",
//        
//        
//        
//        //                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",
//        
//        
//        
//        //                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",
//        
//        
//        
//        //                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",
//        
//        
//        
//        //                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",
//        
//        
//        
//        //                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",
//        
//        
//        
//        //                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",
//        
//        
//        
//        //                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"
//        
//        
//        
//        //                                     ]
//        
//        
//        
//        //                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070
//        
//        
//        
//        //                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080
//        
//        
//        
//        //                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090
//        
//        
//        
//        //                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100
//        
//        
//        
//        //              ]
//        
//        
//        
//    }
//    
//    
//    @IBAction func yearPassedOutVc(ges : EducationCheckBoxGesture) {
//        
//        print("drop")
//        
//        
//        drop_down.anchorView = ges.yearPassedOutView
//        
//        
//        
//        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
//        
//        
//        
//        drop_down.show()
//        
//        
//        
//        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
//            
//            
//            
//            print("Selected item: \(item) at index: \(index)")
//            
//            
//            
//            ges.yearPassedOutTextField.text = item
//            
//            
//            
//        }
//        
//        
//        
//        drop_down.dataSource =  [
//            
//            
//            
//            "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",
//            
//            
//            "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",
//            
//            
//            "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",
//            
//            "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",
//            
//            "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",
//            
//            "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",
//            
//            "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",
//            
//            "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",
//            
//            "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"]
//        
//        
//        
//        //                classPassedOut.optionArray =
//        
//        
//        
//        ////        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",
//        
//        
//        
//        ////                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",
//        
//        
//        
//        ////                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"
//        
//        
//        
//        ////                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"
//        
//        
//        
//        ////                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"
//        
//        
//        
//        ////                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"
//        
//        
//        
//        ////                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"
//        
//        
//        
//        //        [
//        
//        
//        
//        //                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",
//        
//        
//        
//        //                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",
//        
//        
//        
//        //                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",
//        
//        
//        
//        //                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",
//        
//        
//        
//        //                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",
//        
//        
//        
//        //                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",
//        
//        
//        
//        //                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",
//        
//        
//        
//        //                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",
//        
//        
//        
//        //                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"
//        
//        
//        
//        //                                     ]
//        
//        
//        
//        //                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070
//        
//        
//        
//        //                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080
//        
//        
//        
//        //                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090
//        
//        
//        
//        //                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100
//        
//        
//        
//        //              ]
//        
//        
//        
//    }
//    
//    
//    @IBAction func addRows(ges : EducationCheckBoxGesture) {
//        
//        
//        
//        print("addRows")
//        
//        if ges.countryTextField.text != ""{
//            
//            
//            if ges.stateTextField.text != ""{
//                
//                
//                if ges.schoolNameTextfield.text != ""{
//                    
//                    
//                    if ges.yearPassedOutTextField.text != ""{
//                        
//                        
//                        if ges.classPassedOutTextField.text != ""{
//                            
//                            
//                            
//                            editId = "1"
//                            
//                            
//                            var a = ges.classPassedOutTextField.text!
//                            
//                            
//                            
//                            var b = ges.yearPassedOutTextField.text!
//                            
//                            
//                            
//                            rowsId += [1]
//                            
//                            
//                            
//                            
//                            print("rowsId",rowsId)
//                            
//                            
//                            
//                            cv.dataSource  = self
//                            
//                            
//                            
//                            cv.delegate = self
//                            
//                            
//                            
//                            countryText = ges.countryTextField.text
//                            
//                            
//                            
//                            stateText = ges.stateTextField.text
//                            
//                            
//                            schoolNameText = ges.schoolNameTextfield.text
//                            
//                            
//                            
//                            //                                        yearJoinedText = ges.yearJoinedTxtField.text
//                            
//                            
//                            
//                            yearPassedOutText = ges.yearPassedOutTextField.text
//                            
//                            
//                            
//                            classPassedOutText = ges.classPassedOutTextField.text
//                            
//                            
//                            
//                            schoolNameArr.append(schoolNameText)
//                            
//                            
//                            
//                            cv.reloadData()
//                            
//                            
//                            
//                            
//                            
//                            
//                            
//                            //                                    }else{
//                            
//                            
//                            
//                            //                                        print("addRows1")
//                            
//                            
//                            
//                            //                                        let alert = UIAlertController(title: "Alert", message: "Class", preferredStyle: UIAlertController.Style.alert)
//                            
//                            
//                            
//                            //                                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                            
//                            
//                            
//                            //                                        self.present(alert, animated: true, completion: nil)
//                            
//                            
//                            
//                            //                                    }
//                            
//                            
//                            
//                        }else{
//                            
//                            
//                            
//                            print("addRows2")
//                            
//                            
//                            
//                            let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                            
//                            
//                            
//                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                            
//                            
//                            
//                            self.present(alert, animated: true, completion: nil)
//                            
//                            
//                            
//                        }
//                        
//                        
//                        
//                    }else{
//                        
//                        
//                        
//                        print("addRows3")
//                        
//                        
//                        
//                        let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                        
//                        
//                        
//                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                        
//                        
//                        
//                        self.present(alert, animated: true, completion: nil)
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                    //                        }else{
//                    
//                    
//                    
//                    //                            let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                    
//                    
//                    
//                    //                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    
//                    
//                    
//                    //                            self.present(alert, animated: true, completion: nil)
//                    
//                    
//                    
//                    //                        }
//                    
//                    
//                    
//                }else{
//                    
//                    
//                    
//                    print("addRows4")
//                    
//                    
//                    
//                    let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                    
//                    
//                    
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    
//                    
//                    
//                    self.present(alert, animated: true, completion: nil)
//                    
//                    
//                    
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//            }else{
//                
//                
//                
//                print("addRows6")
//                
//                
//                
//                let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//                
//                
//                
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                
//                
//                
//                self.present(alert, animated: true, completion: nil)
//                
//                
//                
//            }
//            
//            
//            
//        }else{
//            
//            
//            
//            print("addRows7")
//            
//            
//            
//            let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//            
//            
//            
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//            
//            
//            
//            self.present(alert, animated: true, completion: nil)
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            
//            
//            //            print("changeEducationalData.count",profileInstituteList.count)
//            
//            
//            
//            if editId == "1"{
//                
//                
//                
//                
//                
//                
//                
//                return profileInstituteList.count+rowsId.count-1
//                
//                
//                
//                
//                
//                
//                
//            }else{
//                
//                
//                
//                
//                
//                
//                
//                return profileInstituteList.count
//                
//                
//                
//                
//                
//                
//                
//            }
//            
//            
//            
//        }else{
//            
//            
//            
//            return rowsId.count
//            
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        return 0
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            
//            
//            
//            
//            
//            
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier , for: indexPath) as! EducationCollectionViewCell
//            
//            
//            
//            cell.newSchoolListView.isHidden = true
//            
//            cell.didnLbl.isHidden = true
//            
//            
//            
//            
//            
//            
//            
//            if editId == "1"{
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))
//                
//                
//                
//                countryGesture.countryTextField = cell.countryTextField
//                
//                
//                
//                countryGesture.countryView = cell.countryView
//                
//                
//                
//                cell.countryView.addGestureRecognizer(countryGesture)
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))
//                
//                
//                
//                stateGesture.stateTextField = cell.stateTextField
//                
//                
//                
//                stateGesture.stateView = cell.stateView
//                
//                
//                
//                cell.stateView.addGestureRecognizer(stateGesture)
//                
//                
//                
//                
//                
//                
//                
//                let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))
//                
//                
//                
//                schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//                
//                
//                
//                schoolListGesture.schoolView = cell.schoolListView
//                
//                
//                
//                cell.schoolListView.addGestureRecognizer(schoolListGesture)
//                
//                
//                
//                
//                
//                let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))
//                
//                
//                
//                districtGesture.districtTextField = cell.districtTextField
//                
//                
//                
//                districtGesture.districtView = cell.districtView
//                
//                
//                
//                cell.districtView.addGestureRecognizer(districtGesture)
//                
//                
//                
//                
//                
//                
//                
//                
//                
//
//                
//                
//                
//                
//                let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))
//                
//               
//                
//                
//                nextView.addGestureRecognizer(tapGesture)
//                
//                
//                
//                
//               
//                
//                let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))
//                
//                
//                
//                addSchoolListGesture.countryTextField = cell.countryTextField
//                
//                
//                
//                addSchoolListGesture.stateTextField = cell.stateTextField
//                
//                
//                
//                addSchoolListGesture.districtTextField = cell.districtTextField
//                
//                
//                
//                addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//                
//                
//                
//                //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField
//                
//                
//                
//                addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//                
//                
//                
//                addSchoolListGesture.classPassedOutTextField = cell.classPassedOutTextField
//                
//                
//                
//                //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField
//                
//                
//                
//
//                addSchoolView.addGestureRecognizer(addSchoolListGesture)
//                
//                
//            }else{
//                
//                
//                
//                print("changeEducationalData.count",profileInstituteList.count)
//                
//                
//                cell.countryTextField.delegate = self
//                
//                
//                
//                cell.stateTextField.delegate = self
//                
//                
//                
//                cell.schoolNameTextfield.delegate = self
//                
//                
//                cell.highClassTextField.delegate = self
//                
//
//                //           var edu : ProfileGetEducationDetail  = changeEducationalData[indexPath.row]
//                
//                
//                if indexPath.row == 0{
//                    
//                    
//                    cell.RemoveView.isHidden = true
//                    
//                }
//                
//                
//                
//                else{
//                    
//                    cell.RemoveView.isHidden = false
//                    
//                }
//                
//                
//                var institute : ProfileGetInstituteList  = profileInstituteList[indexPath.row]
//                
//                cell.schoolNameTextfield.text = institute.institute_name
//                
//                
//                
//                cell.yearPassedOutTextField.text = String(institute.year_passed_out)
//                
//                
//                
//                cell.highClassTextField.text = institute.class_passed_out
//                
//                
//                
//
//                
//                
//                cell.classPassedOutTextField.text = String(institute.year_joined)
//                
//                
//                let modl = EducationDataDetailModal()
//                
//                
//                modl.class_joined = institute.class_joined
//                
//                
//                
//                modl.class_passed_out = institute.class_passed_out
//                
//                
//                
//                modl.institute_id = institute.institute_id
//                
//                
//                
//                modl.year_joined = institute.year_joined
//                
//                
//                
//                modl.year_passed_out = Int(institute.year_passed_out)
//                
//                
//                AllModalVale.append(modl)
//                
//                for i in country_data{
//                    
//                    
//                    
//                    print("countryNameEdit111111",i.idCountry)
//                    
//                    
//                    
//                    if i.idCountry == institute.country_id{
//                        
//                        
//                        
//                        print("countryNameEdit222222222",institute.country_id)
//                        
//                        
//                        
//                        print("countryNameEdi33333",i.countryName)
//                        
//                        
//                        
//                        cell.countryTextField.text = i.countryName
//                        
//                        
//                    }
//                    
//                    
//                }
//                
//                
////                for i in state_data{
////                    
////                    
////                    
////                    if i.idState == institute.state_id{
////                        
////                        
////                        stateId = institute.state_id
////                        
////                        cell.stateTextField.text = i.stateName
////                        
////                        
////                    }
////                    
////                }
////                
////                
////                
////                print("state_datastate_data",state_data)
////                
////                print("Celledistrict_data",district_data)
////                
////                
////                
////                for i in district_data{
////                    
////                    
////                    
////                    print("district_datadistrict_data",i.districtName)
////                    
////                    
////                    
////                    if i.idDistrict == institute.district_id{
////                        
////                        cell.districtTextField.text = i.districtName
////                        
////                        
////                    }
////                    
////                    
////                }
//                
//                
//                
//                for i in state_data{
//
//
//
//                    
//
//
//
//                    if i.idState == institute.state_id{
//
//
//
//                        
//
//                        stateId = institute.state_id
//
//                        
//
//
//
//                        cell.stateTextField.text = i.stateName
//
//
//
//                        
//
//
//
//                    }
//
//
//
//                    
//
//
//
//                }
//
//                            
//                print("country_data1111",country_data)
//                            print("state_datastate_data",state_data)
//
//                            print("Celledistrict_data",district_data)
//
//                
//
//                            for i in district_data{
//
//
//
//                                print("district_datadistrict_data",i.districtName)
//
//
//
//                                if i.idDistrict == institute.district_id{
//
//
//
//                                    
//
//
//
//                                    
//
//
//
//                                    cell.districtTextField.text = i.districtName
//
//
//
//                                    
//
//
//
//                                }
//
//
//
//                                
//
//
//
//                            }
//
//
//
//                            
//
//
//
//                            
//
//                
//                
//                let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))
//                
//                
//                
//                countryGesture.countryTextField = cell.countryTextField
//                
//                
//                
//                countryGesture.countryView = cell.countryView
//                
//                
//                
//                cell.countryView.addGestureRecognizer(countryGesture)
//                
//                
//                let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))
//                
//                
//                
//                stateGesture.stateTextField = cell.stateTextField
//                
//                
//                
//                stateGesture.stateView = cell.stateView
//                
//                
//                
//                cell.stateView.addGestureRecognizer(stateGesture)
//                
//                let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))
//                
//                
//                
//                schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//                
//                
//                
//                schoolListGesture.schoolView = cell.schoolListView
//                
//                
//                
//                cell.schoolListView.addGestureRecognizer(schoolListGesture)
//                
//                
//                let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))
//                
//                
//                
//                districtGesture.districtTextField = cell.districtTextField
//                
//                
//                
//                districtGesture.districtView = cell.districtView
//                
//                
//                
//                cell.districtView.addGestureRecognizer(districtGesture)
//                
//                
//                let saveViews = EducationCheckBoxGesture(target: self, action: #selector(saveVc))
//                
//                
//                
//                saveViews.classPassedOutTextField = cell.classPassedOutTextField
//                
//                
//                
//                //            tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField
//                
//                
//                
//                saveViews.yearPassedOutTextField = cell.yearPassedOutTextField
//                
//                
//                
//
//                
//                
//                cell.saveView.addGestureRecognizer(saveViews)
//                
//                
//                let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))
//                
//                
//                
//                //            tapGesture.classPassedOutTextField = cell.classPassedOutTextField
//                
//                
//                
//                //            //        tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField
//                
//                
//                
//                //            tapGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//                
//                
//                
//
//                
//                
//                //        tapGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField
//                
//                
//                
//                nextView.addGestureRecognizer(tapGesture)
//                
//                let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))
//                
//                
//                
//                addSchoolListGesture.countryTextField = cell.countryTextField
//                
//                
//                
//                addSchoolListGesture.stateTextField = cell.stateTextField
//                
//                
//                
//                //        addSchoolListGesture.districtTextField = cell.districtTextField
//                
//                
//                
//                addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//                
//                
//                
//                //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField
//                
//                
//                
//                addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//                
//                
//                
//                addSchoolListGesture.classPassedOutTextField = cell.classPassedOutTextField
//                
//                
//                
//                //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField
//                
//                
//                
//
//                
//                
//                addSchoolView.addGestureRecognizer(addSchoolListGesture)
//                
//                
//                cell.btns.tag = indexPath.row
//                
//                
//                
//                cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)
//                
//                
//            }
//            
//                        return cell
//            
//            
//        }else{
//            
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier , for: indexPath) as! EducationCollectionViewCell
//            
//            
//            
//            
//            cell.newSchoolListView.isHidden = false
//            
//            cell.didnLbl.isHidden = false
//            
//            
//            cell.countryTextField.delegate = self
//            
//            
//            
//            cell.stateTextField.delegate = self
//            
//            
//            
//            cell.schoolNameTextfield.delegate = self
//            
//            
//            
//            //        districtTextField.delegate = self
//            
//            
//            
//            cell.highClassTextField.delegate = self
//            
//            
//            
//
//            
//            
//            
//            
//            
//            
//            if indexPath.row == 0{
//                
//                
//                
//                
//                
//                
//                
//                cell.RemoveView.isHidden = true
//                
//                
//                
//            }
//            
//            
//            
//            else{
//                
//                
//                
//                
//                
//                
//                
//                cell.RemoveView.isHidden = false
//                
//                
//                
//            }
//            
//            let newSchoolGesture = UITapGestureRecognizer(target: self, action: #selector(clickHereAction))
//            
//            
//            
//            cell.newSchoolListView.addGestureRecognizer(newSchoolGesture)
//            
//            
//            let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))
//            
//            
//            
//            addSchoolListGesture.countryTextField = cell.countryTextField
//            
//            
//            
//            addSchoolListGesture.stateTextField = cell.stateTextField
//            
//            
//            
//            //        addSchoolListGesture.districtTextField = cell.districtTextField
//            
//            
//            
//            addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//            
//            
//            
//            //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField
//            
//            
//            
//            addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//            
//            
//            
//            addSchoolListGesture.classPassedOutTextField = cell.classPassedOutTextField
//            
//            
//            
//            //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField
//            
//            
//            
//          d
//            
//            
//            
//            addSchoolView.addGestureRecognizer(addSchoolListGesture)
//            
//            
//            let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))
//            
//            
//            
//            countryGesture.countryTextField = cell.countryTextField
//            
//            
//            
//            countryGesture.countryView = cell.countryView
//            
//            
//            
//            cell.countryView.addGestureRecognizer(countryGesture)
//            
//            
//            let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))
//            
//            
//            
//            stateGesture.stateTextField = cell.stateTextField
//            
//            
//            
//            stateGesture.stateView = cell.stateView
//            
//            
//            
//            cell.stateView.addGestureRecognizer(stateGesture)
//            
//            
//            let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))
//            
//            
//            
//            districtGesture.districtTextField = cell.districtTextField
//            
//            
//            
//            districtGesture.districtView = cell.districtView
//            
//            
//            
//            cell.districtView.addGestureRecognizer(districtGesture)
//           
//            
//            let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))
//            
//            
//            
//            schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield
//            
//            
//            
//            schoolListGesture.schoolView = cell.schoolListView
//            
//            
//            
//            cell.schoolListView.addGestureRecognizer(schoolListGesture)
//            
//            
//            
//            
//            
//            
//            
//            let pickIntrestGesture = EducationCheckBoxGesture(target: self, action: #selector(pickIntrestParticipate))
//            
//            
//            
//            pickIntrestGesture.intrestedParticipateTextField = IntrestedTextField
//            
//            
//            
//            pickIntrestGesture.intrestedParticipateView = intrestView
//            
//            
//            
//            intrestView.addGestureRecognizer(pickIntrestGesture)
//            
//            let classPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(classPassedOutVc))
//            
//            
//            
//            classPassedOutGesture.classPassedOutTextField = cell.classPassedOutTextField
//            
//            
//            
//            classPassedOutGesture.classPassedOutView = cell.classPassedOutView
//            
//            
//            
//            cell.classPassedOutView.addGestureRecognizer(classPassedOutGesture)
//               
//            let yearPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(yearPassedOutVc))
//            
//            
//            
//            yearPassedOutGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//            
//            
//            
//            yearPassedOutGesture.yearPassedOutView = cell.yearPassedOutView
//            
//            
//            
//            cell.yearPassedOutView.addGestureRecognizer(yearPassedOutGesture)
//            
//            
//            
//            
//            
//            
//            
//            let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))
//            
//            
//            
//            tapGesture.classPassedOutTextField = cell.classPassedOutTextField
//     
//            tapGesture.yearPassedOutTextField = cell.yearPassedOutTextField
//            
//            
//            
//
//            
//            
//            nextView.addGestureRecognizer(tapGesture)
//            
//     
//    
//            cell.btns.tag = indexPath.row
//            
//            
//            
//            cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)
//            
//            
//            
//            return cell
//            
//            
//            
//        }
//        
//        
//    }
//    
//    
//    
//    @IBAction func saveVc(gest : EducationCheckBoxGesture){
//        
//        editId = "1"
//        
//        
//        
//        let modl = EducationDataDetailModal()
//        
//        
//        modl.class_joined = gest.classJoinedTextField.text
//        
//        
//        
//        modl.class_passed_out = gest.classPassedOutTextField.text
//        
//        
//        
//        modl.institute_id = 2
//        
//        
//        
//        modl.year_joined = 20
//        
//        
//        
//        modl.year_passed_out = Int(gest.yearPassedOutTextField.text!)
//        
//        
//        AllModalVale.append(modl)
//        
//        
//        print("AllModalValeAllModalVale",AllModalVale.count)
//        
//        
//    }
//    
//    
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        
//        
//        return CGSize(width: 389, height: 485)
//        
//        
//        
//    }
//   
//    
//    @objc func handleRegister(_ sender: UIButton){
//        
//        
//        
//        if ChangeEducationalDetail == 1 {
//            
//            profileInstituteList.remove(at: sender.tag)
//            
//        }else{
//            
//            rowsId.remove(at:sender.tag)
//            
//            
//            
//        }
//        
//        
//    
//        cv.deleteItems(at: [IndexPath(row:sender.tag,section:0)])
//        
//      
//    }
//    
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        
//        
//        return 400
//        
//        
//        
//    }
//    
//
//    
//}
//
//
//class EducationCheckBoxGesture : UITapGestureRecognizer {
//   
//    var tapView : UIView!
//    
//    var currentDesingnation : UITextField!
//    
//    var yesNoLbl : UILabel!
//    
//    var schoolNameTextfield : UITextField!
//    
//    var currentDesingnationStr : String!
//    
//    
//    
//    var schoolNameStr : String!
//    
//    
//    
//    var countryTextField : UITextField!
//    
//    
//    
//    var stateTextField : UITextField!
//    
//    
//    
//    var districtTextField : UITextField!
//    
//    
//    
//    
//    
//    
//    
//    var classPassedOutTextField : UITextField!
//    
//    
//    
//    var yearPassedOutTextField : UITextField!
//    
//    
//    var yearJoinedTextField : UITextField!
//    var intrestedParticipateTextField : UITextField!
//    
//    
//    
//    var stateView : UIView!
//    
//    
//    
//    var countryView : UIView!
//    
//    
//    
//    var schoolView : UIView!
//    
//    
//    
//    var districtView : UIView!
//    
//    
//    
//    var classJoinedTextField : UITextField!
//    
//    
//    
//    var intrestedParticipateView : UIView!
//    
//    
//    
//    var classPassedOutView : UIView!
//    
//    
//    
//    var yearPassedOutView : UIView!
//    
//    
//    
//    var yearJoinedView : UIView!
//    
//    
//    
//    var highClassView : UIView!
//    
//    
//    
//    var classLbl : UILabel!
//    
//    
//    
//    var highClassLbl : UILabel!
//    
//    
//}
//
//
//class DeleteRowClcik : UITapGestureRecognizer{
//    
//    var deleteIndex : Int!
//    
//}
//
//
//
//


    @IBAction func backVc() {



              dismiss(animated: true)



          }



          



          @objc func keyboardWillShow(notification: NSNotification) { // -----> to set key board set height



              



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



          



          @IBAction func clickHereAction() {



              



              let storyboard = UIStoryboard(name: "SchoolDetailStoryboard", bundle: nil)



              let viewController = storyboard.instantiateInitialViewController() as! SchoolDetailViewController



              self.present(viewController, animated: true)



              



          }



          



          



          



          @IBAction func getContributrSupport() {



              



              



           



              print("token",token)



              SupportListRequest.call_request(token: token){ [self]



                  (res) in



                  



                  let contributeModalRes : getContributeSupportList = Mapper<getContributeSupportList>().map(JSONString: res)!



                  



                  if contributeModalRes.status == true {



                      



                      contributeSupportData = contributeModalRes.data



                      



                      for i in contributeModalRes.data {



                          supportStr.append(i.supportName)



                      }



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



          



          



          



          



          



//          @IBAction func nextVc( ges : EducationCheckBoxGesture) {
//
//
//
//              
//
//
//
//              print("nextWorking")
//
//
////
////              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier , for: indexPath) as! EducationCollectionViewCell
////
////              
////              
////              cell.
////
//
//
//              //        var schoolNameArr : String!
//
//
//
//              
//
//
//
//              //
//
//
//
//              
//
//print("NextChangeEducationalDetail",ChangeEducationalDetail)
//
//              print("NexteditId",editId)
//
//
//
//              if ChangeEducationalDetail == 1 {
//
//                  if editId == "1"{
//
//
//                  var aryy :  [AlumniInstituteEducationDetailModal] = []
//
//
//
//                      
//                      
//                      for i in contryNameArr {
//                          print("COUNTRY",i)
//                      }
//                      
//                      
//                      for i in stateNameArr {
//                          print("STATE",i)
//                      }
//                      
//                      
//                      for i in districtNameArr {
//                          print("DISTRICT",i)
//                      }
//                      
//                      
//                      for i in InstituteNameArr {
//                          print("INSTITUTE",i)
//                      }
//                      
//                      
//                      
//                      for i in classPassedOutNameArr {
//                          print("PASSEDOUT",i)
//                      }
//                      
//                      
//                      for i in classJoinedNameArr {
//                          print("JOINED",i)
//                      }
//                      
//                      
//                      
//                      
//                      
//                      
//                      
//                      
//                      
//                      
//                      for i in existingcontryNameArr {
//                          print("existingcontryNameArr12",i)
//                          
//                          
//                         
//
//                          
//                      }
//                      
//                      
//                      for i in existingstateNameArr {
//                          print("existingstateNameArr12",i)
//                      }
//                      
//                      
//                      for i in existingdistrictNameArr {
//                          print("existingdistrictNameArr12",i)
//                          
//                          
//                          
////                          alumniInstituteEdu.institute_id = AllModalVale[i].institute_id
////
////
////
////                          alumniInstituteEdu.class_joined = AllModalVale[i].class_joined
////
////
////
////                          alumniInstituteEdu.year_joined = AllModalVale[i].year_joined
////
////
////
////                          alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out
////
////
////
////                          alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out
//
//
//                          
//                          
//                      }
//                      
//                      
//                      for i in existingInstituteNameArr {
//                          print("existingInstituteNameArr12",i)
//                      }
//                      
//                      
//                      
//                      for i in existingclassJoinedNameArr {
//                          print("existingclassJoinedNameArr12",i)
//                      }
//                      
//                      
//                      print("BforeexistingyearPassedOutNameArr12",existingclassPassedOutNameArr)
//                      for i in existingclassPassedOutNameArr {
//                          print("existingyearPassedOutNameArr12",i)
//                      }
//                      
//                      for i in existingyearJoinedNameArr {
//                          print("existingyearJoinedNameArr12",i)
//                      }
//                      
//                      
//                      
//                      
////                      let arrayOfArrays = [existingstateNameArr, existingcontryNameArr, existingdistrictNameArr, existingInstituteNameArr,   existingyearJoinedNameArr,existingyearPassedOutNameArr]
////
////                      for innerArray in arrayOfArrays {
////                          for element in innerArray {
////                              print("element",element)
////                          }
////                      }
////                      
//                      
//                      
////                      
////                      let array1 = [1, 2, 3]
////                      let array2 = ["a", "b", "c"]
////                      let array3 = [true, false, true]
////                      let array4 = ["x", "y", "z"]
////                      let array5 = [4.5, 6.7, 8.9]
////                      let array6 = [100, 200, 300]
////                      let array7 = ["apple", "banana", "orange"]
//
//                      // Zip the arrays together and iterate over the zipped sequence
//                      var combinedArray: [CombinedElements] = []
////                      for i in 0..<min(existingstateNameArr.count, existingcontryNameArr.count, existingdistrictNameArr.count, existingInstituteNameArr.count, existingclassJoinedNameArr.count, existingclassPassedOutNameArr.count, existingyearJoinedNameArr.count,existingyearPassedOutNameArr.count) {
////                          let combinedElement = CombinedElements(existingcontryNameArr: existingcontryNameArr[i], existingdistrictNameArr: existingdistrictNameArr[i], existingstateNameArr:existingstateNameArr [i], existingInstituteNameArr: existingInstituteNameArr[i], existingclassJoinedNameArr: existingclassJoinedNameArr[i], existingclassPassedOutNameArr: existingclassPassedOutNameArr[i], existingyearJoinedNameArr: existingyearJoinedNameArr[i],existingyearPassedOutNameArr: existingyearPassedOutNameArr[i])
////                          combinedArray.append(combinedElement)
////                          
////                          print("aryyacombinedArraycombinedArrayryyaryy",combinedArray)
////                          
////                      }
//                      print("ElementexistingyearJoinedNameArr",existingyearJoinedNameArr)
//
//                      // Iterate over the combined array and access elements from each array simultaneously
////                      for combinedElement in combinedArray {
////                          print("Element from existingcontryNameArr: \(combinedElement.existingcontryNameArr)")
////                          print("Element from existingdistrictNameArr: \(combinedElement.existingdistrictNameArr)")
////                          print("Element from existingstateNameArr: \(combinedElement.existingstateNameArr)")
////                          print("Element from existingInstituteNameArr: \(combinedElement.existingInstituteNameArr)")
////                          print("Element from existingclassJoinedNameArr: \(combinedElement.existingclassJoinedNameArr)")
////                          print("Element from existingclassPassedOutNameArr: \(combinedElement.existingclassPassedOutNameArr)")
////                          print("Element from existingyearJoinedNameArr: \(combinedElement.existingyearJoinedNameArr)")
////                          print("Element from existingyearPassedOutNameArr: \(combinedElement.existingyearPassedOutNameArr)")
////                          
//////                          let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//////
//////
//////
//////                          //        for i in schoolNameArr {
//////
//////
//////
//////                          alumniInstituteEdu.institute_id = Int(combinedElement.existingInstituteNameArr)
//////
//////
//////
//////                          alumniInstituteEdu.class_joined = combinedElement.existingclassJoinedNameArr
//////
//////
//////
//////                          alumniInstituteEdu.year_joined = combinedElement.existingyearJoinedNameArr
//////
//////
//////
//////                          alumniInstituteEdu.class_passed_out = combinedElement.existingclassPassedOutNameArr
//////
//////
//////
//////                          alumniInstituteEdu.year_passed_out = combinedElement.existingyearPassedOutNameArr
//////
//////
//////
//////                          
//////
//////
//////
//////                          aryy.append(alumniInstituteEdu)
//////
//////print("aryyaryyaryy",aryy)
////                          
//////                          print("alumniInstituteEdu",alumniInstituteEdu)
////                                                    
////                          
////                          
////                          
////                      }
//                      
//                      
//                      
////                  for i in 0..<AllModalVale.count{
////
////
////                      
////
////
////
////                      let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
////
////
////
////                      //        for i in schoolNameArr {
////
////
////
////
////
////
////                      aryy.append(alumniInstituteEdu)
////
////
////
////                  }
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//                      for i in 0..<Constant.DefaultsKeys.AllModalVale.count{
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//
//
//
//                          //        for i in schoolNameArr {
//
//
//
//                          alumniInstituteEdu.institute_id = Constant.DefaultsKeys.InstuteId
//
//
//
//                          alumniInstituteEdu.class_joined = Constant.DefaultsKeys.AllModalVale[i].class_joined
//
//
//
//                          alumniInstituteEdu.year_joined = Constant.DefaultsKeys.YearJoined
//
//
//
//                          alumniInstituteEdu.class_passed_out = Constant.DefaultsKeys.AllModalVale[i].class_passed_out
//
//                        
//
//                          alumniInstituteEdu.year_passed_out = Constant.DefaultsKeys.YearPassedOut
//
//
//
//                          
//
//
//
//                          aryy.append(alumniInstituteEdu)
//
//
//
//                      }
//
//
//
//
//                  
//
//
//
//                  let alumniInstituteModal = AlumniEducationDetailModal()
//
//
//
//                  alumniInstituteModal.institute_list = aryy
//
//
//
//                  alumniInstituteModal.participation_interest = IntrestedTextField.text
//
//
//
//                  
//
//
//
//                  //
//
//
//
//                  
//
//
//
//                  var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//
//
//
//                  print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//
//
//
//                  print("token",token)
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
////                      UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {
////
////
////
////                          
////
////
////
////                          [self] (res) in
////
////
////
////                          
////
////
////
////                          let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
////
////
////
////                          
////
////
////
////                          
////
////
////
////                          if schoolRegRes.status == true {
////
////
////
//////                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//////
//////
//////
//////                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//////
//////
//////
//////                                self.present(viewController, animated: true)
//////
////
////
////                              dismiss(animated: true)
////                              
////
////
////
////                          }else{
////
////
////
////                              let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
////
////
////
////                              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
////
////
////
////                              self.present(alert, animated: true, completion: nil)
////
////
////
////                          }
////
////
////
////                          
////
////
////
////                          
////
////
////
////                          
////
////
////
////                          
////
////
////
////                          
////
////
////
////                      }
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                  }
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  else{
//
//
//
//                      
//
//
//
//                      
//                      var aryy :  [AlumniInstituteEducationDetailModal] = []
//
//
//
//                      print("profileInstituteListprofileInstituteList",profileInstituteList.count)
//
////                      var combinedArray: [CombinedElements] = []
////
////              
////                      for i in 0..<min(existingstateNameArr.count, existingcontryNameArr.count, existingdistrictNameArr.count, existingInstituteNameArr.count, existingclassJoinedNameArr.count, existingclassPassedOutNameArr.count, existingyearJoinedNameArr.count,existingyearPassedOutNameArr.count) {
////                          let combinedElement = CombinedElements(existingcontryNameArr: existingcontryNameArr[i], existingdistrictNameArr: existingdistrictNameArr[i], existingstateNameArr:existingstateNameArr [i], existingInstituteNameArr: existingInstituteNameArr[i], existingclassJoinedNameArr: existingclassJoinedNameArr[i], existingclassPassedOutNameArr: existingclassPassedOutNameArr[i], existingyearJoinedNameArr: existingyearJoinedNameArr[i],existingyearPassedOutNameArr: existingyearPassedOutNameArr[i])
////                          combinedArray.append(combinedElement)
////                          
////                          print("aryyacombinedArraycombinedArrayryyaryy",combinedArray)
////                          
////                      }
////
////                      // Iterate over the combined array and access elements from each array simultaneously
////                      for combinedElement in combinedArray {
////                          print("Element from existingcontryNameArr: \(combinedElement.existingcontryNameArr)")
////                          print("Element from existingdistrictNameArr: \(combinedElement.existingdistrictNameArr)")
////                          print("Element from existingstateNameArr: \(combinedElement.existingstateNameArr)")
////                          print("Element from existingInstituteNameArr: \(combinedElement.existingInstituteNameArr)")
////                          print("Element from existingclassJoinedNameArr: \(combinedElement.existingclassJoinedNameArr)")
////                          print("Element from existingclassPassedOutNameArr: \(combinedElement.existingclassPassedOutNameArr)")
////                          print("Element from existingyearJoinedNameArr: \(combinedElement.existingyearJoinedNameArr)")
////                          
////                          let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
////
////
////
////                          //        for i in schoolNameArr {
////
////
////
////                          alumniInstituteEdu.institute_id = Int(combinedElement.existingInstituteNameArr)
////
////
////
////                          alumniInstituteEdu.class_joined = combinedElement.existingclassJoinedNameArr
////
////
////
////                          alumniInstituteEdu.year_joined = combinedElement.existingyearJoinedNameArr
////
////
////
////                          alumniInstituteEdu.class_passed_out = combinedElement.existingclassPassedOutNameArr
////
////
////
////                          alumniInstituteEdu.year_passed_out = combinedElement.existingyearPassedOutNameArr
////
////
////
////                          
////
////
////
////                          aryy.append(alumniInstituteEdu)
////
////print("aryyaryyaryy",aryy)
////                          
////                          
////                          
////                          
////                          
////                      }
////                      
//                      
//                      
//                
//
//
//                  
//
//
//
////                  var aryy :  [AlumniInstituteEducationDetailModal] = []
//
//
//
//                  for i in 0..<profileInstituteList.count{
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//
//
//
//                      //        for i in schoolNameArr {
//
//
//
//                      alumniInstituteEdu.institute_id = profileInstituteList[i].institute_id
//
//
//
//                      alumniInstituteEdu.class_joined = profileInstituteList[i].class_joined
//
//
//
//                      alumniInstituteEdu.year_joined = profileInstituteList[i].year_joined
//
//
//
//                      alumniInstituteEdu.class_passed_out = profileInstituteList[i].class_passed_out
//
//
//
//                      alumniInstituteEdu.year_passed_out = profileInstituteList[i].year_passed_out
//
//
//
//                      
//
//
//
//                      aryy.append(alumniInstituteEdu)
//
//
//
//                  }
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  let alumniInstituteModal = AlumniEducationDetailModal()
//
//
//
//                  alumniInstituteModal.institute_list = aryy
//
//
//
//                  alumniInstituteModal.participation_interest = IntrestedTextField.text
//
//
//
//                  
//
//
//
//                  //
//
//
//
//                  
//
//
//
//                  var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//
//
//
//                  print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//
//
//
//                  print("token",token)
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                      UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {
//
//
//
//                          
//
//
//
//                          [self] (res) in
//
//
//
//                          
//
//
//
//                          let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          if schoolRegRes.status == true {
//
//
//
////                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
////
////
////
////                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
////
////
////
////                                self.present(viewController, animated: true)
////
////
//
//                              
//                              dismiss(animated: true)
//                              
//
//
//
//                          }else{
//
//
//
//                              let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//
//
//
//                              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//
//
//                              self.present(alert, animated: true, completion: nil)
//
//
//
//                          }
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          
//
//
//
//                          
//
//
//
//                      }
//
//
//
//                      
//
//
//
//                  }
//
//
//
//                  
//
//
//
//              }else{
//
//
//
//                  let modl = EducationDataDetailModal()
//
//
//
//                  
//
//
//
//                  modl.class_joined = ges.classJoinedTextField.text
//
//
//
//                  modl.class_passed_out = ges.classPassedOutTextField.text
//
//
//
//                  modl.institute_id = 2
//
//
//
//                  modl.year_joined = 20
//
//
//
//                  modl.year_passed_out = Int(ges.yearPassedOutTextField.text!)
//
//
//
//                  
//
//
//
//                  AllModalVale.append(modl)
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  var aryy :  [AlumniInstituteEducationDetailModal] = []
//
//
//
//                  for i in 0..<AllModalVale.count{
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      let alumniInstituteEdu = AlumniInstituteEducationDetailModal()
//
//
//
//                      //        for i in schoolNameArr {
//
//
//
//                      alumniInstituteEdu.institute_id = AllModalVale[i].institute_id
//
//
//
//                      alumniInstituteEdu.class_joined = AllModalVale[i].class_joined
//
//
//
//                      alumniInstituteEdu.year_joined = AllModalVale[i].year_joined
//
//
//
//                      alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out
//
//                    
//
//                      alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out
//
//
//
//                      
//
//
//
//                      aryy.append(alumniInstituteEdu)
//
//
//
//                  }
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  let alumniInstituteModal = AlumniEducationDetailModal()
//
//
//
//                  alumniInstituteModal.institute_list = aryy
//
//
//
//                  alumniInstituteModal.participation_interest = IntrestedTextField.text
//
//
//
//                  
//
//
//
//                  //
//
//
//
//                  
//
//
//
//                  var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()
//
//
//
//                  print("alumniInstituteModalStr",alumniInstituteModal.toJSON())
//
//
//
//                  print("token",token)
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  
//
//
//
//                  AlumniEducationDetailRequest.call_request(param: alumniInstituteModalStr!,token: token) {
//
//
//
//                      
//
//
//
//                      [self] (res) in
//
//
//
//                      
//
//
//
//                      let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      if schoolRegRes.status == true {
//
//
//
//                          let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//
//
//
//                          let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//
//
//
//                          self.present(viewController, animated: true)
//
//
//
//                          
//
//
//
//                      }else{
//
//
//
//                          let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)
//
//
//
//                          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//
//
//                          self.present(alert, animated: true, completion: nil)
//
//
//
//                      }
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      
//
//
//
//                      //            else{
//
//
//
//                      //                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)
//
//
//
//                      //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//
//
//                      //                self.present(alert, animated: true, completion: nil)
//
//
//
//                      //            }
//
//
//
//                      //
//
//
//
//                      //
//
//
//
//                      //            else{
//
//
//
//                      //                let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)
//
//
//
//                      //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//
//
//
//                      //                self.present(alert, animated: true, completion: nil)
//
//
//
//                      //            }
//
//
//
//                      
//
//
//
//                  }
//
//
//
//                  
//
//
//
//              }
//
//
//
//              
//
//
//
//          }
    
    
    
    
    
    @IBAction func nextVc( ges : EducationCheckBoxGesture) {







                    print("nextWorking")





                    if ChangeEducationalDetail == 1 {



                        let modl = EducationDataDetailModal()

                        if editId == "1"{



                            
                            for i in profileInstituteList{
                                                            
                                                            
                                                            
                                                            
                                                            modl.class_joined = i.class_joined
                                                            
                                                            
                                                            
                                                            modl.class_passed_out = i.class_passed_out
                                                            
                                                            
                                                            
                                                            modl.institute_id = i.institute_id
                                                            
                                                            
                                                            
                                                            modl.year_joined = i.year_joined
                                                            
                                                            
                                                            
                                                            modl.year_passed_out = Int(i.year_passed_out)
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                           
                                                            
                                                        }

                                                        AllModalVale.append(modl)

                        var aryy :  [AlumniInstituteEducationDetailModal] = []




                        for i in 0..<AllModalVale.count{



                            let alumniInstituteEdu = AlumniInstituteEducationDetailModal()



                            alumniInstituteEdu.institute_id = AllModalVale[i].institute_id



                            alumniInstituteEdu.class_joined = AllModalVale[i].class_joined


                            alumniInstituteEdu.year_joined = AllModalVale[i].year_joined


                            alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out


                            alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out




                            aryy.append(alumniInstituteEdu)




                        }



                        let alumniInstituteModal = AlumniEducationDetailModal()


                        alumniInstituteModal.institute_list = aryy


                        alumniInstituteModal.participation_interest = IntrestedTextField.text



                        var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()

                        print("alumniInstituteModalStr",alumniInstituteModal.toJSON())







                        print("token",token)




                            UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {




                                [self] (res) in



                                let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!





                                if schoolRegRes.status == true {



                                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                    viewController.alertShowType = 1
                                    viewController.gifImage = "success"
                                    viewController.messageResponse = schoolRegRes.message
                                    
                                    viewController.EventRedirect = "CHANGE PROFESSIONAL"
                                    //                            KRProgressHUD.dismiss()
                                    self.present(viewController, animated: true)
                                    
                                    
                                    
                                    
                                    
                                    
                                    


//
//                                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//
//
//
//
//
//
//
//                                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//
//
//
//
//
//
//
//                                    self.present(viewController, animated: true)



                                }else{
                                    


                                    let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)


                                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))


                                    self.present(alert, animated: true, completion: nil)







                                }







                            }



                            







                        }







                        else{






                            print("profileInstituteListprofileInstituteList",profileInstituteList.count)


                        var aryy :  [AlumniInstituteEducationDetailModal] = []







                        for i in 0..<profileInstituteList.count{




                            let alumniInstituteEdu = AlumniInstituteEducationDetailModal()





                            alumniInstituteEdu.institute_id = profileInstituteList[i].institute_id







                            alumniInstituteEdu.class_joined = profileInstituteList[i].class_joined







                            alumniInstituteEdu.year_joined = profileInstituteList[i].year_joined







                            alumniInstituteEdu.class_passed_out = profileInstituteList[i].class_passed_out



                            alumniInstituteEdu.year_passed_out = profileInstituteList[i].year_passed_out






                            aryy.append(alumniInstituteEdu)







                        }






                        let alumniInstituteModal = AlumniEducationDetailModal()




                        alumniInstituteModal.institute_list = aryy


                        alumniInstituteModal.participation_interest = IntrestedTextField.text





                        var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()







                        print("alumniInstituteModalStr",alumniInstituteModal.toJSON())







                        print("token",token)







                            UpdateAlumniEducationalDetail.call_request(param: alumniInstituteModalStr!,token: token) {




                                [self] (res) in



                                let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!





                                if schoolRegRes.status == true {



                                    let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                    let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                    viewController.alertShowType = 1
                                    viewController.gifImage = "success"
                                    viewController.messageResponse = schoolRegRes.message
                                    
                                    viewController.EventRedirect = "CHANGE PROFESSIONAL"
                                    //                            KRProgressHUD.dismiss()
                                    self.present(viewController, animated: true)
                                    
                                    
                                    
                                    
                                    
                                    
                                    



//                                    let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
//
//
//
//
//
//
//
//                                    let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
//
//
//
//
//
//
//
//                                    self.present(viewController, animated: true)
//



                                }else{


                                    let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)







                                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))







                                    self.present(alert, animated: true, completion: nil)







                                }



                            }




                        }






                    }else{









                        var aryy :  [AlumniInstituteEducationDetailModal] = []







                        for i in 0..<AllModalVale.count{



                            let alumniInstituteEdu = AlumniInstituteEducationDetailModal()


                            alumniInstituteEdu.institute_id = AllModalVale[i].institute_id







                            alumniInstituteEdu.class_joined = AllModalVale[i].class_joined







                            alumniInstituteEdu.year_joined = AllModalVale[i].year_joined







                            alumniInstituteEdu.class_passed_out = AllModalVale[i].class_passed_out







                            alumniInstituteEdu.year_passed_out = AllModalVale[i].year_passed_out







                            







                            aryy.append(alumniInstituteEdu)







                        }







                        







                        







                        







                        







                        let alumniInstituteModal = AlumniEducationDetailModal()







                        alumniInstituteModal.institute_list = aryy







                        alumniInstituteModal.participation_interest = IntrestedTextField.text







                        







                        //







                        







                        var  alumniInstituteModalStr = alumniInstituteModal.toJSONString()







                        print("alumniInstituteModalStrfsdzcds",alumniInstituteModal.toJSON())







                        print("token",token)







                        







                        







                        







                        







                        







                        AlumniEducationDetailRequest.call_request(param: alumniInstituteModalStr!,token: token) {







                            







                            [self] (res) in







                            







                            let schoolRegRes : AddNewInstituteDetailResponse = Mapper<AddNewInstituteDetailResponse>().map(JSONString: res)!







                            







                            







                            if schoolRegRes.status == true {







                                let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)







                                let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController







                                self.present(viewController, animated: true)







                                







                            }else{







                                let alert = UIAlertController(title: "Alert", message: schoolRegRes.message, preferredStyle: UIAlertController.Style.alert)







                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))







                                self.present(alert, animated: true, completion: nil)







                            }







                            







                            







                            







                            







                            







                            //            else{







                            //                let alert = UIAlertController(title: "Alert", message: "Password Mismatched", preferredStyle: UIAlertController.Style.alert)







                            //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))







                            //                self.present(alert, animated: true, completion: nil)







                            //            }







                            //







                            //







                            //            else{







                            //                let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)







                            //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))







                            //                self.present(alert, animated: true, completion: nil)







                            //            }







                            







                        }







                        







                    }







                    







                }







            ////   }







            //







            //







            //







            //







            ////        let storyboard = UIStoryboard(name: "SchoolDetailStoryboard", bundle: nil)







            ////        let viewController = storyboard.instantiateInitialViewController() as! SchoolDetailViewController







            ////        self.present(viewController, animated: true)







            //    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



      ////   }



      //



      //



      //



      //



      ////        let storyboard = UIStoryboard(name: "SchoolDetailStoryboard", bundle: nil)



      ////        let viewController = storyboard.instantiateInitialViewController() as! SchoolDetailViewController



      ////        self.present(viewController, animated: true)



      //    }



          



          func textFieldShouldReturn(_ textField: UITextField) -> Bool {



              self.view.endEditing(true)



              return false



          }



          



          



          



      //    @IBAction func getStateList() {



      //



      //        let param : [String : Any] =



      //        [



      //            "countryId": 1



      //



      //        ]



      //



      //        print("Stateparam",param)



      //        GetStateListCountryIdRequest.call_request(param: param){ [self]



      //            (res) in



      //



      //            let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!



      //



      //            if state_response.status == true {



      //                state_data = state_response.data



      //



      //



      //                var StateArray : [String] = []



      //                 state_data.forEach {(arrType)  in



      //



      //                     StateArray.append((arrType.stateName))



      //



      //                 }



      //



      //                 schoolStateTextField.optionArray = StateArray



      //



      //                schoolStateTextField.isSearchEnable = true



      //



      //



      //



      //                 var StateIdArray : [Int] = []



      //                 state_data.forEach {(arrType)  in



      //



      //                     StateIdArray.append((arrType.idState))



      //



      //                 }



      //



      ////              /*   var stateId : In*/t!



      //



      //



      //



      //                schoolStateTextField.didSelect{ [self](selectedText , index ,id) in



      //



      //                     print("SelectInstitute",selectedText)



      //



      //                     stateId = StateIdArray[index]



      //



      //



      //



      //                     getDistrictList()



      //                 }



      //            }else{



      //



      //                let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)



      //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



      //                self.present(alert, animated: true, completion: nil)



      //



      ////



      //



      //            }



      //        }



      //



      //    }



          



          



          



          



          @IBAction func getEducational() {



                  



                  



               



                  print("token",token)



              ProfileGetEducationalRequest.call_request(token: token){ [self]



                      (res) in



                      



                      let getEducationalRes : ProfileGetEducationalDetails = Mapper<ProfileGetEducationalDetails>().map(JSONString: res)!



                      



                      if getEducationalRes.status == true {



                          



                          



                          changeEducationalData = getEducationalRes.getEduData



                          print("changeEducationalData",changeEducationalData.count)



                          



                        



                          for i in changeEducationalData {



      //                        profileInstituteList = edu.profileInstituteList







                              profileInstituteList = i.profileInstituteList



                              VolunteerDonorTextField.text = i.participation_interest



                              IntrestedTextField.text = i.participation_interest



                            



                              for ix in i.profileInstituteList{



                                  



                                 



                                  countryId = ix.country_id



                                 



                              }



                              



                          }



                         



                          



                          



                          



                          



                          print("profileInstituteList",profileInstituteList.count)



                          



                          getStateList()



                     



                          



                          



                          



                          



                          



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



       



          



          



          



          



          @IBAction func getDistrictList() {



              

              district.removeAll()

              

              if ChangeEducationalDetail == 1 {

                 

                  if editId == "1"{

                      

                      

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



                              



                              district.removeAll()



                              

                              for i in district_response.data{



                                  



                                  district.append(i.districtName)



                                  



                              }

                              

                              

//                              cv.dataSource = self
//
//                              cv.delegate  = self
//
//                              cv.reloadData()



              //                var DistrictArray : [String] = []



              //                district_data.forEach {(arrType)  in



              //



              //                    DistrictArray.append((arrType.districtName))



              //



              //                }



              //



              //                schoolDistrictTextField.optionArray = DistrictArray



              //                schoolDistrictTextField.isSearchEnable = true



              //



              //



              //                var DistrictIdArray : [Int] = []



              //                district_data.forEach {(arrType)  in



              //



              //                    DistrictIdArray.append((arrType.idDistrict))



              //



              //                }



                              



              //                var distId : Int!



                              



                              



                              



              //                schoolDistrictTextField.didSelect{ [self](selectedText , index ,id) in



              //



              //                    print("SelectInstitute",selectedText)



              //



              //                    districtId = DistrictIdArray[index]



              //



              //                    getSchoolList()



              //                }



                          }else{



                              



                              let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)



                              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                              self.present(alert, animated: true, completion: nil)



                              



              //



                              



                          }



                      }



                      

                      

              

                  



                  

                  

              }

            

                  else{

                      for i in  profileInstituteList{

                          

                          let param : [String : Any] =

                          

                          [

                              

                              "state_id": i.state_id

                              

                              

                              

                          ]

                          

                          print("param",param)

                          

                          GetDistrictListByStateIdRequest.call_request(param: param){ [self]

                              

                              (res) in

                              

                              

                              

                              let district_response : GetDistrictListRsponse = Mapper<GetDistrictListRsponse>().map(JSONString: res)!

                              

                              

                              

                              if district_response.status == true {

                                  

                                  district_data = district_response.data

                                  

                                  

                                  

                                  

                                  

                                  

                                  for i in district_response.data{

                                      

                                      

                                      

                                      district.append(i.districtName)

                                      

                                      

                                      

                                  }

                                  

                                  

                                  cv.dataSource = self

                                  cv.delegate  = self

                                  cv.reloadData()

                                  

                                  //                var DistrictArray : [String] = []

                                  

                                  //                district_data.forEach {(arrType)  in

                                  

                                  //

                                  

                                  //                    DistrictArray.append((arrType.districtName))

                                  

                                  //

                                  

                                  //                }

                                  

                                  //

                                  

                                  //                schoolDistrictTextField.optionArray = DistrictArray

                                  

                                  //                schoolDistrictTextField.isSearchEnable = true

                                  

                                  //

                                  

                                  //

                                  

                                  //                var DistrictIdArray : [Int] = []

                                  

                                  //                district_data.forEach {(arrType)  in

                                  

                                  //

                                  

                                  //                    DistrictIdArray.append((arrType.idDistrict))

                                  

                                  //

                                  

                                  //                }

                                  

                                  

                                  

                                  //                var distId : Int!

                                  

                                  

                                  

                                  

                                  

                                  

                                  

                                  //                schoolDistrictTextField.didSelect{ [self](selectedText , index ,id) in

                                  

                                  //

                                  

                                  //                    print("SelectInstitute",selectedText)

                                  

                                  //

                                  

                                  //                    districtId = DistrictIdArray[index]

                                  

                                  //

                                  

                                  //                    getSchoolList()

                                  

                                  //                }

                                  

                              }else{

                                  

                                  

                                  

                                  let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)

                                  

                                  alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                                  

                                  self.present(alert, animated: true, completion: nil)

                                  

                                  

                                  

                                  //

                                  

                                  

                                  

                              }

                              

                          }

                          

                          

                          

                      }

                      

                      

                      

                  }

                  

                  

              }

            

              else{

                  

                  

                

                      

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



                              



                              



                              

                              for i in district_response.data{



                                  



                                  district.append(i.districtName)



                                  



                              }

                              

                              
//
//                              cv.dataSource = self
//
//                              cv.delegate  = self
//
//                              cv.reloadData()



              //                var DistrictArray : [String] = []



              //                district_data.forEach {(arrType)  in



              //



              //                    DistrictArray.append((arrType.districtName))



              //



              //                }



              //



              //                schoolDistrictTextField.optionArray = DistrictArray



              //                schoolDistrictTextField.isSearchEnable = true



              //



              //



              //                var DistrictIdArray : [Int] = []



              //                district_data.forEach {(arrType)  in



              //



              //                    DistrictIdArray.append((arrType.idDistrict))



              //



              //                }



                              



              //                var distId : Int!



                              



                              



                              



              //                schoolDistrictTextField.didSelect{ [self](selectedText , index ,id) in



              //



              //                    print("SelectInstitute",selectedText)



              //



              //                    districtId = DistrictIdArray[index]



              //



              //                    getSchoolList()



              //                }



                          }else{



                              



                              let alert = UIAlertController(title: "Alert", message: district_response.message, preferredStyle: UIAlertController.Style.alert)



                              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                              self.present(alert, animated: true, completion: nil)



                              



              //



                              



                          }



                      }



                      

                      

              

                  



                  

                  

              }

            



          }



          



          @IBAction func pickCountry(ges : EducationCheckBoxGesture) {



              



              print("pickCountry")



              



              



              



              if ChangeEducationalDetail == 1 {



                  



                  



                  



                  



                  drop_down.dataSource = country



                  drop_down.anchorView = ges.countryView



                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



                  drop_down.show()



                  



                  country_data.forEach { (stateName) in



                      



                      //            country.append(stateName.countryName)



                      countryID.append(stateName.idCountry)



                  }



              



              drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                  print("Selected item: \(item) at index: \(index)")



                  ges.countryTextField.text = item



                  countryId = countryID[index]

                  existingcontryNameArr.append(countryId)

                  print("PickexistingcontryNameArr",existingcontryNameArr)
                  
                  var countryIdStr = String(countryId)
                  
                  contryNameArr.append(countryIdStr)


                  getStateList()



                  



              }



                  



                  



              }



              



              else{



                  



                  drop_down.dataSource = country



                  drop_down.anchorView = ges.countryView



                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



                  drop_down.show()



                  



                  country_data.forEach { (stateName) in



                      



                      //            country.append(stateName.countryName)



                      countryID.append(stateName.idCountry)



                  }



              



              drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                  print("Selected item: \(item) at index: \(index)")



                  ges.countryTextField.text = item



                  countryId = countryID[index]



                  getStateList()



                  



              }



          }



             



          }



          



          



          



          @IBAction func pickState(ges : EducationCheckBoxGesture) {





              if ChangeEducationalDetail == 1 {



                 



                  drop_down.dataSource = state

                  

                  drop_down.anchorView = ges.stateView

                  

                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)

                  

                  drop_down.show()

                  

                  state_data.forEach { (stateName) in

                      

                      

                      

                      //            state.append(stateName.stateName)

                      

                      stateIDArr.append(stateName.idState)

                      

                  }

                  

                  

                  

                  drop_down.selectionAction = { [unowned self] (index: Int, item: String) in

                      

                      print("Selected item: \(item) at index: \(index)")

                      editId = "1"

                      ges.stateTextField.text = item

                      

                      stateId = stateIDArr[index]

                      existingstateNameArr.append(stateId)

                      var stateIdStr = String(stateId)
                      
                      stateNameArr.append(stateIdStr)

                      getDistrictList()

                      

                      

                      

                  }



             

                  



              }



              

              else{

                  

                  drop_down.dataSource = state

                  

                  drop_down.anchorView = ges.stateView

                  

                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)

                  

                  drop_down.show()

                  

                  state_data.forEach { (stateName) in

                      

                      

                      

                      //            state.append(stateName.stateName)

                      

                      stateIDArr.append(stateName.idState)

                      

                  }

                  

                  

                  

                  drop_down.selectionAction = { [unowned self] (index: Int, item: String) in

                      

                      print("Selected item: \(item) at index: \(index)")

                      

                      ges.stateTextField.text = item

                      

                      stateId = stateIDArr[index]

                      

                      getDistrictList()

                      

                      

                      

                  }

                  

                  

              }

             







          }



          



          



          



          



          @IBAction func pickDistrict(ges : EducationCheckBoxGesture) {







             

  print("pickDistrict")

              

              drop_down.dataSource = district



              drop_down.anchorView = ges.districtView



              drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



              drop_down.show()





              district_data.forEach { (stateName) in







//                  district.append(stateName.districtName)



                  districtIdArr.append(stateName.idDistrict)



              }







              drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                print("Selected item: \(item) at index: \(index)")



                  ges.districtTextField.text = item



      districtId = districtIdArr[index]
                  print("11districtId",districtId)

                  existingdistrictNameArr.append(districtId)

                  var districtIdStr = String(districtId)
                  
                  districtNameArr.append(districtIdStr)

                



              }







            







          }



          



          



          



          



          @IBAction func pickSchoolList(ges : EducationCheckBoxGesture) {







             







             







          }



          



          @IBAction func pickIntrestParticipate( ges: EducationCheckBoxGesture) {







            



              



              drop_down.dataSource = supportStr



              drop_down.anchorView = ges.intrestedParticipateView



              drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



              drop_down.show()



              



              contributeSupportData.forEach { (support) in







      //            supportStr.append(support.supportName)



                  supportContentStr.append(support.content)







                  supportIdArr.append(support.id)



              }







              drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                print("Selected item: \(item) at index: \(index)")



                  VolunteerDonorTextField.text = item



                      IntrestedTextField.text = item



      supportId = supportIdArr[index]



      //            supportReqView.isHidden = false



      //            supportReqTextField.placeholder = supportContentStr[index]



      //            supportReqLbl.text = supportContentStr[index]



                



              }







             



                  



                  



      //        }



          }



          



          



          @IBAction func getSchoolList(ges : EducationCheckBoxGesture) {







              var keyWord = ges.schoolNameTextfield.text!



              let param : [String : Any] =



              [



                  "keyword": keyWord,



                  "countryid": countryId!,



                  "stateid": stateId!,

                  "districtid" : districtId!

                  



              ]



              



              print(param)



              



              GetSchoolListRequest.call_request(param: param){ [self]



                  (res) in



                  



                  let get_school_response : GetSchoolListResponse = Mapper<GetSchoolListResponse>().map(JSONString: res)!



                  



                  if get_school_response.status == true {



      //                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)



      //                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {



                          



                      school_list_data = get_school_response.data



                      



                      var myaryy : [String] = []



                      for i in get_school_response.data{



                          



                          myaryy.append(i.schoolName)



                          



                          school.append(i.schoolName)



                      }



                      school_list_data.forEach { (stateName) in







      //                    school.append(stateName.schoolName)



                          schoolIdArr.append(stateName.schoolId)



                      }







                      drop_down.dataSource = myaryy



                      drop_down.anchorView = ges.schoolView



                      drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



                      drop_down.show()



                      



                      drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                        print("Selected item: \(item) at index: \(index)")



                          ges.schoolNameTextfield.text = item


                          ges.schoolNameLbl.text = item
//                          schoolNameLbl.text =  item

                          existingInstituteNameArr.append(item)

              schoolId = schoolIdArr[index]

                          var schoolIdStr = String(schoolId)
                          
                          InstituteNameArr.append(schoolIdStr)


                        



                      }
                      
                      
                    

                      Constant.DefaultsKeys.InstuteId = schoolId


                      



                      



      //                    let defaults = UserDefaults.standard



      ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)



      //                    let vc = LoginViewController(nibName: nil, bundle: nil)



      //                    vc.modalPresentationStyle = .fullScreen



      //                    self.present(vc, animated: true, completion: nil)



      //                }



                  }else{



                      



                      let alert = UIAlertController(title: "Alert", message: get_school_response.message, preferredStyle: UIAlertController.Style.alert)



                      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                      self.present(alert, animated: true, completion: nil)



                      



      //



                      



                  }



              }



              



          }



          



          @IBAction func getStateList() {







              



              print("statesssssssss")



              let param : [String : Any] =



              [



                  "countryId": countryId



                  



              ]



              



              GetStateListCountryIdRequest.call_request(param: param){ [self]



                  (res) in



                  



                  let state_response : GetStateListResponse = Mapper<GetStateListResponse>().map(JSONString: res)!



                  



                  if state_response.status == true {



      //                PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)



      //                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {



                          
                      state_data.removeAll()


                      state_data = state_response.data



                      

                      state.removeAll()

                      for i in state_response.data{



                          



                          state.append(i.stateName)

                          stateId = i.idState

                          

                      }



                    



                      

                      

                    

      //                    let defaults = UserDefaults.standard



      ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)



      //                    let vc = LoginViewController(nibName: nil, bundle: nil)



      //                    vc.modalPresentationStyle = .fullScreen



      //                    self.present(vc, animated: true, completion: nil)



      //                }



                      



                      

  //

  //                    cv.dataSource = self

  //

  //                    cv.delegate = self

  //

  //

  //

  //                    cv.reloadData()



                      

                      getDistrictList()

                     



                  }else{



                      



                      let alert = UIAlertController(title: "Alert", message: state_response.message, preferredStyle: UIAlertController.Style.alert)



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



                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in



                          



                          



                          



                          



                          country_data = country_response.data



                        



                          for i in country_response.data{



                              



                              country.append(i.countryName)



                              



                             



                                  



                                  



                              countryNameEdit.append(i.countryName)



                                  



                              



                          }



                          print("country_response.data",country_response.data)



      //                    let defaults = UserDefaults.standard



      ////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)



      //                    let vc = LoginViewController(nibName: nil, bundle: nil)



      //                    vc.modalPresentationStyle = .fullScreen



      //                    self.present(vc, animated: true, completion: nil)



                          



                          getEducational()



                      }



                  }else{



                      



      //                _ =  SweetAlert().showAlert(" The request is invalid",subTitle: "",style: .warning,buttonTitle: "OK",buttonColor:.black)



                      



                  }



              }



              



          }



          



          



      //    @IBAction func pickCountry() {



      //



      //        print("drop")



      //



      //        district_data.forEach { (countryName) in



      //



      //            district.append(countryName.districtName)



      //            districtIdArr.append(countryName.idDistrict)



      //        }



      //



      //



      //



      //        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



      //          print("Selected item: \(item) at index: \(index)")



      //          schoolDistrictLbl.text = item



      //



      ////            countryNme = item



      //            districtId = districtIdArr[index]



      //



      //



      //        }



      //



      //        drop_down.dataSource = district



      //        drop_down.anchorView = schoolDistrictView



      //        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



      //        drop_down.show()



      //



      //    }



          



          



      //    @IBAction func pickState() {



      //



      //



      //



      //        state_data.forEach { (stateName) in



      //



      //            state.append(stateName.stateName)



      //            stateIDArr.append(stateName.idState)



      //        }



      //



      //        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



      //          print("Selected item: \(item) at index: \(index)")



      //        schoolStateLbl.text = item



      //stateId = stateIDArr[index]



      //



      //            getDistrictList()



      //



      //        }



      //



      //        drop_down.dataSource = state



      //        drop_down.anchorView = schoolStateView



      //        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



      //        drop_down.show()



      //



      //    }



          



          



          



          



          



      //    @IBAction func yearPassedOut() {



      //



      //        print("drop")



      //



      //



      //



      //



      //                yearPassedOutTextField.optionArray =



      ////        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",



      ////                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",



      ////                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"



      ////                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"



      ////                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"



      ////                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"



      ////                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"



      //        [



      //                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",



      //                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",



      //                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",



      //                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",



      //                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",



      //                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",



      //                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",



      //                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",



      //                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"



      //                                     ]



      ////                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070



      ////                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080



      ////                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090



      ////                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100



      ////              ]



      //



      //        yearPassedOutTextField.isSearchEnable = true



      //



      //



      //



      //



      //



      //        yearPassedOutTextField.didSelect{ [self](selectedText , index ,id) in



      //



      //            print("SelectInstitute",selectedText)



      //



      //



      //



      //



      //



      //        }



      //



      //    }



          



          



          @IBAction func classPassedOutVc(ges : EducationCheckBoxGesture) {



              



              print("drop")



              



              drop_down.anchorView = ges.classPassedOutView



                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



                  drop_down.show()



                  



                    drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                        print("Selected item: \(item) at index: \(index)")



                        ges.classPassedOutTextField.text = item

                        var yearpassedOut = Int(item)
                        
                      
//                        existingyearJoinedNameArr.removeAll()
                        
                        yearJoinedNameArr.append(yearpassedOut!)
                        existingyearJoinedNameArr.append(yearpassedOut!)
                        print("YEAR SELECT",existingyearJoinedNameArr)

                    }



                    drop_down.dataSource =  [



                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",



                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",



                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",



                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",



                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",



                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",



                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",



                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",



                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"]



              


            

              Constant.DefaultsKeys.YearJoined =  Int(ges.classPassedOutTextField.text!)


             
                    



              



              



      //                classPassedOut.optionArray =



      ////        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",



      ////                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",



      ////                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"



      ////                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"



      ////                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"



      ////                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"



      ////                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"



      //        [



      //                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",



      //                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",



      //                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",



      //                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",



      //                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",



      //                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",



      //                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",



      //                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",



      //                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"



      //                                     ]



      //                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070



      //                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080



      //                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090



      //                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100



      //              ]



              



              



                  



              



              



          }



          



          



          



          @IBAction func yearPassedOutVc(ges : EducationCheckBoxGesture) {



              



              print("drop")

              let modl = EducationDataDetailModal()

              editId = "1"



              drop_down.anchorView = ges.yearPassedOutView



                  drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)



                  drop_down.show()



                  



                    drop_down.selectionAction = { [unowned self] (index: Int, item: String) in



                        print("Selected item: \(item) at index: \(index)")



                        ges.yearPassedOutTextField.text = item
                        

                        var yearpassedOut = Int(item)
                        
                        yearPassedOutNameArr.append(yearpassedOut!)
                        existingyearPassedOutNameArr.append(yearpassedOut!)

                        print("YEAR SELECTexistingyearPassedOutNameArr",existingyearPassedOutNameArr)
                        
                        modl.year_passed_out = Int(ges.yearPassedOutTextField.text!)

                    }



                    drop_down.dataSource =  [



                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",



                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",



                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",



                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",



                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",



                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",



                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",



                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",



                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"]



                



             
            
              



              



      //                classPassedOut.optionArray =



      ////        ["1901","1902", "1903", "1904", "1905" ,"1906", "1907", "1908", "1909", "1910",



      ////                                      "1911","1912", "1913", "1914", "1915", "1916","1917","1918","1919","1920",



      ////                                      "1921","1922", "1923", "1924", "1925", "1926", "1927" "1928" "1929" "1930"



      ////                                      "1931","1932", "1933", "1934", "1935", "1936", "1937" "1938" "1939" "1940"



      ////                                      "1941","1942", "1943", "1944", "1945", "1946", "1947" "1948" "1949" "1950"



      ////                                      "1951","1952", "1953", "1954", "1955", "1956", "1957" "1958" "1959" "1960"



      ////                                      "1961","1962", "1963", "1964", "1965", "1966", "1967" "1968" "1969" "1970"



      //        [



      //                                      "1971","1972", "1973", "1974", "1975", "1976", "1977","1978", "1979", "1980",



      //                                      "1981","1982", "1983" ,"1984" ,"1985", "1986", "1987" ,"1988", "1989" ,"1990",



      //                                      "1991","1992", "1993" ,"1994" ,"1995", "1996", "1997", "1998" ,"1999", "2000",



      //                                      "2001","2002", "2003" ,"2004" ,"2005", "2006", "2007", "2008" ,"2009" ,"2010",



      //                                      "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020",



      //                                      "2021", "2022", "2023", "2024", "2025", "2026" ,"2027", "2028" ,"2029" ,"2030",



      //                                      "2031", "2032", "2033", "2034", "2035", "2036" ,"2037", "2038", "2039" ,"2040",



      //                                      "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048" ,"2049" ,"2050",



      //                                      "2051", "2052", "2053", "2054", "2055", "2056" ,"2057" ,"2058", "2059" ,"2060"



      //                                     ]



      //                                      "2061", "2062", "2063", "2064", "2065", "2066" "2067" "2068" 2069 2070



      //                                      "2071", "2072", "2073", "2074", "2075", "2076" "2077" "2078" 2079 2080



      //                                      "2081", "2082", "2083", "2084", "2085", "2086" "2087" "2088" 2089 2090



      //                                      "2091", "2092" ,"2093", "2094", "2095" ,"2096" "2097" "2098" 2099 2100



      //              ]



              



              



                  

              editId = "1"



            



              



              modl.class_joined = ges.classJoinedTextField.text



              modl.class_passed_out = ges.classPassedOutTextField.text



              modl.institute_id = schoolId



              modl.year_joined = Int(ges.yearJoinedTextField.text!)



            


              



//              deAllModalVale.append(modl)


              AllModalVale.append(modl)
              




              print("modlmodlmodlmodlmodl",AllModalVale)



              



          }



          



          



          



          @IBAction func addRows(ges : EducationCheckBoxGesture) {



             



              



             



              print("addRows")



              



              if ges.countryTextField.text != ""{



                  



                  if ges.stateTextField.text != ""{



                     



                          



                        



                                      if ges.schoolNameTextfield.text != ""{



      //                                    if ges.yearJoinedTextfield.text != ""{



                                              if ges.yearPassedOutTextField.text != ""{



                                                  



                                                  if ges.classPassedOutTextField.text != ""{



                                                      editId = "1"



                                                      



                                                      var a = ges.classPassedOutTextField.text!



                                                      var b = ges.yearPassedOutTextField.text!



      //                                                if a <= b {



      //                                    if ges.intrestedParticipateTextField.text != ""{



      //                                        rowsId += 1



                                                          



      //                                                    for i in rowsId{

                                                      
                                                      if ChangeEducationalDetail == 1{
                                                          
                                                          rowsId += [profileInstituteList.count + 1]
                                                          ges.schoolNameLbl.isHidden = false
                                                          ges.schoolNameLbl.text = "Institute - " + String(profileInstituteList.count)
                                                      }
                                                      else{
                                                          ges.schoolNameLbl.isHidden = false
                                                          rowsId += [1]
                                                          ges.schoolNameLbl.text = "Institute - " + String(rowsId.count)
                                                      }

                                                             



      //                                                    }



                                                         



                                              print("rowsId",rowsId)



                                              cv.dataSource  = self



                                              cv.delegate = self



                                              



                                              



                                              countryText = ges.countryTextField.text



                                              stateText = ges.stateTextField.text



      //                                        districtText = ges.districtTextField.text



                                              schoolNameText = ges.schoolNameTextfield.text



      //                                        yearJoinedText = ges.yearJoinedTxtField.text



                                              yearPassedOutText = ges.yearPassedOutTextField.text



                                              classPassedOutText = ges.classPassedOutTextField.text



      //                                        intrestedParticipateText = ges.intrestedParticipateTextField.text



                                              



                                                          



                                                      



                                                        



                                              



                                              schoolNameArr.append(schoolNameText)



                                              cv.reloadData()



                                              



      //                                    }else{



      //                                        print("addRows1")



      //                                        let alert = UIAlertController(title: "Alert", message: "Class", preferredStyle: UIAlertController.Style.alert)



      //                                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



      //                                        self.present(alert, animated: true, completion: nil)



      //                                    }



                                      }else{



                                          print("addRows2")



                                          let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)



                                          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                                          self.present(alert, animated: true, completion: nil)



                                      }



                                  }else{



                                      print("addRows3")



                                      let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)



                                      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                                      self.present(alert, animated: true, completion: nil)



                                  }



      //                        }else{



      //                            let alert = UIAlertController(title: "Alert", message: "Mandatory Field Not Filled Please Check", preferredStyle: UIAlertController.Style.alert)



      //                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



      //                            self.present(alert, animated: true, completion: nil)



      //                        }



                          }else{



                              print("addRows4")



                              let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)



                              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                              self.present(alert, animated: true, completion: nil)



                          }



                     



                      



                  }else{



                      print("addRows6")



                      let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)



                      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                      self.present(alert, animated: true, completion: nil)



                  }



              }else{



                  print("addRows7")



                  let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)



                  alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))



                  self.present(alert, animated: true, completion: nil)



              }



              



          }



          



          



          @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {



              if ChangeEducationalDetail == 1 {



      //            print("changeEducationalData.count",profileInstituteList.count)



                  if editId == "1"{



                      



                      return rowsId.count



                      



                  }else{



                      



                      return profileInstituteList.count



                      



                  }



              }else{



                  return rowsId.count



              }



              



              return 0



          }



          



          @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {



              



              



              if ChangeEducationalDetail == 1 {



                  



                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier , for: indexPath) as! EducationCollectionViewCell



                  cell.newSchoolListView.isHidden = true
                  
                  cell.didnLbl.isHidden = true


                  cell.mainVc = self
                  



                  if editId == "1"{



                      



                      



                      



                      



                      let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))



                      countryGesture.countryTextField = cell.countryTextField



                      countryGesture.countryView = cell.countryView



                      cell.countryView.addGestureRecognizer(countryGesture)


                      cell.countryTextField.delegate = self



                      cell.stateTextField.delegate = self



                      cell.schoolNameTextfield.delegate = self
                                


                  //        districtTextField.delegate = self



                     

                      



                      let classPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(classPassedOutVc))



                      classPassedOutGesture.classPassedOutTextField = cell.yearJoinedTextField



                      classPassedOutGesture.classPassedOutView = cell.classPassedOutView



                      cell.classPassedOutView.addGestureRecognizer(classPassedOutGesture)



                      



                      


                      let yearPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(yearPassedOutVc))



                      yearPassedOutGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                      yearPassedOutGesture.yearPassedOutView = cell.yearPassedOutView
                      
                      
                      yearPassedOutGesture.yearJoinedTextField = cell.yearJoinedTextField



                      yearPassedOutGesture.classJoinedTextField = cell.classJoinedTextField
                      
                      yearPassedOutGesture.classPassedOutTextField = cell.highClassTextField



    //                  yearPassedOutGesture.yearPassedOutView = cell.yearPassedOutView



                      cell.yearPassedOutView.addGestureRecognizer(yearPassedOutGesture)




                      let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))



                      stateGesture.stateTextField = cell.stateTextField



                      stateGesture.stateView = cell.stateView



                      cell.stateView.addGestureRecognizer(stateGesture)



                      



                      let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))



                      schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield

                      schoolListGesture.schoolNameLbl = cell.schoolNameLbl



                      schoolListGesture.schoolView = cell.schoolListView



                      cell.schoolListView.addGestureRecognizer(schoolListGesture)



                      

                      let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))



                      districtGesture.districtTextField = cell.districtTextField



                      districtGesture.districtView = cell.districtView



                      cell.districtView.addGestureRecognizer(districtGesture)

                      

                      

                      



                      let saveViews = EducationCheckBoxGesture(target: self, action: #selector(saveVc))



//                      saveViews.classPassedOutTextField = cell.classPassedOutTextField



                      //        tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                      saveViews.yearPassedOutTextField = cell.yearPassedOutTextField



                      saveViews.classJoinedTextField = cell.classJoinedTextField



                      cell.saveView.addGestureRecognizer(saveViews)



                      



                      let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))



                  //            tapGesture.classPassedOutTextField = cell.classPassedOutTextField



                  //            //        tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                  //            tapGesture.yearPassedOutTextField = cell.yearPassedOutTextField






                      //        tapGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



                      nextView.addGestureRecognizer(tapGesture)



                      



                                  



                      



//          var institute : ProfileGetInstituteList  = ProfileGetInstituteList[indexPath.row]



      
                     

                                  



                                  let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))



                                  addSchoolListGesture.countryTextField = cell.countryTextField



                                  addSchoolListGesture.stateTextField = cell.stateTextField



                                          addSchoolListGesture.districtTextField = cell.districtTextField

                      addSchoolListGesture.schoolNameLbl = cell.schoolNameLbl


                                  addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield



                                  //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                                  addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                                  addSchoolListGesture.classPassedOutTextField = cell.yearJoinedTextField



                                  //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



                                  addSchoolListGesture.classJoinedTextField = cell.classJoinedTextField



                                  addSchoolView.addGestureRecognizer(addSchoolListGesture)



                                  
//                      existingclassJoinedNameArr.append(institute.class_joined)
//                      existingclassPassedOutNameArr.append(institute.class_passed_out)
//                      
//                      existingcontryNameArr.append(institute.country_id)
//                      existingstateNameArr.append(institute.state_id)
//                      existingyearJoinedNameArr.append(institute.year_joined)
//                      existingyearPassedOutNameArr.append(institute.year_passed_out)

//                      existingyearJoinedNameArr.append(item)


                    



                      



                      

                      cell.btns.tag = indexPath.row



                      cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)


                      



                  }else{



                      



                      print("changeEducationalData.count",profileInstituteList.count)







         

//                        cell.newSchoolListView.isHidden = false
//
//                        cell.didnLbl.isHidden = false


          



          cell.countryTextField.delegate = self



          cell.stateTextField.delegate = self



          cell.schoolNameTextfield.delegate = self
                    

      //        districtTextField.delegate = self



          cell.highClassTextField.delegate = self



          cell.classJoinedTextField.delegate = self



      //           var edu : ProfileGetEducationDetail  = changeEducationalData[indexPath.row]



          



                      if indexPath.row == 0{



                          



                          cell.RemoveView.isHidden = true



                      }



                      else{



                          



                          cell.RemoveView.isHidden = false



                      }



          



          var institute : ProfileGetInstituteList  = profileInstituteList[indexPath.row]









          cell.schoolNameTextfield.text = institute.institute_name



          cell.yearPassedOutTextField.text = String(institute.year_passed_out)



          cell.highClassTextField.text = institute.class_passed_out



          cell.classJoinedTextField.text = institute.class_joined



          cell.yearJoinedTextField.text = String(institute.year_joined)


                      
                      cell.schoolNameLbl.text = institute.institute_name
                      
                      
                      
//                      existingclassJoinedNameArr.append(institute.class_joined)
//                      existingclassPassedOutNameArr.append(institute.class_passed_out)
//                      existingyearJoinedNameArr.append(institute.year_joined)
//                      existingyearPassedOutNameArr.append(institute.year_passed_out)
//                      for i in country_data{
//
//
//
//                          print("countryNameEdit111111",i.idCountry)

//
//
//                          if i.idCountry == institute.country_id{
//
//
//
//                              print("countryNameEdit222222222",institute.country_id)
//
//
//
//                              print("countryNameEdi33333",i.countryName)
//
//
//
//                              cell.countryTextField.text = i.countryName
//
//
//
//                              
//
//
//
//                              
//
//
//
//                          }


          

                      



        


          



          


//
//          let modl = EducationDataDetailModal()
//
//
//
//          
//
//
//
//          modl.class_joined = institute.class_joined
//
//
//
//          modl.class_passed_out = institute.class_passed_out
//
//
//
//          modl.institute_id = institute.institute_id
//
//
//
//          modl.year_joined = institute.year_joined
//
//
//
//          modl.year_passed_out = Int(institute.year_passed_out)
//
//
//
//          
//
//
//
//                     AllModalVale.append(modl)
//


          



          



          



          



                      



                     



          



          



          



          


          for i in country_data{



              print("countryNameEdit111111",i.idCountry)



              if i.idCountry == institute.country_id{



                  print("countryNameEdit222222222",institute.country_id)



                  print("countryNameEdi33333",i.countryName)



                  cell.countryTextField.text = i.countryName



                  existingcontryNameArr.append(institute.country_id)



                  



              }



              



          }



          

          for i in state_data{



              
            


              if i.idState == institute.state_id{



                  

                  stateId = institute.state_id

                  



                  cell.stateTextField.text = i.stateName



                  existingstateNameArr.append(institute.state_id)



              }



              



          }

                      

                      print("state_datastate_data",state_data)

                      print("Celledistrict_data",district_data)

                      existingdistrictNameArr.removeAll()

                      for i in district_data{



                          print("district_datadistrict_data",i.districtName)

                       

                          if i.idDistrict == institute.district_id{



                              



                              



                              cell.districtTextField.text = i.districtName

                              existingdistrictNameArr.append(institute.district_id)

                              



                          }



                          



                      }



                      



                      



          



          



          



          let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))



          countryGesture.countryTextField = cell.countryTextField



          countryGesture.countryView = cell.countryView



          cell.countryView.addGestureRecognizer(countryGesture)



          
                      let pickIntrestGesture = EducationCheckBoxGesture(target: self, action: #selector(pickIntrestParticipate))



                      pickIntrestGesture.intrestedParticipateTextField = IntrestedTextField



                      pickIntrestGesture.intrestedParticipateView = intrestView



                      intrestView.addGestureRecognizer(pickIntrestGesture)



                      


          



          let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))



          stateGesture.stateTextField = cell.stateTextField



          stateGesture.stateView = cell.stateView



          cell.stateView.addGestureRecognizer(stateGesture)



          



          let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))



          schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield

                      schoolListGesture.schoolNameLbl = cell.schoolNameLbl


          schoolListGesture.schoolView = cell.schoolListView



          cell.schoolListView.addGestureRecognizer(schoolListGesture)



          



          



                      let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))



                      districtGesture.districtTextField = cell.districtTextField



                      districtGesture.districtView = cell.districtView



                      cell.districtView.addGestureRecognizer(districtGesture)

                      

                      

                      

                      

                      

                      



          let saveViews = EducationCheckBoxGesture(target: self, action: #selector(saveVc))



          saveViews.classPassedOutTextField = cell.classJoinedTextField



      //            tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField



          saveViews.yearPassedOutTextField = cell.yearPassedOutTextField



          saveViews.classJoinedTextField = cell.classJoinedTextField



          cell.saveView.addGestureRecognizer(saveViews)



          



          let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))






      //            //        tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField



      //            tapGesture.yearPassedOutTextField = cell.yearPassedOutTextField



      //            tapGesture.classJoinedTextField = cell.classJoinedTextField



          //        tapGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



          nextView.addGestureRecognizer(tapGesture)



          



                      



                      



                      let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))



                      addSchoolListGesture.countryTextField = cell.countryTextField



                      addSchoolListGesture.stateTextField = cell.stateTextField

                      addSchoolListGesture.schoolNameLbl = cell.schoolNameLbl

                      //        addSchoolListGesture.districtTextField = cell.districtTextField



                      addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield



                      //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                      addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                      addSchoolListGesture.classPassedOutTextField = cell.classJoinedTextField



                      //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



                      addSchoolListGesture.classJoinedTextField = cell.classJoinedTextField



                      addSchoolView.addGestureRecognizer(addSchoolListGesture)



                      



                      cell.btns.tag = indexPath.row



                      cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)



                      



                  }



                  



                  



                  


//
//                  cell.btns.tag = indexPath.row
//
//
//
//                  cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)
//
//
//

              



                  return cell



                  



              }else{



                  



                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier , for: indexPath) as! EducationCollectionViewCell


                  cell.mainVc = self
                  
                  cell.newSchoolListView.isHidden = false
                  
                  cell.didnLbl.isHidden = false


                  cell.countryTextField.delegate = self



                  cell.stateTextField.delegate = self



                  cell.schoolNameTextfield.delegate = self



          //        districtTextField.delegate = self



//






                  



                  if indexPath.row == 0{



                      



                      cell.RemoveView.isHidden = true



                  }



                  else{



                      



                      cell.RemoveView.isHidden = false



                  }



                  



                  let newSchoolGesture = UITapGestureRecognizer(target: self, action: #selector(clickHereAction))



                  cell.newSchoolListView.addGestureRecognizer(newSchoolGesture)




                  let addSchoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(addRows))



                  addSchoolListGesture.countryTextField = cell.countryTextField

                  addSchoolListGesture.schoolNameLbl = cell.schoolNameLbl

                  addSchoolListGesture.stateTextField = cell.stateTextField



                  //        addSchoolListGesture.districtTextField = cell.districtTextField



                  addSchoolListGesture.schoolNameTextfield = cell.schoolNameTextfield



                  //        addSchoolListGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                  addSchoolListGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                  addSchoolListGesture.classPassedOutTextField = cell.classJoinedTextField



                  //        addSchoolListGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



                  addSchoolListGesture.classJoinedTextField = cell.classJoinedTextField



                  addSchoolView.addGestureRecognizer(addSchoolListGesture)



                  



                  



                  



                  let countryGesture = EducationCheckBoxGesture(target: self, action: #selector(pickCountry))



                  countryGesture.countryTextField = cell.countryTextField



                  countryGesture.countryView = cell.countryView



                  cell.countryView.addGestureRecognizer(countryGesture)



                  



                  



                  let stateGesture = EducationCheckBoxGesture(target: self, action: #selector(pickState))



                  stateGesture.stateTextField = cell.stateTextField



                  stateGesture.stateView = cell.stateView



                  cell.stateView.addGestureRecognizer(stateGesture)



                  



                  



                          let districtGesture = EducationCheckBoxGesture(target: self, action: #selector(pickDistrict))



                          districtGesture.districtTextField = cell.districtTextField



                          districtGesture.districtView = cell.districtView



                          cell.districtView.addGestureRecognizer(districtGesture)



                  //



                  



                  



                  let schoolListGesture = EducationCheckBoxGesture(target: self, action: #selector(getSchoolList))


                  schoolListGesture.schoolNameLbl = cell.schoolNameLbl

                  schoolListGesture.schoolNameTextfield = cell.schoolNameTextfield



                  schoolListGesture.schoolView = cell.schoolListView



                  cell.schoolListView.addGestureRecognizer(schoolListGesture)



                  



                  let pickIntrestGesture = EducationCheckBoxGesture(target: self, action: #selector(pickIntrestParticipate))



                  pickIntrestGesture.intrestedParticipateTextField = IntrestedTextField



                  pickIntrestGesture.intrestedParticipateView = intrestView



                  intrestView.addGestureRecognizer(pickIntrestGesture)



                  



                  



                  



                  let classPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(classPassedOutVc))



                  classPassedOutGesture.classPassedOutTextField = cell.yearJoinedTextField



                  classPassedOutGesture.classPassedOutView = cell.classPassedOutView



                  cell.classPassedOutView.addGestureRecognizer(classPassedOutGesture)



                  



                  



                  let yearPassedOutGesture = EducationCheckBoxGesture(target: self, action: #selector(yearPassedOutVc))



                  yearPassedOutGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                  yearPassedOutGesture.yearPassedOutView = cell.yearPassedOutView
                  
                  
                  yearPassedOutGesture.yearJoinedTextField = cell.yearJoinedTextField



                  yearPassedOutGesture.classJoinedTextField = cell.classJoinedTextField
                  
                  yearPassedOutGesture.classPassedOutTextField = cell.highClassTextField


//                  yearPassedOutGesture.yearPassedOutView = cell.yearPassedOutView



                  cell.yearPassedOutView.addGestureRecognizer(yearPassedOutGesture)



                  



                  let tapGesture = EducationCheckBoxGesture(target: self, action: #selector(nextVc))



                  tapGesture.classPassedOutTextField = cell.highClassTextField



                  //        tapGesture.yearJoinedTextfield = cell.yearJoinedTxtField



                  tapGesture.yearPassedOutTextField = cell.yearPassedOutTextField



                  tapGesture.classJoinedTextField = cell.classJoinedTextField



                  //        tapGesture.intrestedParticipateTextField = cell.intrestParticipateTexxtField



                  nextView.addGestureRecognizer(tapGesture)



                  //



                  



                  



      //            let classjoinedGesture = EducationCheckBoxGesture(target: self, action: #selector(classJoined))



      //            //        classjoinedGesture.classLbl = cell.classJoinedLbl



      //            classjoinedGesture.yearJoinedView = cell.classJoinedView



      //            cell.classJoinedView.addGestureRecognizer(classjoinedGesture)



      //



      //            let highClassGesture = EducationCheckBoxGesture(target: self, action: #selector(highClassStudy))



      //            //        highClassGesture.highClassLbl = cell.highClassLbl



      //            highClassGesture.highClassView = cell.highClassStudiedView



      //            cell.highClassStudiedView.addGestureRecognizer(highClassGesture)



                  //



//                          let deletes = DeleteRowClcik(target: self, action: #selector(DeleteRows))
//
//
//
//                  //        highClassGesture.highClassLbl = cell.highClassLbl
//
//
//
//                  
//
//
//
//                  
//
//
//
//                          deletes.deleteIndex = indexPath.row
//
//
//
//                          cell.RemoveView.addGestureRecognizer(deletes)



                  



                  cell.btns.tag = indexPath.row



                  cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)



                  return cell



                  



                  



              }



              



          }



          







          



          



          



          @IBAction func saveVc(gest : EducationCheckBoxGesture){



              




              



              



              print("AllModalValeAllModalVale",AllModalVale.count)



              



          }



          



         



          private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {



              return CGSize(width: 389, height: 610)



          }



          



          



      //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {



      //        print("rowsIdwwwwww",rowsId.count)



      //        return rowsId.count



      //    }



      //



      //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



      //



      //



      //    }



      //



          



          @objc func handleRegister(_ sender: UIButton){


              
              print("BtnWorking",sender.tag)

              if ChangeEducationalDetail == 1 {


                  if editId == "1"{



                      





                      rowsId.remove(at:sender.tag)
                      



                  }else{
                      
                      
                      
                      
                      
                      //                  profileInstituteList.remove(at: sender.tag+1)
                      
                      
                      
                      profileInstituteList.remove(at:sender.tag)
//                      rowsId.remove(at:sender.tag-1)
                      
                  }

              }else{



                  



                  



      //            profileInstituteList.removeLast()



                  rowsId.remove(at:sender.tag)



              }



             



      //







              



      //



      //        if AllModalVale.count == 0 {



      //



      //



      //        }else{



      //



      //            AllModalVale.removeLast()



      //        }



                  



            



              cv.deleteItems(at: [IndexPath(row:sender.tag,section:0)])



      //        cv.deleteItemsAtIndexPaths([indexPath.item])



//              tv.deleteRows(at:[IndexPath(row:sender.tag,section:0)],with:.none)



          }



          



        







          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {



              return 400



          }



          



          



      //    @IBAction func classJoined(ges : EducationCheckBoxGesture) {



      //



      //        print("drop")



      //



      //



      //       if ges.yearJoinedView.backgroundColor == .white {



      //           ges.yearJoinedView.backgroundColor = .black



      ////           ges.classLbl.textColor = .white



      //           classJoinedTextStr = "1"



      //



      //       }else{



      //           ges.yearJoinedView.backgroundColor = .white



      //           classJoinedTextStr = "0"



      ////           ges.classLbl.textColor = .black



      //       }



      //



      //



      //



      //



      //    }



      //



          



      //    @IBAction func highClassStudy(ges : EducationCheckBoxGesture) {



      //        print("workingFine")



      //



      //       if ges.highClassView.backgroundColor == .white {



      //           ges.highClassView.backgroundColor = .black



      //           highClassText = 1



      ////           ges.highClassLbl.textColor = .white



      //



      //       }else{



      //           ges.highClassView.backgroundColor = .white



      //           highClassText = 0



      ////           ges.highClassLbl.textColor = .white



      //       }



      //



      //



      //



      //    }



          



          



          



      }















      class EducationCheckBoxGesture : UITapGestureRecognizer {



          



          



          



          



        



          var tapView : UIView!



           var currentDesingnation : UITextField!



          var yesNoLbl : UILabel!



          var schoolNameTextfield : UITextField!



          var currentDesingnationStr : String!



         var schoolNameStr : String!



          var countryTextField : UITextField!



          var stateTextField : UITextField!



          var districtTextField : UITextField!



         

          var schoolNameLbl : UILabel!

          var classPassedOutTextField : UITextField!

          var yearJoinedTextField : UITextField!

          var yearPassedOutTextField : UITextField!



          var intrestedParticipateTextField : UITextField!



          var stateView : UIView!



          var countryView : UIView!



          var schoolView : UIView!



          var districtView : UIView!



          var classJoinedTextField : UITextField!



          var intrestedParticipateView : UIView!



          var classPassedOutView : UIView!



          var yearPassedOutView : UIView!



          var yearJoinedView : UIView!



          var highClassView : UIView!



          var classLbl : UILabel!



          var highClassLbl : UILabel!



         



      }











      class DeleteRowClcik : UITapGestureRecognizer{



          



          



          var deleteIndex : Int!



          



          



      }

      

     
