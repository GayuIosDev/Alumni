//
//  HomePageViewController.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper
import  DropDown


class HomePageViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {
    
    @IBOutlet weak var nameHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var batchHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var professionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var companyHeight: NSLayoutConstraint!
    
    
    
    
    
    
    @IBOutlet weak var nameTop: NSLayoutConstraint!
    
    @IBOutlet weak var batchTop: NSLayoutConstraint!
    
    
    @IBOutlet weak var companyTop: NSLayoutConstraint!
    
    @IBOutlet weak var professionTop: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var professionTextField: UITextField!
    
    
    @IBOutlet weak var BatchTextField: UITextField!
    
    
    @IBOutlet weak var companyTextField: UITextField!
    
    
    
    
    
    @IBOutlet weak var typeTextTop: NSLayoutConstraint!
    
    @IBOutlet weak var setCompanyNameLbl: UILabel!
    
    @IBOutlet weak var setCompanyNameView: UIView!
    
    
    @IBOutlet weak var textTypeView: UIView!
    
    
    
    @IBOutlet weak var filterClickView: UIView!
    
    @IBOutlet weak var networkEditText: UITextField!
    
    
    
    @IBOutlet weak var setProfessionLbl: UILabel!
    @IBOutlet weak var setProfeesionView: UIView!
    
    
    
    @IBOutlet weak var setBatchLbl: UILabel!
    @IBOutlet weak var setNameView: UIView!
    
    @IBOutlet weak var setBatchView: UIView!
    @IBOutlet weak var setNameLbl: UILabel!
    @IBOutlet weak var showResultView: UIView!
    
    
    @IBOutlet weak var clearFilter: UIView!
    
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var companyNameLbl: UILabel!
    
    
    @IBOutlet weak var companyNAmeView: UIViewX!
    
    
    @IBOutlet weak var searchCloseImg: UIImageView!
    
    
    
    
    @IBOutlet weak var galleryHeight: NSLayoutConstraint!
    
    
    
    
    
    @IBOutlet weak var cvBottomLeading: NSLayoutConstraint!
    
    
    @IBOutlet weak var cvTop: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var galleryDropDownView: UIView!
    
    
    
    @IBOutlet weak var galleryLbl: UILabel!
    @IBOutlet weak var gallerview: UIView!
    
    
    
    
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var passedYrLbl: UILabel!
    
    
    @IBOutlet weak var professionLbl: UILabel!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    @IBOutlet weak var searchBarr: UITextField!
    
    @IBOutlet weak var networkSearchListView: UIView!
    @IBOutlet weak var searchCloseView: UIView!
    @IBOutlet weak var networkShowHeight: NSLayoutConstraint!
    @IBOutlet weak var batchView: UIViewX!
    @IBOutlet weak var nameView: UIViewX!
    
    @IBOutlet weak var nameBatchDeisgView: UIView!
    
    @IBOutlet weak var networkSortView: UIView!
    
    @IBOutlet weak var NetworkShowView: UIView!
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var designationView: UIViewX!
    
    
    @IBOutlet weak var searchBarWidth: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var addViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var requestAidViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var yourReqLbl: UILabel!
    @IBOutlet weak var reqLbl: UILabel!
    
    
    @IBOutlet weak var requestAidView: UIViewX!
    
    
    @IBOutlet weak var assistView: UIView!
    
    
    
    @IBOutlet weak var assistViewHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var yourRequestView: UIViewX!
    @IBOutlet weak var requestView: UIViewX!
    
    
    
    @IBOutlet weak var noRecordLbl: UILabel!
    
    @IBOutlet weak var noRecordView: UIView!
    
    
    @IBOutlet weak var addView: UIView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    
    @IBOutlet weak var searchCloseViewWidth: NSLayoutConstraint!
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var createAddView: UIViewX!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var schoolNameLbl: UILabel!
    
    @IBOutlet weak var cvBottom: UICollectionView!
    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var SearchCloseWith: NSLayoutConstraint!
    @IBOutlet weak var alumniPinkGifView: UIViewX!
    
    @IBOutlet weak var appShareView: UIView!
    
    var menuType : String!
    
    let cvRowIdentifier = "HomePageCollectionViewCell"
    let cvBottomRowIdentifier = "CvBottomCollectionViewCell"
    let eventRowIdentifier = "EventListShowingCollectionViewCell"
    let networkRowIdentifier = "NetworkRevisedCollectionViewCell"
    let contributeRowIdentifier = "GetContributeListCollectionViewCell"
    let chatRowIdentifier =  "HomePageChatCollectionViewCell"
    let schoolGalleryRowIdentifier =  "HomePageSchoolGalleryCollectionViewCell"
    let aluminiowIdentifier =  "AlumniCollectionViewCell"
    let assistRowIdentifier = "AssistNewCollectionViewCell"
    let InfoIndentifer = "InfoCollectionViewCell"
    
    
    
    var clearFilterType = 0
    var getNetWorkAlumniData : [NetworkAlumniData] = []
    var getNetWorkInstituteData : [NetworkInstituteData] = []
    var contributeData : [GetInstituteContributeResponseData] = []
    var contributeAlumniData : [GetAlumniSupportRequestReesponseData] = []
    var bulletPoints : [GetContributeBulletPoints] = []
    var contributeMedia : [GetContributeReferenceMedia] = []
    var instGalleryData : [GalleryGetInstituteListData] = []
    var getPhotos : [GetGalleryPhotos] = []
    var getAssistData : [GetAssistListtData] = []
    var getDataAll : [GetAssistListtData] = []
    var getNetWorkAlumniData2 : [NetworkAlumniData] = []
    var AlumniGalleryData : [GalleryGetAlumniInstituteData] = []
    var passGetAlumniData : [GetAlumniEventDetailData] = []
    var clone_list : [NetworkInstituteData] = []
    var alumni_clone_list : [NetworkAlumniData] = []
    var getNetWorkInstituteData2 : [NetworkInstituteData] = []
    
    var refrenceMediaContribute : [GetContributeAlumniReferenceMedia] = []
    var getDeviceID :String!
    var galleryInstIDArr : [Int] = []
    var galleryInstID : Int!
    var institute : [String] = []
    var getData : [GetAssistListtData] = []
    
    
    var clickType  : Int! = 1
    var drop_down = DropDown()
    
    var icon : [IconItem] =
    [
        IconItem(text: "EVENTS", selected: true),
        IconItem(text: "ALUMNI DIRECTORY", selected: false),
        //            IconItem(text: "ALUMINI", selected: false),
        IconItem(text: "FUND RAISING", selected: false),
        //        IconItem(text: "CHATS", selected: false),
        IconItem(text: "GALLERY", selected: false),
        
    ]
    
    var stringss : [String] = []
    
    var deleteIDForGallary : [Int] = []
    
    var searchType : String! = "Name"
    var clickAssistRequestType = "Request"
    
    var iconAlumni : [IconItem] =
    [
        IconItem(text: "EVENTS", selected: true),
        IconItem(text: "ALUMNI NETWORK", selected: false),
        //            IconItem(text: "ALUMINI", selected: false),
        IconItem(text: "CONTRIBUTE", selected: false),
        //        IconItem(text: "CHATS", selected: false),
        IconItem(text: "GALLERY", selected: false),
        IconItem(text: "ASSIST", selected: false),
        
    ]
    var alumniContributeMedia : [GetContributeAlumniReferenceMedia] = []
    
    var getInstituteData : [GetInstituteEventDetailData] = []
    var getInstituteAfterOffset : [GetInstituteEventDetailData] = []
    var memberType : Int!
    var schoolName : String!
    var token : String!
    var ClickViewName : String!
    var getOffset = 0
    var instituteId : Int! = 0
    var refreshControl = UIRefreshControl()
    var galleryInId : Int!
    var userName : String!
    
    
    var eventInfoIdforRefer = 0
    var networkInfoIdforRefer = 0
    var galleryInfoIdforRefer = 0
    var contributeInfoIdforRefer = 0
    var assistInfoIdforRefer = 0
    var infoRefrenceArray : [String] = []
    
    
    var showResultType = 0
    var nameText = ""
    var batchText = 0
    var professionText = ""
    var cNameText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        let defaults =  UserDefaults.standard
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        schoolName = defaults.string(forKey: Constant.DefaultsKeys.schoolName)
        userName = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        addView.layer.cornerRadius = 25
        
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        networkShowHeight.constant = 50
        
        print("HomePageSCREEN")
        
        
        textTypeView.isHidden = true
        showResultView.isHidden = true
        
        setNameView.isHidden = true
        setBatchView.isHidden = true
        setProfeesionView.isHidden = true
        setCompanyNameView.isHidden = true
        networkEditText.isHidden = false
        companyTextField.isHidden = true
        professionTextField.isHidden = true
        BatchTextField.isHidden = true
        
        
        setNameLbl.text = ""
        setBatchLbl.text = ""
        setProfessionLbl.text = ""
        setCompanyNameLbl.text = ""
        
        nameText = ""
        batchText = 0
        cNameText = ""
        professionText = ""
        
        networkEditText.text = ""
        professionTextField.text = ""
        BatchTextField.text = ""
        companyTextField.text = ""
        
        
        nameView.backgroundColor = .black
        nameLbl.textColor = .white
        companyNAmeView.backgroundColor = .white
        companyNameLbl.textColor = .black
        
        batchView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        designationView.backgroundColor = .white
        professionLbl.textColor = .black
        
        //        set.isHidden = true
        
        
        addDoneButtonOnKeyboard()
        gallerview.isHidden = true
        galleryHeight.constant = 0
        getDeviceID = UIDevice.current.identifierForVendor!.uuidString
        
        assistView.isHidden = true
        requestAidView.isHidden = true
        assistViewHeight.constant = 0
        
        let filterGes = UITapGestureRecognizer(target: self, action: #selector(filterVc))
        networkSortView.addGestureRecognizer(filterGes)
        //        searchCloseView.isHidden = true
        
        
        addView.isHidden = true
        gallerview.isHidden = true
        requestAidViewHeight.constant = 50
        galleryHeight.constant = 0
        //        searchTextField.delegate = self
        
        //        let specficSearcGes = UITapGestureRecognizer(target: self, action: #selector(searchFilter))
        //
        //        networkSearchListView.addGestureRecognizer(specficSearcGes)
        
        
        let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
        //        addGes.addTitleName = "EVENTS"
        addView.addGestureRecognizer(addGes)
        
        
        sideMenuView.isHidden = true
        
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        
        
        let nameGesture  = UITapGestureRecognizer(target: self, action: #selector(nameClick))
        nameView.addGestureRecognizer(nameGesture)
        
        let clearFilterGesture  = UITapGestureRecognizer(target: self, action: #selector(clearFilterAct))
        clearFilter.addGestureRecognizer(clearFilterGesture)
        
        
        
        
        
        let companyGesture  = UITapGestureRecognizer(target: self, action: #selector(companyClick))
        companyNAmeView.addGestureRecognizer(companyGesture)
        
        let passedyrGesture  = UITapGestureRecognizer(target: self, action: #selector(passedYrClick))
        batchView.addGestureRecognizer(passedyrGesture)
        
        let professionGesture  = UITapGestureRecognizer(target: self, action: #selector(professionClick))
        designationView.addGestureRecognizer(professionGesture)
        
        
        
        
        
        let setameGesture  = UITapGestureRecognizer(target: self, action: #selector(setNameClick))
        setNameView.addGestureRecognizer(setameGesture)
        
        let batchGesture  = UITapGestureRecognizer(target: self, action: #selector(setBatchClick))
        setBatchView.addGestureRecognizer(batchGesture)
        
        let designationGesture  = UITapGestureRecognizer(target: self, action: #selector(setProfessionClick))
        setProfeesionView.addGestureRecognizer(designationGesture)
        
        
        let setCompanyGesture  = UITapGestureRecognizer(target: self, action: #selector(setCompaanyClick))
        setCompanyNameView.addGestureRecognizer(setCompanyGesture)
        
        
        
        
        sideMenuView.isHidden = true
        
        //        searchCloseView.isHidden = true
        //        SearchCloseWith.constant = 0
        
        //        searchBarWidth.constant = 340
        
        let galleryDropDown = UITapGestureRecognizer(target: self, action: #selector(pickInstitute))
        gallerview.addGestureRecognizer(galleryDropDown)
        
        let filterDropDown = UITapGestureRecognizer(target: self, action: #selector(FilterClickAct))
        filterClickView.addGestureRecognizer(filterDropDown)
        
        
        
        
        
        
        //
        overrideUserInterfaceStyle = .light
        //        appShareView.isHidden = true
        
        print("getDeviceID",getDeviceID)
        
        var userId  = defaults.integer(forKey: Constant.DefaultsKeys.LoginId)
        
        
        SocketIOManager.sharedInstance.establishConnection()
        //
        SocketIOManager.socket.on("on_connect") { [self] dataArray, ack in
            print("socket connected \(dataArray)")
            SocketIOManager.socket.emit("login_user",userId)
        }
        
        
        var token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        addView.isHidden = true
        NetworkShowView.isHidden = true
        networkShowHeight.constant = 0
        
        
        print("tok111entoken",token)
        
        
        nameText = networkEditText.text!
        cv.dataSource = self
        cv.delegate = self
        overrideUserInterfaceStyle = .light
        
        
        //        searchCloseView.isHidden = true
        cvBottom.dataSource = self
        cvBottom.delegate = self
        
        cv.register(UINib(nibName: cvRowIdentifier, bundle: nil), forCellWithReuseIdentifier: cvRowIdentifier)
        cvBottom.register(UINib(nibName: aluminiowIdentifier, bundle: nil), forCellWithReuseIdentifier: aluminiowIdentifier)
        
        
        cvBottom.register(UINib(nibName: eventRowIdentifier, bundle: nil), forCellWithReuseIdentifier: eventRowIdentifier)
        cvBottom.register(UINib(nibName: networkRowIdentifier, bundle: nil), forCellWithReuseIdentifier: networkRowIdentifier)
        cvBottom.register(UINib(nibName: contributeRowIdentifier, bundle: nil), forCellWithReuseIdentifier: contributeRowIdentifier)
        cvBottom.register(UINib(nibName: chatRowIdentifier, bundle: nil), forCellWithReuseIdentifier: chatRowIdentifier)
        cvBottom.register(UINib(nibName: schoolGalleryRowIdentifier, bundle: nil), forCellWithReuseIdentifier: schoolGalleryRowIdentifier)
        self.cvBottom.register(UINib(nibName: assistRowIdentifier, bundle: nil), forCellWithReuseIdentifier: assistRowIdentifier)
        //
        
        cvBottom.register(UINib(nibName: InfoIndentifer, bundle: nil), forCellWithReuseIdentifier: InfoIndentifer)
        
        profileImg.layer.cornerRadius = 25
        let profileGesture = UITapGestureRecognizer(target: self, action: #selector(profileVc))
        profileView.addGestureRecognizer(profileGesture)
        
        var profileImgStr = defaults.string(forKey: Constant.DefaultsKeys.profileImg)
        
        if profileImgStr == "" {
            
            let gifURL = UIImage.gif(name: "empty_profile")
            // Use SDWebImage to load and display the GIF image
            
            profileImg.image = UIImage(named: "user")
            //            self.profileImg.image = UIImage.gif(name: "empty_profile")
        }else{
            
            if profileImgStr != nil {
                
                
                profileImg.sd_setImage(with: URL(string:  profileImgStr!), placeholderImage: UIImage(named: "image 2"))
            }else{
                let gifURL = UIImage.gif(name: "empty_profile")
                // Use SDWebImage to load and display the GIF image
                profileImg.image = UIImage(named: "user")
                //                self.profileImg.image = UIImage.gif(name: "empty_profile")
            }
        }
        
        let appShareGesture = UITapGestureRecognizer(target: self, action: #selector(shareLink))
        appShareView.addGestureRecognizer(appShareGesture)
        
        
        print("memberType", memberType!)
        
        deviceToken()
        
        let rqsAidGesture = UITapGestureRecognizer(target: self, action:  #selector(createRequestAid))
        requestAidView.addGestureRecognizer(rqsAidGesture)
        
        
        
        let showResGesture = UITapGestureRecognizer(target: self, action:  #selector(ShowResuleAction))
        showResultView.addGestureRecognizer(showResGesture)
        
        
        
        let rqsGesture = HomeRequestGesture(target: self, action:  #selector(clickRequest))
        //        rqsGesture.deleteView = cell.deleteView
        //        rqsGesture.editView = cell.editView
        //        rqsGesture.editdeleteView = cell.EditDeleteView
        
        requestView.addGestureRecognizer(rqsGesture)
        
        addDoneButtonOnKeyboard()
        
        let yourRqsGesture = HomeRequestGesture(target: self, action:  #selector(clickYourRequest))
        //        yourRqsGesture.deleteView = cell.deleteView
        //        yourRqsGesture.editView = cell.editView
        //        yourRqsGesture.editdeleteView = cell.EditDeleteView
        
        yourRequestView.addGestureRecognizer(yourRqsGesture)
        
        
        
        
        if memberType == 1 || memberType == 2 {
            
            
            getEventInstituteList()
            schoolNameLbl.text = schoolName
            requestAidViewHeight.constant = 50
            addViewHeight.constant = 50
            addView.isHidden = false
            
            
            
            
        }else{
            
            requestAidViewHeight.constant = 0
            addViewHeight.constant = 0
            addView.isHidden = true
            addViewHeight.constant = 0
            
            schoolNameLbl.text = "Welcome" + " " + userName + " " + "."
            
            getEventAlumniList()
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
        
        networkEditText.inputAccessoryView = doneToolbar
        companyTextField.inputAccessoryView = doneToolbar
        
        BatchTextField.inputAccessoryView = doneToolbar
        
        professionTextField.inputAccessoryView = doneToolbar
        
    }
    
    @objc func doneButtonAction(){
        
        
        
        
        
        networkEditText.resignFirstResponder()
        companyTextField.resignFirstResponder()
        
        BatchTextField.resignFirstResponder()
        
        professionTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func FilterClickAct() {
        
        print("FilterClickclearFilterType",clearFilterType)
        if clearFilterType == 1 {
            
            //
            
            nameView.backgroundColor = .black
            //                cvTop.constant = 100
            nameLbl.textColor = .white
            companyNAmeView.backgroundColor = .white
            companyNameLbl.textColor = .black
            
            batchView.backgroundColor = .white
            passedYrLbl.textColor = .black
            
            designationView.backgroundColor = .white
            professionLbl.textColor = .black
            
            
            
            showResultType = 1
            sideMenuView.isHidden = false
            cvBottomLeading.constant = 150
            cvTop.constant = 150
            filterClickView.isHidden = true
            
            
            showResultView.isHidden = false
            typeTextTop.constant = 20
            networkEditText.text = ""
            companyTextField.text = ""
            professionTextField.text = ""
            BatchTextField.text = ""
            
            networkEditText.isHidden = false
            companyTextField.isHidden = true
            professionTextField.isHidden = true
            BatchTextField.isHidden = true
            
            
            
            textTypeView.isHidden = false
            cvTop.constant  = 0
            cvBottom.dataSource = self
            cvBottom.delegate = self
            cvBottom.reloadData()
            
        }else{
            
            
            
            print("typeTextTop.constant",typeTextTop.constant)
            
            showResultType = 1
            sideMenuView.isHidden = false
            cvBottomLeading.constant = 150
            cvTop.constant = 150
            filterClickView.isHidden = true
            
            
            showResultView.isHidden = false
            
            networkEditText.isHidden = false
            companyTextField.isHidden = true
            professionTextField.isHidden = true
            BatchTextField.isHidden = true
            print("setNameLbl.text!.count",setNameLbl.text!.count)
            print("setCompanyNameLbltext!count",setCompanyNameLbl.text!.count)
            print("setBatchLbl!count",setBatchLbl.text!.count)
            print("professionLbltext!count",setProfessionLbl.text!.count)
            print("nameHeight111constant",nameHeight.constant)
            
            
            
            
            
            
//            if networkEditText.text != "" {
//                
//                setNameView.isHidden = false
//                setNameLbl.isHidden = false
//                setNameLbl.text = "Name :" + " " + networkEditText.text!
//                nameHeight.constant = 35
//                typeTextTop.constant = 50
//                networkShowHeight.constant = 90
//                
//                if professionTextField.text != "" {
//                    if BatchTextField.text == ""  {
//                        professionTop.constant = -35
//                        
//                        setProfeesionView.isHidden = false
//                        setProfessionLbl.isHidden = false
//                        professionHeight.constant = 35
//                        
//                        typeTextTop.constant = 110
//                        networkShowHeight.constant = 140
//                        
//                        setProfessionLbl.text = "Profession : " + professionTextField.text!
//                        
//                        
//                        
//                    }else{
//                        professionTop.constant = 0
//                        setProfeesionView.isHidden = false
//                        setProfessionLbl.isHidden = false
//                        professionHeight.constant = 35
//                        typeTextTop.constant = 120
//                        setProfessionLbl.text = "Profession : " + professionTextField.text!
//                        
//                        networkShowHeight.constant = 150
//                    }
//                    
//                    
//                    if companyTextField.text != "" {
//                        companyTop.constant = 5
//                        
//                        setCompanyNameView.isHidden = false
//                        setCompanyNameLbl.isHidden = false
//                        companyHeight.constant = 35
//                        
//                        typeTextTop.constant = 140
//                        networkShowHeight.constant = 170
//                        
//                        
//                        setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                        
//                        
//                        
//                        
//                        
//                    }else{
//                        //                        companyTop.constant = 5
//                        
//                        setCompanyNameView.isHidden = true
//                        setCompanyNameLbl.isHidden = true
//                        companyHeight.constant = 0
//                        //
//                        //                        typeTextTop.constant = 140
//                        //                        networkShowHeight.constant = 170
//                        //
//                        
//                        
//                    }
//                    
//                    
//                    
//                }else if companyTextField.text != "" {
//                    if professionTextField.text == "" &&   BatchTextField.text == "" {
//                        companyTop.constant = -80
//                        setCompanyNameView.isHidden = false
//                        setCompanyNameLbl.isHidden = false
//                        companyHeight.constant = 35
//                        
//                        typeTextTop.constant = 95
//                        networkShowHeight.constant = 140
//                        
//                        setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                        
//                        
//                        
//                        
//                        
//                        
//                    }else if BatchTextField.text != ""{
//                        companyTop.constant = -35
//                        
//                        setCompanyNameView.isHidden = true
//                        setCompanyNameLbl.isHidden = true
//                        companyHeight.constant = 0
//                        //
//                        
//                        setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                        
//                        typeTextTop.constant = 140
//                        networkShowHeight.constant = 170
//                        //
//                        
//                        
//                    }
//                    
//                    
//                }
//            }
//            else {
//                if BatchTextField.text == ""  {
//                    
//                    
//                    if networkEditText.text != "" {
//                        
//                        nameTop.constant = 0
//                        
//                        setNameView.isHidden = false
//                        setNameLbl.isHidden = false
//                        nameHeight.constant = 35
//                        
//                        typeTextTop.constant = 110
//                        networkShowHeight.constant = 140
//                        
//                        setNameLbl.text = "Name :" + " " + networkEditText.text!
//                        
//                        
//                        
//                        
//                        
//                        if professionTextField.text != "" {
//                            
//                            professionTop.constant = -35
//                            
//                            setProfeesionView.isHidden = false
//                            setProfessionLbl.isHidden = false
//                            professionHeight.constant = 35
//                            
//                            typeTextTop.constant = 110
//                            networkShowHeight.constant = 140
//                            
//                            setProfessionLbl.text = "Profession : " + professionTextField.text!
//                            
//                            
//                            if companyTextField.text != "" {
//                                
//                                
//                                
//                                
//                                companyTop.constant = 5
//                                
//                                setCompanyNameView.isHidden = false
//                                setCompanyNameLbl.isHidden = false
//                                companyHeight.constant = 35
//                                
//                                typeTextTop.constant = 140
//                                networkShowHeight.constant = 170
//                                
//                                
//                                setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                                
//                                
//                                
//                                
//                                
//                            }else{
//                                //                        companyTop.constant = 5
//                                
//                                setCompanyNameView.isHidden = true
//                                setCompanyNameLbl.isHidden = true
//                                companyHeight.constant = 0
//                                //
//                                //                        typeTextTop.constant = 140
//                                //                        networkShowHeight.constant = 170
//                                //
//                                
//                            }
//                            
//                        }else{
//                            setProfeesionView.isHidden = true
//                            setProfessionLbl.isHidden = true
//                            professionHeight.constant = 0
//                            
//                            
//                            
//                            if companyTextField.text != "" {
//                                
//                                
//                                
//                                
//                                companyTop.constant = -95
//                                
//                                setCompanyNameView.isHidden = false
//                                setCompanyNameLbl.isHidden = false
//                                companyHeight.constant = 35
//                                
//                                typeTextTop.constant = 50
//                                networkShowHeight.constant = 80
//                                
//                                
//                                setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                                
//                                
//                                
//                                
//                                
//                            }else{
//                                //                        companyTop.constant = 5
//                                
//                                setCompanyNameView.isHidden = true
//                                setCompanyNameLbl.isHidden = true
//                                companyHeight.constant = 0
//                                //
//                                //                        typeTextTop.constant = 140
//                                //                        networkShowHeight.constant = 170
//                                //
//                                
//                            }
//                        }
//                    }else{
//                        //                        nameTop.constant = 0
//                        
//                        setNameView.isHidden = true
//                        setNameLbl.isHidden = true
//                        nameHeight.constant = 0
//                        if professionTextField.text != "" {
//                            
//                            professionTop.constant = -35
//                            
//                            setProfeesionView.isHidden = false
//                            setProfessionLbl.isHidden = false
//                            professionHeight.constant = 35
//                            
//                            typeTextTop.constant = 110
//                            networkShowHeight.constant = 140
//                            
//                            setProfessionLbl.text = "Profession : " + professionTextField.text!
//                            
//                            
//                            if companyTextField.text != "" {
//                                
//                                
//                                
//                                
//                                companyTop.constant = 5
//                                
//                                setCompanyNameView.isHidden = false
//                                setCompanyNameLbl.isHidden = false
//                                companyHeight.constant = 35
//                                
//                                typeTextTop.constant = 140
//                                networkShowHeight.constant = 170
//                                
//                                
//                                setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                                
//                                
//                                
//                                
//                                
//                            }else{
//                                
//                                setCompanyNameView.isHidden = true
//                                setCompanyNameLbl.isHidden = true
//                                companyHeight.constant = 0
//                                
//                                
//                            }
//                            
//                        }else{
//                            setProfeesionView.isHidden = true
//                            setProfessionLbl.isHidden = true
//                            professionHeight.constant = 0
//                            
//                            
//                            
//                            if companyTextField.text != "" {
//                                
//                                
//                                
//                                
//                                companyTop.constant = -95
//                                
//                                setCompanyNameView.isHidden = false
//                                setCompanyNameLbl.isHidden = false
//                                companyHeight.constant = 35
//                                
//                                typeTextTop.constant = 50
//                                networkShowHeight.constant = 80
//                                
//                                
//                                setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                                
//                                
//                                
//                                
//                                
//                            }else{
//                                //                        companyTop.constant = 5
//                                
//                                setCompanyNameView.isHidden = true
//                                setCompanyNameLbl.isHidden = true
//                                companyHeight.constant = 0
//                                //
//                                //                        typeTextTop.constant = 140
//                                //                        networkShowHeight.constant = 170
//                                //
//                                
//                            }
//                        }
//                        
//                    }
//                    
//                    
//                }else{
//                    batchTop.constant = -15
//                    
//                    setBatchView.isHidden = false
//                    setBatchLbl.isHidden = false
//                    batchHeight.constant = 35
//                    
//                    typeTextTop.constant = 80
//                    networkShowHeight.constant = 100
//                    
//                    setBatchLbl.text = "Batch :"  + BatchTextField.text!
//                    
//                    
//                    if professionTextField.text != "" {
//                        
//                        professionTop.constant = 5
//                        setProfeesionView.isHidden = false
//                        setProfessionLbl.isHidden = false
//                        professionHeight.constant = 35
//                        
//                        typeTextTop.constant = 110
//                        networkShowHeight.constant = 140
//                        
//                        setProfessionLbl.text = "Profession : " + professionTextField.text!
//                        
//                        
//                        if companyTextField.text != "" {
//                            
//                            
//                            
//                            
//                            companyTop.constant = 10
//                            
//                            setCompanyNameView.isHidden = false
//                            setCompanyNameLbl.isHidden = false
//                            companyHeight.constant = 35
//                            
//                            typeTextTop.constant = 170
//                            networkShowHeight.constant = 200
//                            
//                            
//                            setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                            
//                            
//                            
//                            
//                            
//                        }else{
//                            
//                            setCompanyNameView.isHidden = true
//                            setCompanyNameLbl.isHidden = true
//                            companyHeight.constant = 0
//                            
//                            
//                        }
//                        
//                    }else{
//                        setProfeesionView.isHidden = true
//                        setProfessionLbl.isHidden = true
//                        professionHeight.constant = 0
//                        
//                        
//                        
//                        if companyTextField.text != "" {
//                            
//                            
//                            
//                            
//                            companyTop.constant = -95
//                            
//                            setCompanyNameView.isHidden = false
//                            setCompanyNameLbl.isHidden = false
//                            companyHeight.constant = 35
//                            
//                            typeTextTop.constant = 50
//                            networkShowHeight.constant = 80
//                            
//                            
//                            setCompanyNameLbl.text = "Company : " + companyTextField.text!
//                            
//                            
//                            
//                            
//                            
//                        }else{
//                            //                        companyTop.constant = 5
//                            
//                            setCompanyNameView.isHidden = true
//                            setCompanyNameLbl.isHidden = true
//                            companyHeight.constant = 0
//                            
//                            
//                        }
//                    }
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
//            }
            
        
            
            
            print("nameViewbackgroundColor",nameView.backgroundColor)
            print("nameViewcompanyNAmeView",companyNAmeView.backgroundColor)
            print("nameViewdesignationView",designationView.backgroundColor)
            print("nameViewbatchView",batchView.backgroundColor)

            if nameView.backgroundColor == .black {
                networkEditText.isHidden = false
                BatchTextField.isHidden = true
                companyTextField.isHidden = true
                professionTextField.isHidden = true
                if setNameLbl.text!.count < 7 || setNameLbl.text!.count == 0 {
                    setNameView.isHidden = true
                    typeTextTop.constant = 25
                    networkShowHeight.constant = 50
                }else{
                    setNameView.isHidden = false
                    typeTextTop.constant = 60
                    networkShowHeight.constant = 90
                    
                }
                
                
//                if nameHeight.constant == 35.0 {
//                    typeTextTop.constant = 25
//                    networkShowHeight.constant = 50
//                }else{
//                    typeTextTop.constant = 25
//                    networkShowHeight.constant = 50
//                }
                
                
            }
            if batchView.backgroundColor == .black {
                
                networkEditText.isHidden = true
                BatchTextField.isHidden = false
                companyTextField.isHidden = true
                professionTextField.isHidden = true
                
                if setBatchLbl.text!.count < 8 || setBatchLbl.text!.count < 0 {
                    setBatchView.isHidden = true
                    typeTextTop.constant = 25
                    networkShowHeight.constant = 50
                }else{
                    setBatchView.isHidden = false
                    typeTextTop.constant = 45
                    networkShowHeight.constant = 70
                    
                }
                
             
                
                
                if nameHeight.constant == 35.0  && batchHeight.constant == 35.0 {
                    typeTextTop.constant = 100
                    networkShowHeight.constant = 180
                }else{
                    typeTextTop.constant = -130
                    networkShowHeight.constant = 100
                }
                
                
            }
            if designationView.backgroundColor == .black {
                
                print("professionLbltext!",setProfessionLbl.text!.count)
                
                networkEditText.isHidden = true
                BatchTextField.isHidden = true
                companyTextField.isHidden = true
                professionTextField.isHidden = false
                
                if setProfessionLbl.text!.count < 19 || setProfessionLbl.text!.count == 0 {
                    setProfeesionView.isHidden = true
                    typeTextTop.constant = 25
                    networkShowHeight.constant = 50
                }else{
                    setProfeesionView.isHidden = false
                    typeTextTop.constant = 45
                    networkShowHeight.constant = 70
                    
                }
                
                if nameHeight.constant == 35.0  && batchHeight.constant == 35.0 && professionHeight.constant == 35.0 {
                    typeTextTop.constant = 130
                    networkShowHeight.constant = 210
                }else{
                    typeTextTop.constant = 130
                    networkShowHeight.constant = 200
                }
                //                    networkShowHeight.constant = 150
            }
            if companyNAmeView.backgroundColor == .black {
                //                setCompanyNameView.isHidden = false
                //                typeTextTop.constant = -65
                
                networkEditText.isHidden = true
                BatchTextField.isHidden = true
                companyTextField.isHidden = false
                professionTextField.isHidden = true
                
                if setCompanyNameLbl.text!.count < 14 || setCompanyNameLbl.text!.count == 0{
                    setCompanyNameView.isHidden = true
                    typeTextTop.constant = 25
                    networkShowHeight.constant = 50
                }else{
                    setCompanyNameView.isHidden = false
                    typeTextTop.constant = 45
                    networkShowHeight.constant = 70
                    
                }
                
                if nameHeight.constant == 35.0 && batchHeight.constant == 35.0 && professionHeight.constant == 35.0 && companyHeight.constant == 35.0 {
                    typeTextTop.constant = 185
                    setNameView.isHidden = false
                    setBatchView.isHidden = false
                    //                    setCompanyNameView.isHidden = false
                    setProfeesionView.isHidden = false
                    
                    networkShowHeight.constant = 240
                }else{
                    typeTextTop.constant = 130
                    networkShowHeight.constant = 200
                }
              
                //                    networkShowHeight.constant = 150
            }
            
            
            
            
         
            
            textTypeView.isHidden = false
            cvTop.constant  = 0
            cvBottom.dataSource = self
            cvBottom.delegate = self
            cvBottom.reloadData()
        }
    }
    
    
    @IBAction func clearFilterAct() {
        networkShowHeight.constant = 50
        filterClickView.isHidden = true
        clearFilterType = 1
        networkEditText.text = ""
        companyTextField.text = ""
        professionTextField.text = ""
        BatchTextField.text = ""
        
        
        
        setNameLbl.text = ""
        setBatchLbl.text = ""
        setCompanyNameLbl.text = ""
        setProfessionLbl.text = ""

        
        cvBottomLeading.constant = 150
        cvTop.constant = 150
        
        typeTextTop.constant = 30
        companyNAmeView.backgroundColor = .white
        companyNameLbl.textColor = .black
        
        batchView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        designationView.backgroundColor = .white
        professionLbl.textColor = .black
        
        nameView.backgroundColor = .black
        nameLbl.textColor = .white
        
        
        networkEditText.isHidden = false
        BatchTextField.isHidden = true
        professionTextField.isHidden = true
        companyTextField.isHidden = true
        setNameView.isHidden = true
        setCompanyNameView.isHidden = true
        
        setProfeesionView.isHidden = true
        setBatchView.isHidden = true
        
        
        textTypeView.isHidden = false
        
        
        cvBottom.dataSource = self
        cvBottom.delegate = self
        cvBottom.reloadData()
        
    }
    
    
    @IBAction func setNameClick() {
        
        
        setNameView.isHidden = true
        nameText = ""
        networkEditText.text = ""
        
        nameView.backgroundColor = .white
        nameLbl.textColor = .black
        
    }
    
    @IBAction func setBatchClick() {
        
        setBatchView.isHidden = true
        BatchTextField.text = ""
        batchText = 0
        
        batchView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        if nameView.backgroundColor == .black {
            print("nameViewbackgroundColor")
            if setNameLbl.text!.count < 7 || setNameLbl.text!.count == 0 {
                setNameView.isHidden = true
                print("setNameLblcounCondition")
                nameHeight.constant = 0
                
                typeTextTop.constant = 25
                networkShowHeight.constant = 50
            }else{
                setNameView.isHidden = false
                typeTextTop.constant = 60
                nameHeight.constant = 35
                
                print("setNamudehru",setNameLbl.text!.count)
                networkShowHeight.constant = 90
                
            }
        }
    }
    
    @IBAction func setProfessionClick() {
        
        setProfeesionView.isHidden = true
        professionText = ""
        professionTextField.text = ""
        
        designationView.backgroundColor = .white
        professionLbl.textColor = .black
        
        
    }
    
    @IBAction func setCompaanyClick() {
        //        typeTextTop.constant = -50
        //               textTypeView.isHidden = false
        setCompanyNameView.isHidden = true
        cNameText = ""
        companyTextField.text = ""
        
        companyNAmeView.backgroundColor = .white
        companyNameLbl.textColor = .black
        
    }
    
    
    @IBAction func ShowResuleAction() {
        
        
        print("clearFilterTypeclearFilterType",clearFilterType)
        print("networkEditTexttext!",networkEditText.text)
        print("companyTextFieldtext!",companyTextField.text)
        print("professionTextFieldtext!",professionTextField.text)
        
        showResultType = 1
        
        if clearFilterType == 1 {
            clearFilterType = 1
            if nameView.backgroundColor == .black {
                
                let aString = setNameLbl.text!
                print("aString",aString)
                let newString = aString.replacingOccurrences(of: "Name : ", with: "", options: .literal, range: nil)
                
                print("newString",newString)
                nameText = newString
                //
            }else{
                nameText = ""
            }
            
            if designationView.backgroundColor == .black {
                let aString = setProfessionLbl.text!
                print("aString",aString)
                let newString = aString.replacingOccurrences(of: "Profession Name : ", with: "", options: .literal, range: nil)
                
                print("newString",newString)
                professionText = newString
            }else{
                professionText = ""
                
            }
            
            
            if companyNAmeView.backgroundColor == .black {
                let aString = setCompanyNameLbl.text!
                print("aString",aString)
                let newString = aString.replacingOccurrences(of: "Company Name : ", with: "", options: .literal, range: nil)
                
                print("newString",newString)
                cNameText = newString
            }else{
                cNameText = ""
                
            }
            
            if batchView.backgroundColor == .black {
                
                let aString = setBatchLbl.text!
                print("aString",aString)
                let newString = aString.replacingOccurrences(of: "Batch : ", with: "", options: .literal, range: nil)
                
                print("newString",newString)
                batchText = Int(newString) ?? 0
                
            }else{
                batchText =  0
            }
            
        }
        
        
        else{
            
            
            if nameView.backgroundColor == .black {
                
                
                
                nameText = networkEditText.text!
                print("nameText11111",nameText)
                
                
                
                
            }
            
            if designationView.backgroundColor == .black {
                professionText = professionTextField.text!
                
                
            }
            
            
            if companyNAmeView.backgroundColor == .black {
                cNameText = companyTextField.text!
                
               
                
                
            }
            
            if batchView.backgroundColor == .black {
                batchText = Int(BatchTextField.text ?? "") ?? 0
                
             
            }
            
            
            
            
        }
        
        //
        print("elseelse",clickType)
        if memberType == 1 ||  memberType == 2 {
            getNetworkInstituteList()
        }else {
            getNetworkAlumniList()
            //            }
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
        verticalIndicator.backgroundColor = UIColor.green
        
        let horizontalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 2)] as! UIImageView)
        horizontalIndicator.backgroundColor = UIColor.blue
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("menuType5",menuType)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("menuType1",menuType)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("menuType2",menuType)
    }
    
    override func viewWillLayoutSubviews() {
        
       
        print("menuType3",menuType)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        print("menuType34567",menuType)
        print("viewWillAppear")
        let defaults =  UserDefaults.standard
        
        var profileImgStr = defaults.string(forKey: Constant.DefaultsKeys.profileImg)
        
        if profileImgStr == "" {
            
            let gifURL = UIImage.gif(name: "empty_profile")
            // Use SDWebImage to load and display the GIF image
            
            profileImg.image = UIImage(named: "user")
            //            self.profileImg.image = UIImage.gif(name: "empty_profile")
        }else{
            
            if profileImgStr != nil {
                
                
                profileImg.sd_setImage(with: URL(string:  profileImgStr!), placeholderImage: UIImage(named: "image 2"))
            }else{
                
                let gifURL = UIImage.gif(name: "empty_profile")
                // Use SDWebImage to load and display the GIF image
                profileImg.image = UIImage(named: "user")
                //                self.profileImg.image = UIImage.gif(name: "empty_profile")
            }
        }
        
        
        
        
        //        getContributrList()
        
        if memberType == 1 || memberType == 2 {
            
            
            if menuType == "INSTITUTE ALUMNI DIRECTORY"{
                
               
                getNetworkInstituteList ()
                cvBottom.dataSource = self
                cvBottom.delegate = self
                cvBottom.reloadData()
                
            }else if menuType == "FUND RAISING"{
               
                getContributrList ()
                cvBottom.dataSource = self
                cvBottom.delegate = self
                cvBottom.reloadData()
                
            }else if menuType == "INSTITUTE GALLERY"{
               
                getInstituteGalleryList ()
                cvBottom.dataSource = self
                cvBottom.delegate = self
                cvBottom.reloadData()
                
            }
            else if menuType == "CHATS"{
                print("CHATS")
               
               
            }
            //
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func nameClick() {
        
        networkEditText.placeholder = "Search Your Name"
        typeTextTop.constant = 20
        textTypeView.isHidden = false
        networkEditText.isHidden = false
        companyTextField.isHidden = true
        professionTextField.isHidden = true
        BatchTextField.isHidden = true
        
        networkShowHeight.constant = 50
        networkEditText.keyboardType = .alphabet
        
        if nameView.backgroundColor ==  .black {
            print("UnSelect")
            nameView.backgroundColor = .white
            nameLbl.textColor = .black
            nameHeight.constant = 0
            nameText = ""

            
        }else{
            textTypeView.isHidden = false
            networkEditText.isHidden = false
            nameView.backgroundColor = .black
            nameLbl.textColor = .white
            print("Select")
            //            setNameView.isHidden = false
            clickType = 1
            //            nameHeight.constant = 0
            setNameLbl.text = "Name :" + " " + networkEditText.text!
            
            nameText = networkEditText.text!
            
            
            
            
            
            
            if BatchTextField.text == "" {
                batchView.backgroundColor = .white
                passedYrLbl.textColor = .black
            }
            
            if companyTextField.text == "" {
                companyNAmeView.backgroundColor = .white
                companyNameLbl.textColor = .black
            }
            
            if professionTextField.text == "" {
                designationView.backgroundColor = .white
                professionLbl.textColor = .black
                
                
            }
            
            
            
            
            if networkEditText.text != "" {
                
                setNameView.isHidden = false
                setNameLbl.isHidden = false
                setNameLbl.text = "Name :" + " " + networkEditText.text!
                nameHeight.constant = 35
                typeTextTop.constant = 50
                networkShowHeight.constant = 90
                nameView.backgroundColor = .black
                nameLbl.textColor = .white
                
                if professionTextField.text != "" {
                    if BatchTextField.text == ""  {
                        professionTop.constant = -35
                        
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 140
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        
                        
                    }else{
                        professionTop.constant = 0
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        typeTextTop.constant = 120
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        networkShowHeight.constant = 150
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                    }
                    
                    
                    if companyTextField.text != "" {
                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                    }else{
                        //                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        //                        typeTextTop.constant = 140
                        //                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                    
                    
                }else if companyTextField.text != "" {
                    if professionTextField.text == "" &&   BatchTextField.text == "" {
                        companyTop.constant = -80
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 140
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                        
                    }else if BatchTextField.text != ""{
                        companyTop.constant = -35
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                    
                }
            }
            else {
                if BatchTextField.text == ""  {
                    
                    
                    if networkEditText.text != "" {
                        
                        nameTop.constant = 0
                        
                        setNameView.isHidden = false
                        setNameLbl.isHidden = false
                        nameHeight.constant = 35
                        
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 140
                        
                        setNameLbl.text = "Name :" + " " + networkEditText.text!

                        
                        nameView.backgroundColor = .black
                        nameLbl.textColor = .white
                        
                        
                        if professionTextField.text != "" {
                            
                            professionTop.constant = -35
                            
                            setProfeesionView.isHidden = false
                            setProfessionLbl.isHidden = false
                            professionHeight.constant = 35
                            
                            typeTextTop.constant = 110
                            networkShowHeight.constant = 140
                            
                            setProfessionLbl.text = "Profession : " + professionTextField.text!
                            designationView.backgroundColor = .black
                            professionLbl.textColor = .white
                            
                            if companyTextField.text != "" {
                                
                                
                                
                                
                                companyTop.constant = 5
                                
                                setCompanyNameView.isHidden = false
                                setCompanyNameLbl.isHidden = false
                                companyHeight.constant = 35
                                
                                typeTextTop.constant = 140
                                networkShowHeight.constant = 170
                                
                                
                                setCompanyNameLbl.text = "Company : " + companyTextField.text!

                                
                                
                                
                                
                            }else{
                                //                        companyTop.constant = 5
                                
                                setCompanyNameView.isHidden = true
                                setCompanyNameLbl.isHidden = true
                                companyHeight.constant = 0
                                //
                                //                        typeTextTop.constant = 140
                                //                        networkShowHeight.constant = 170
                                //
                                
                            }
                            
                        }else{
                            setProfeesionView.isHidden = true
                            setProfessionLbl.isHidden = true
                            professionHeight.constant = 0
                            
                            
                            
                            if companyTextField.text != "" {
                                
                                
                                
                                
                                companyTop.constant = -95
                                
                                setCompanyNameView.isHidden = false
                                setCompanyNameLbl.isHidden = false
                                companyHeight.constant = 35
                                
                                typeTextTop.constant = 50
                                networkShowHeight.constant = 80
                                
                                
                                setCompanyNameLbl.text = "Company : " + companyTextField.text!

                                
                                
                                
                                
                            }else{
                                //                        companyTop.constant = 5
                                
                                setCompanyNameView.isHidden = true
                                setCompanyNameLbl.isHidden = true
                                companyHeight.constant = 0
                                //
                                //                        typeTextTop.constant = 140
                                //                        networkShowHeight.constant = 170
                                //
                                
                            }
                        }
                    }else{
//                        nameTop.constant = 0
                        
                        setNameView.isHidden = true
                        setNameLbl.isHidden = true
                        nameHeight.constant = 0
                        if professionTextField.text != "" {
                            
                            professionTop.constant = -35
                            
                            setProfeesionView.isHidden = false
                            setProfessionLbl.isHidden = false
                            professionHeight.constant = 35
                            
                            typeTextTop.constant = 110
                            networkShowHeight.constant = 140
                            
                            setProfessionLbl.text = "Profession : " + professionTextField.text!

                            designationView.backgroundColor = .black
                            professionLbl.textColor = .white
                            if companyTextField.text != "" {
                                
                                
                                
                                
                                companyTop.constant = 5
                                
                                setCompanyNameView.isHidden = false
                                setCompanyNameLbl.isHidden = false
                                companyHeight.constant = 35
                                
                                typeTextTop.constant = 140
                                networkShowHeight.constant = 170
                                
                                
                                setCompanyNameLbl.text = "Company : " + companyTextField.text!

                                
                                
                                
                                
                            }else{
                                
                                setCompanyNameView.isHidden = true
                                setCompanyNameLbl.isHidden = true
                                companyHeight.constant = 0
                               
                                
                            }
                            
                        }else{
                            setProfeesionView.isHidden = true
                            setProfessionLbl.isHidden = true
                            professionHeight.constant = 0
                            
                            
                            
                            if companyTextField.text != "" {
                                
                                
                                
                                
                                companyTop.constant = -95
                                
                                setCompanyNameView.isHidden = false
                                setCompanyNameLbl.isHidden = false
                                companyHeight.constant = 35
                                
                                typeTextTop.constant = 50
                                networkShowHeight.constant = 80
                                
                                
                                setCompanyNameLbl.text = "Company : " + companyTextField.text!

                                
                                
                                
                                
                            }else{
                                //                        companyTop.constant = 5
                                
                                setCompanyNameView.isHidden = true
                                setCompanyNameLbl.isHidden = true
                                companyHeight.constant = 0
                                //
                                //                        typeTextTop.constant = 140
                                //                        networkShowHeight.constant = 170
                                //
                                
                            }
                        }
                       
                    }
                    
                  
                }else{
                    batchTop.constant = -15
                    
                    setBatchView.isHidden = false
                    setBatchLbl.isHidden = false
                    batchHeight.constant = 35
                    
                    typeTextTop.constant = 80
                    networkShowHeight.constant = 100
                    
                    setBatchLbl.text = "Batch :"  + BatchTextField.text!

                    
                    if professionTextField.text != "" {
                        
                        professionTop.constant = 5
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 140
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        
                        if companyTextField.text != "" {
                            
                            
                            
                            
                            companyTop.constant = 10
                            
                            setCompanyNameView.isHidden = false
                            setCompanyNameLbl.isHidden = false
                            companyHeight.constant = 35
                            
                            typeTextTop.constant = 170
                            networkShowHeight.constant = 200
                            
                            
                            setCompanyNameLbl.text = "Company : " + companyTextField.text!

                            
                            
                            
                            
                        }else{
                            
                            setCompanyNameView.isHidden = true
                            setCompanyNameLbl.isHidden = true
                            companyHeight.constant = 0
                            
                            
                        }
                        
                    }else{
                        setProfeesionView.isHidden = true
                        setProfessionLbl.isHidden = true
                        professionHeight.constant = 0
                        
                        
                        
                        if companyTextField.text != "" {
                            
                            
                            
                            
                            companyTop.constant = -95
                            
                            setCompanyNameView.isHidden = false
                            setCompanyNameLbl.isHidden = false
                            companyHeight.constant = 35
                            
                            typeTextTop.constant = 50
                            networkShowHeight.constant = 80
                            
                            
                            setCompanyNameLbl.text = "Company : " + companyTextField.text!

                            
                            
                            
                            
                        }else{
                            //                        companyTop.constant = 5
                            
                            setCompanyNameView.isHidden = true
                            setCompanyNameLbl.isHidden = true
                            companyHeight.constant = 0
                           
                            
                        }
                    }
                    
                    
                    
                    
                    
                }
                
                
               
              
            }
          
        }
        
        searchType = "Name"
        //
        
    }
    
    @IBAction func searchClearList() {
        if memberType == 1 || memberType == 2 {
           
            noRecordView.isHidden = true
            alumniPinkGifView.isHidden = true
            
            gifImage.isHidden = true
            self.cvBottom.reloadData()
        }else{
            
            noRecordView.isHidden = true
            alumniPinkGifView.isHidden = true
            
            gifImage.isHidden = true
            self.cvBottom.reloadData()
        }
    }
    
    @IBAction func passedYrClick() {
        
        
        print("nameHeight.constant",nameHeight.constant)
        
        
        
        textTypeView.isHidden = false
        
        networkEditText.isHidden = true
        BatchTextField.text = ""
        
        BatchTextField.keyboardType = .numberPad
        companyTextField.isHidden = true
        professionTextField.isHidden = true
        BatchTextField.isHidden = false
        
        BatchTextField.placeholder = "Search Your Batch"
        BatchTextField.keyboardType = .numberPad
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if batchView.backgroundColor ==  .black {
            print("ntyegevhe")
            batchView.backgroundColor = .white
            passedYrLbl.textColor = .black
            setBatchView.isHidden = true
            batchText = 0
            
//
            
        }else{
            
            batchView.backgroundColor = .black
            passedYrLbl.textColor = .white
            
            
            
            
            
            
            
            
            if networkEditText.text == "" {
                nameView.backgroundColor = .white
                nameLbl.textColor = .black
            }
            
            if companyTextField.text == "" {
                companyNAmeView.backgroundColor = .white
                companyNameLbl.textColor = .black
            }
            
            if professionTextField.text == "" {
                designationView.backgroundColor = .white
                professionLbl.textColor = .black
                
                
            }
            
            
            
            if networkEditText.text != "" {
                
                setNameView.isHidden = false
                setNameLbl.isHidden = false
                setNameLbl.text = "Name :" + " " + networkEditText.text!
                nameHeight.constant = 35
                nameView.backgroundColor = .black
                nameLbl.textColor = .white
                typeTextTop.constant = 50
                networkShowHeight.constant = 90
                
                if professionTextField.text != "" {
                    if BatchTextField.text == ""  {
                        professionTop.constant = -35
                        
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 140
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        
                        
                    }else{
                        professionTop.constant = 0
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        typeTextTop.constant = 120
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        networkShowHeight.constant = 150
                    }
                    
                    
                    if companyTextField.text != "" {
                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                    }else{
                        //                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        //                        typeTextTop.constant = 140
                        //                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                    
                    
                }else if companyTextField.text != "" {
                    if professionTextField.text == "" &&   BatchTextField.text == "" {
                        companyTop.constant = -80
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 140
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                        
                    }else if BatchTextField.text != ""{
                        companyTop.constant = -35
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                    
                }
            }
            else {
                if BatchTextField.text == ""  {
                    
                    if professionTextField.text != "" {
                        
                        professionTop.constant = -35
                        
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 140
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                    if companyTextField.text != "" {
                        
                        
                        
                        
                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                    }else{
                        //                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        //                        typeTextTop.constant = 140
                        //                        networkShowHeight.constant = 170
                        //
                        
                    }
                    
                    }else{
                        setProfeesionView.isHidden = true
                        setProfessionLbl.isHidden = true
                        professionHeight.constant = 0
                        
                        
                        
                        if companyTextField.text != "" {
                            
                            
                            
                            
                            companyTop.constant = -95
                            
                            setCompanyNameView.isHidden = false
                            setCompanyNameLbl.isHidden = false
                            companyHeight.constant = 35
                            
                            typeTextTop.constant = 50
                            networkShowHeight.constant = 80
                            
                            
                            setCompanyNameLbl.text = "Company : " + companyTextField.text!

                            
                            
                            
                            
                        }else{
                            //                        companyTop.constant = 5
                            
                            setCompanyNameView.isHidden = true
                            setCompanyNameLbl.isHidden = true
                            companyHeight.constant = 0
                            //
                            //                        typeTextTop.constant = 140
                            //                        networkShowHeight.constant = 170
                            //
                            
                        }
                    }
                    
                    
                }else if companyTextField.text != "" {
                    if professionTextField.text == "" &&   BatchTextField.text == "" {
                        companyTop.constant = -80
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 140
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                        
                    }else if BatchTextField.text != ""{
                        companyTop.constant = -35
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        //
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                    
                    
                }
                
             
                
                //
            }
            //
            searchType = "Batch"
            
        }
        
    }
    
    
    @IBAction func companyClick() {
        //
        textTypeView.isHidden = false
        
        
        networkEditText.isHidden = true
        companyTextField.text = ""
        companyTextField.keyboardType = .alphabet
        BatchTextField.isHidden = true
        
        companyTextField.isHidden = false
        companyTextField.placeholder = "Search Your Company"
        professionTextField.isHidden = true
        
        
        if companyNAmeView.backgroundColor ==  .black {
            companyNAmeView.backgroundColor = .white
            companyNameLbl.textColor = .black
            cNameText = ""
            setCompanyNameView.isHidden = true
        }else{
            companyNAmeView.backgroundColor = .black
            companyNameLbl.textColor = .white
            cNameText = companyTextField.text!
            clickType = 4
            
            
            if networkEditText.text == "" {
                nameView.backgroundColor = .white
                nameLbl.textColor = .black
            }
            
            if professionTextField.text == "" {
                designationView.backgroundColor = .white
                professionLbl.textColor = .black
            }
            
            if BatchTextField.text == "" {
                batchView.backgroundColor = .white
                passedYrLbl.textColor = .black
                
            }
            
            
            
            
            
            
            
            if networkEditText.text != "" {
                
                setNameView.isHidden = false
                setNameLbl.isHidden = false
                setNameLbl.text = "Name :" + " " + networkEditText.text!
                nameHeight.constant = 35
                nameView.backgroundColor = .black
                nameLbl.textColor = .white
                typeTextTop.constant = 50
                networkShowHeight.constant = 90
                
                if BatchTextField.text != "" {
                    //                    if networkEditText.text == ""  {
                    batchTop.constant = 5
                    
                    setBatchView.isHidden = false
                    setBatchLbl.isHidden = false
                    batchHeight.constant = 35
                    
                    typeTextTop.constant = 90
                    networkShowHeight.constant = 110
                    batchView.backgroundColor = .black
                    passedYrLbl.textColor = .white
                    
                    
                    
                    
                    setBatchLbl.text = "Batch :"  + BatchTextField.text!
//                }
                        
                    
                    
                    if professionTextField.text != "" {
                        professionTop.constant = 5

                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 130
                        networkShowHeight.constant = 160

                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        
                        
                        
                        
                    }else{
                        //                        companyTop.constant = 5
                        
                        setProfeesionView.isHidden = true
                        setProfessionLbl.isHidden = true
                        professionHeight.constant = 0
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 120

                        //
                        //                        typeTextTop.constant = 140
                        //                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                        

                    
                }else if professionTextField.text != "" {
                    if networkEditText.text == "" &&   BatchTextField.text == "" {
                        professionTop.constant = -80
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 140
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        
                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        
                        
                        
                  
                        
                    }else if networkEditText.text != ""{
                        professionTop.constant = -35
                        
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        //
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        typeTextTop.constant = 100
                        networkShowHeight.constant = 120
                        
                        
                        if BatchTextField.text != ""{
                            professionTop.constant = 5
                            
                            setProfeesionView.isHidden = false
                            setProfessionLbl.isHidden = false
                            professionHeight.constant = 35
                            //
                            
                            setProfessionLbl.text = "Profession : " + professionTextField.text!

                            designationView.backgroundColor = .black
                            professionLbl.textColor = .white
                            typeTextTop.constant = 140
                            networkShowHeight.constant = 170
                            //
                            
                            //
                            
                            
                        }
                        
                        
                    }
                    
                }
            }else{
                if BatchTextField.text != "" {
                batchTop.constant = 5
                
                setBatchView.isHidden = false
                setBatchLbl.isHidden = false
                batchHeight.constant = 35
                
                typeTextTop.constant = 90
                networkShowHeight.constant = 110
                
                    batchView.backgroundColor = .black
                    passedYrLbl.textColor = .white
                    
                    
                    
                    
                    setBatchLbl.text = "Batch :"  + BatchTextField.text!
//                }
                    
                
                
                if professionTextField.text != "" {
                    professionTop.constant = 5

                    setProfeesionView.isHidden = false
                    setProfessionLbl.isHidden = false
                    professionHeight.constant = 35
                    
                    typeTextTop.constant = 130
                    networkShowHeight.constant = 160

                    
                    setProfessionLbl.text = "Profession : " + professionTextField.text!

                    designationView.backgroundColor = .black
                    professionLbl.textColor = .white
                    
                    
                    
                }else{
                    //                        companyTop.constant = 5
                    
                    setProfeesionView.isHidden = true
                    setProfessionLbl.isHidden = true
                    professionHeight.constant = 0
                    typeTextTop.constant = 95
                    networkShowHeight.constant = 120

                    //
                    //                        typeTextTop.constant = 140
                    //                        networkShowHeight.constant = 170
                    //
                    
                    
                }
                    
//
//
                
            }else if professionTextField.text != "" {
                if networkEditText.text == "" &&   BatchTextField.text == "" {
                    professionTop.constant = -80
                    setProfeesionView.isHidden = false
                    setProfessionLbl.isHidden = false
                    professionHeight.constant = 35
                    
                    typeTextTop.constant = 95
                    networkShowHeight.constant = 140
                    
                    setProfessionLbl.text = "Profession : " + professionTextField.text!

                    
                    designationView.backgroundColor = .black
                    professionLbl.textColor = .white
                    
                    
                    
              
                    
                }else if networkEditText.text != ""{
                    professionTop.constant = -35
                    
                    setProfeesionView.isHidden = false
                    setProfessionLbl.isHidden = false
                    professionHeight.constant = 35
                    //
                    
                    setProfessionLbl.text = "Profession : " + professionTextField.text!

                    designationView.backgroundColor = .black
                    professionLbl.textColor = .white
                    typeTextTop.constant = 100
                    networkShowHeight.constant = 120
                    
                    
                    if BatchTextField.text != ""{
                        professionTop.constant = 5
                        
                        setProfeesionView.isHidden = false
                        setProfessionLbl.isHidden = false
                        professionHeight.constant = 35
                        //
                        
                        setProfessionLbl.text = "Profession : " + professionTextField.text!

                        designationView.backgroundColor = .black
                        professionLbl.textColor = .white
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        //
                        
                        //
                        
                        
                    }
                    
                    
                }
                
            }
        }
        
            
            
            
            
            
            
            
            
    
//
        }
        
        
        searchType = "Batch"
        //
        
    }
    
    @IBAction func professionClick() {
        
        textTypeView.isHidden = false
        
        
       
        
        
        networkEditText.isHidden = true
        companyTextField.isHidden = true
        BatchTextField.isHidden = true
        
        professionTextField.text = ""
        professionTextField.keyboardType = .alphabet
        professionTextField.placeholder = "Search Your Profession"
        
        professionTextField.isHidden = false
        
//        
//        
//        if setNameLbl.text != ""  {
//            setNameView.isHidden = false
//            setNameLbl.isHidden = false
//            nameHeight.constant = 35
//        }else {
//            setNameView.isHidden = true
//            setNameLbl.isHidden = true
//            nameHeight.constant = 0
//        }
//        
//        
//        
        
        
       
        if designationView.backgroundColor ==  .black {
            setProfeesionView.isHidden = true
            designationView.backgroundColor = .white
            professionLbl.textColor = .black
            professionText = ""
        }else{
            
            designationView.backgroundColor = .black
            professionLbl.textColor = .white
            
            clickType = 3
            setProfessionLbl.text = "Profession Name :" + " " + professionTextField.text!
            professionText = professionTextField.text!
            
            designationView.backgroundColor = .black
            professionLbl.textColor = .white
            
          
           
           
            
            
            if networkEditText.text == "" {
                nameView.backgroundColor = .white
                nameLbl.textColor = .black
                
            }
            
            if companyTextField.text == "" {
                companyNAmeView.backgroundColor = .white
                companyNameLbl.textColor = .black
            }
            
            if BatchTextField.text == "" {
                batchView.backgroundColor = .white
                passedYrLbl.textColor = .black
                
            }
            
            
            
            
            
            
            if networkEditText.text != "" {
                
                setNameView.isHidden = false
                setNameLbl.isHidden = false
                setNameLbl.text = "Name :" + " " + networkEditText.text!
                nameHeight.constant = 35
                typeTextTop.constant = 50
                nameView.backgroundColor = .black
                nameLbl.textColor = .white
                networkShowHeight.constant = 90
                
                if BatchTextField.text != "" {
                    //                    if networkEditText.text == ""  {
                    batchTop.constant = 5
                    
                    setBatchView.isHidden = false
                    setBatchLbl.isHidden = false
                    batchHeight.constant = 35
                    batchView.backgroundColor = .black
                    passedYrLbl.textColor = .white
                    
                    
                    
                    
                    
//
                    setBatchLbl.text = "Batch :"  + BatchTextField.text!
//                }
                        
                    
                    
                    if companyTextField.text != "" {
                        companyTop.constant = 5

                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        companyNAmeView.backgroundColor = .black
                        companyNameLbl.textColor = .white
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                    }else{
                        //                        companyTop.constant = 5
                        
                        setCompanyNameView.isHidden = true
                        setCompanyNameLbl.isHidden = true
                        companyHeight.constant = 0
                        typeTextTop.constant = 90
                                          networkShowHeight.constant = 110
                                          
                        //
                        //                        typeTextTop.constant = 140
                        //                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                        
//
//
                    
                }else if companyTextField.text != "" {
                    if networkEditText.text == "" &&   BatchTextField.text == "" {
                        companyTop.constant = -80
                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        
                        typeTextTop.constant = 95
                        networkShowHeight.constant = 140
                        companyNAmeView.backgroundColor = .black
                        companyNameLbl.textColor = .white
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!

                        
                        
                        
                        
                        
                    }else if networkEditText.text != ""{
                        companyTop.constant = -75

                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        //
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!
                        companyNAmeView.backgroundColor = .black
                        companyNameLbl.textColor = .white
                        typeTextTop.constant = 110
                        networkShowHeight.constant = 130
                        //
                        
                        
                        
                        
                        
                        if BatchTextField.text != "" {
                            companyTop.constant = 5

                            setCompanyNameView.isHidden = false
                            setCompanyNameLbl.isHidden = false
                            companyHeight.constant = 35
                            //
                            
                            setCompanyNameLbl.text = "Company : " + companyTextField.text!
                            companyNAmeView.backgroundColor = .black
                            companyNameLbl.textColor = .white
                            typeTextTop.constant = 140
                            networkShowHeight.constant = 170
                            //
                            
                            
                        }
                        
                    }
                    
                    
                }
            }else{
                //                    if networkEditText.text == ""  {
                if BatchTextField.text != "" {
                batchTop.constant = -25
                
                setBatchView.isHidden = false
                setBatchLbl.isHidden = false
                batchHeight.constant = 35
                
                typeTextTop.constant = 60
                networkShowHeight.constant = 90
                    batchView.backgroundColor = .black
                    passedYrLbl.textColor = .white
                    
                    
                    
                    
                
                    setBatchLbl.text = "Batch :"  + BatchTextField.text!
//                }
                    
                
                
                if companyTextField.text != "" {
                    companyTop.constant = 10

                    setCompanyNameView.isHidden = false
                    setCompanyNameLbl.isHidden = false
                    companyHeight.constant = 35
                    
                    typeTextTop.constant = 130
                    networkShowHeight.constant = 150
                    setCompanyNameLbl.text = "Company : " + companyTextField.text!

                    companyNAmeView.backgroundColor = .black
                    companyNameLbl.textColor = .white
                    
                    
                    
                }else{
                    //                        companyTop.constant = 5
                    
                    setCompanyNameView.isHidden = true
                    setCompanyNameLbl.isHidden = true
                    companyHeight.constant = 0
                    //
                    //                        typeTextTop.constant = 140
                    //                        networkShowHeight.constant = 170
                    //
                    
                    
                }
                    
//
                
            }else if companyTextField.text != "" {
                if networkEditText.text == "" &&   BatchTextField.text == "" {
                    companyTop.constant = -120
                    setCompanyNameView.isHidden = false
                    setCompanyNameLbl.isHidden = false
                    companyHeight.constant = 35
                    
                    typeTextTop.constant = 70
                    networkShowHeight.constant = 90
                    
                    setCompanyNameLbl.text = "Company : " + companyTextField.text!
                    companyNAmeView.backgroundColor = .black
                    companyNameLbl.textColor = .white
                    
                    
                    
                    
                    
                }else if networkEditText.text != ""{
                    companyTop.constant = -75

                    setCompanyNameView.isHidden = false
                    setCompanyNameLbl.isHidden = false
                    companyHeight.constant = 35
                    //
                    
                    setCompanyNameLbl.text = "Company : " + companyTextField.text!

                    companyNAmeView.backgroundColor = .black
                    companyNameLbl.textColor = .white
                    typeTextTop.constant = 110
                    networkShowHeight.constant = 130
                    //
                    
                    
                    
                    
                    
                    if BatchTextField.text != "" {
                        companyTop.constant = 5

                        setCompanyNameView.isHidden = false
                        setCompanyNameLbl.isHidden = false
                        companyHeight.constant = 35
                        //
                        
                        setCompanyNameLbl.text = "Company : " + companyTextField.text!
                        companyNAmeView.backgroundColor = .black
                        companyNameLbl.textColor = .white
                        typeTextTop.constant = 140
                        networkShowHeight.constant = 170
                        //
                        
                        
                    }
                    
                }
                
                
            }
        }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
   
        }
        
        //        setProfeesionView.isHidden = false
        searchType = "Designation"
        
        
    }
    
    
    
    
    
    
    @IBAction func createRequestAid() {
        menuType = "ASSIST"
        
        let storyboard = UIStoryboard(name: "RequestAssistStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! RequestAssistViewController
        present(viewController, animated: true)
    }
    
    @IBAction func clickRequest(ges : HomeRequestGesture) {
        print("clickRequest")
        
        
        clickAssistRequestType = "Request"
        yourReqLbl.textColor = .black
        yourRequestView.backgroundColor = .white
        cvBottom.isHidden = true
        noRecordView.isHidden = false
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = false
        getAssistAllList()
        
        
        reqLbl.textColor = .white
        //        tv.dataSource = self
        //        tv.delegate = self
        requestView.backgroundColor = .black
        requestAidView.isHidden = false
        requestAidViewHeight.constant = 50
    }
    
    
    @IBAction func clickYourRequest( ges: HomeRequestGesture) {
        print("clickYourRequest")
        reqLbl.textColor = .black
        requestView.backgroundColor = .white
        
        clickAssistRequestType = "Your Request"
        yourReqLbl.textColor = .white
        yourRequestView.backgroundColor = .black
        
        //        tv.dataSource = self
        //        tv.delegate = self
        
        cvBottom.isHidden = true
        noRecordView.isHidden = false
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = false
        requestAidView.isHidden = false
        requestAidViewHeight.constant = 50
        getAssistList()
        
    }
    
    @IBAction  func getAssistList () {
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        assistInfoIdforRefer = 0
        ClickViewName = "ASSIST"
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetAssistRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let assist_response : GetAssistListResponse = Mapper<GetAssistListResponse>().map(JSONString: res)!
            
            if assist_response.status == true {
                
                getData = assist_response.data
                
                print("helooooooooo")
                
                //                tv.isHidden = false
                
                //             /*   tv.da*/taSource = self
                //                tv.delegate = self
                
                cvBottom.isHidden = false
                noRecordView.isHidden = true
                alumniPinkGifView.isHidden = true
                gifImage.isHidden = true
                cvBottom.dataSource = self
                cvBottom.delegate = self
                cvBottom.reloadData()
                
                
                //                tv.reloadData()
                //
                
            }else{
                
                //                tv.isHidden = true
                
                //                self.gifImage.image = UIImage.gif(name: "no_data_found")
                //                cordLbl.text = assist_response.message
                
                
                cvBottom.isHidden = false
                
                
                
                if getOffset == 0 {
                    
                    
                    
                    assistInfoIdforRefer = 1
                    
                    
                    
                    
                    
                    var info = assist_response.info
                    
                    //
                    
                    
                    
                    infoRefrenceArray = info!.components(separatedBy: "~~~")
                    
                    
                    
                    
                    
                    print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                    
                    
                    
                    cvBottom.dataSource = self
                    
                    cvBottom.delegate = self
                    
                    
                    
                    cvBottom.reloadData()
                    
                    
                    
                }
                
                //
                
            }
            
            
        }
    }
    
    
    @IBAction func pickInstitute() {
        
        print("pickInstitute",instituteId)
        institute.removeAll()
        
        //
        AlumniGalleryData.forEach { (instName) in
            institute.append(instName.institute_name)
            galleryInstIDArr.append(instName.institute_id)
        }
        
        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            galleryLbl.text = item
            galleryInstID = galleryInstIDArr[index]
            instituteId = galleryInstID
            print("instituteId",instituteId)
            
            getInstituteGalleryList()
        }
        
        drop_down.dataSource = institute
        drop_down.anchorView = gallerview
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()
        
    }
    
    
    @IBAction  func getAssistAllList () {
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        assistInfoIdforRefer = 0
        gifImage.isHidden = true
        cvBottom.isHidden = true
        
        ClickViewName = "ASSIST"
        
        print("paclickAssistRequestTyperam",clickAssistRequestType)
        
        //        if  clickAssistRequestType == "Request" {
        //            cvBottom.isHidden = true
        //            getAssistAllList()
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetAssistRequestAll.call_request(param: param,token: token){ [self]
            (res) in
            //            if res?.statusCode == 401 {
            //
            //
            //            }
            
            let assist_response : GetAssistListResponse = Mapper<GetAssistListResponse>().map(JSONString: res)!
            
            if assist_response.status == true {
                
                getData = assist_response.data
                
                //                tv.isHidden = false
                //
                //                tv.dataSource = self
                //                tv.delegate = self
                
                cvBottom.isHidden = false
                noRecordView.isHidden = true
                alumniPinkGifView.isHidden = true
                gifImage.isHidden = true
                
                cvBottom.dataSource = self
                cvBottom.delegate = self
                cvBottom.reloadData()
                
                //                tv.reloadData()
                //
                
            }else{
                
                //                tv.isHidden = true
                
                cvBottom.isHidden = false
                
                
                
                if getOffset == 0 {
                    
                    
                    
                    assistInfoIdforRefer = 1
                    
                    
                    
                    
                    
                    var info = assist_response.info
                    
                    //
                    
                    
                    
                    infoRefrenceArray = info!.components(separatedBy: "~~~")
                    
                    
                    
                    
                    
                    print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                    
                    
                    
                    cvBottom.dataSource = self
                    
                    cvBottom.delegate = self
                    
                    
                    
                    cvBottom.reloadData()
                    
                    
                    
                }
                
            }
        }
        //        }else{
        //            cvBottom.isHidden = true
        //
        //            getAssistList ()
        //
        //
        //
        //
        //
        //
        //        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //        sucessImageView.image = UIImage(named: "sendRocket")
        
        
        print("printssssssssssss",textField.text)
        
        //            if textField.text == "" {
        //
        //                searchCloseView.isHidden = true
        //                SearchCloseWith.constant = 0
        //                searchBarWidth.constant = 340
        //            }else{
        //
        //                searchCloseView.isHidden = false
        //                SearchCloseWith.constant = 25
        //                searchBarWidth.constant = 300
        //
        //            }
    }
    
    
    
    //
    
    //
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        
        if textField == networkEditText{
            
            
//             setNameLbl.text = textField.text
           
        } else if textField == BatchTextField{
            print("setNameLbl1111",setNameLbl.text)
//
                                print("networkEditText",textField.text)
//
            print("BatchTextField",textField.text)
        }else if textField == professionTextField{
            
//
            
            print("professionTextField",textField.text)
        } else if textField == companyTextField{
//
            
            print("companyTextField",textField.text)
        }

    }
    
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        
        
        print("textFieldtextFieldtextField",textField.text)
        //            searchCloseView.isHidden = false
        //            searchBarWidth.constant = 300
        //            SearchCloseWith.constant = 25
        //        sucessImageView.image = UIImage(named: "sendRocket")
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        self.view.endEditing(true)
        
        
        return false
        
        
    }
    
    
    @IBAction func deviceToken() {
        
        
        let deviceTokenModal = DeviceTokenModal()
        deviceTokenModal.device_type = "Iphone"
        deviceTokenModal.device_token = getDeviceID
        
        
        var  deviceTokenModalStr = deviceTokenModal.toJSONString()
        print("deviceTokenModal",deviceTokenModal.toJSON())
        DeviceTokenRequest.call_request(param: deviceTokenModalStr!, token: token!) {
            
            [self] (res) in
            
            let deviceRes : DeviceTokenResponse = Mapper<DeviceTokenResponse>().map(JSONString: res)!
            
            
            if deviceRes.status == true {
                
                
            }else{
                let alert = UIAlertController(title: "Alert", message: deviceRes.message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func addVc() {
        print("addVcaddVc",menuType)
        if  ClickViewName == "EVENTS" {
            menuType = "EVENTS"
            
            //
            //            let storyboard = UIStoryboard(name: "PersonalDetailStoryboard", bundle: nil)
            //                       let viewController = storyboard.instantiateInitialViewController() as! PersonalDetailViewController
            //                       self.present(viewController, animated: true)
            let storyboard = UIStoryboard(name: "EventsWishesAppearedStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! EventsWishesAppearedViewController
            self.present(viewController, animated: true)
            
        }else   if  ClickViewName == "FUND RAISING" {
            menuType = "FUND RAISING"
            let storyboard = UIStoryboard(name: "CreateContributeStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! CreateContributeViewController
            viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.present(viewController, animated: true)
            
        }else   if  ClickViewName == "GALLERY" {
            
            menuType = "INSTITUTE GALLERY"
            let storyboard = UIStoryboard(name: "SchoolSideSchoolGalleryStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolGalleryViewController
            self.present(viewController, animated: true)
        }
        
        //        else if  ClickViewName == "ASSIST" {
        //
        //
        //            menuType = "ASSIST"
        //
        //            let storyboard = UIStoryboard(name: "RequestAssistStoryboard", bundle: nil)
        //            let viewController = storyboard.instantiateInitialViewController() as! RequestAssistViewController
        //            present(viewController, animated: true)
        //        }
    }
    
    
    
    @IBAction func shareLink() {
        if let urlStr = NSURL(string: "https://apps.apple.com/us/app/idxxxxxxxx?ls=1&mt=8") {
            let objectsToShare = [urlStr]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                if let popup = activityVC.popoverPresentationController {
                    popup.sourceView = self.view
                    popup.sourceRect = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4, width: 0, height: 0)
                }
            }
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func CreateGallery() {
        
        menuType = "GALLERY"
        let storyboard = UIStoryboard(name: "SchoolSideSchoolGalleryStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! SchoolSideSchoolGalleryViewController
        self.present(viewController, animated: true)
        
        //            }
    }
    
    @IBAction func createEvent() {
        menuType = "EVENTS"
        let storyboard = UIStoryboard(name: "EventsWishesAppearedStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! EventsWishesAppearedViewController
        self.present(viewController, animated: true)
        
    }
    
    
    @IBAction func createContribute() {
        menuType = "FUND RAISING"
        let storyboard = UIStoryboard(name: "CreateContributeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! CreateContributeViewController
        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(viewController, animated: true)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("HomePageSCREEN45678")
        
        if memberType == 1 || memberType == 2 {
            if collectionView == cv{
                
                return icon.count
                
                
            }
            else{
                print("numberOfItemsInSectionmemberType",memberType)
                if ClickViewName == "EVENTS"{
                    
                    print("getInstituteData",getInstituteData.count)
                    //                        if getOffset == 0{
                    //
                    
                    //                    if getOffset == 0{
                    if  eventInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        return getInstituteData.count
                        //                        }
                        //                        else{
                        //
                        //                            return  getInstituteAfterOffset.count
                        //
                    }
                    
                } else if ClickViewName == "ALUMNI DIRECTORY"{
                    
                    if getOffset == 0{
                        
                        if  networkInfoIdforRefer == 1{
                            
                            
                            print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                            
                            return infoRefrenceArray.count
                        }else{
                            
                            return getNetWorkInstituteData.count
                        }
                        
                        
                    }
                    else{
                        
                        return getNetWorkInstituteData2.count
                    }
                    
                    
                } else if ClickViewName == "CHATS"{
                    
                    
                    
                    
                    return 1
                    
                    
                } else if ClickViewName == "FUND RAISING"{
                    //                    if getOffset == 0{
                    if  contributeInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        
                        return  contributeData.count
                    }
                }else {
                    //
                    
                    print("HomePageSCREENGalarry45678")
                    
                    //
                    //                    if getOffset == 0{
                    if  galleryInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        return  instGalleryData.count
                        
                        
                    }
                    
                    
                    
                    
                }
            }
        }else{
            if collectionView == cv{
                
                return iconAlumni.count
                //            }
                
            }else {
                
                if ClickViewName == "EVENTS"{
                    
                    //                    if getOffset == 0{
                    if  eventInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        print("passGetAlumniData122",passGetAlumniData.count)
                        return  passGetAlumniData.count
                        
                    }
                    
                } else if ClickViewName == "ALUMNI NETWORK"{
                    if getOffset == 0{
                        if  networkInfoIdforRefer == 1{
                                 print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                            return infoRefrenceArray.count
                        }else{
                            return getNetWorkAlumniData.count
                        }
                    }
                    else{
                        
                        return getNetWorkAlumniData2.count
                    }
                    
                    
                    
                    
                }  else if ClickViewName == "CHATS"{
                    
                    
                    
                    return 1
                    
                    //                }
                    
                }else if ClickViewName == "CONTRIBUTE"{
                    
                    //                    if getOffset == 0{
                    if  contributeInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        return  contributeAlumniData.count
                        //
                        
                    }
                }else if ClickViewName == "GALLERY"{
                    
                    //                    if getOffset == 0{
                    if  galleryInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        return  instGalleryData.count
                        //
                    }
                    
                }else if ClickViewName == "ASSIST"{
                    //
                    
                    
                    
                    print("cellGetAssistData",getData.count)
                    //                    if getOffset == 0{
                    if  assistInfoIdforRefer == 1{
                             print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                        return infoRefrenceArray.count
                        //                        }
                    }else{
                        return getData.count
                        //
                    }
                    
                }
                
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if memberType == 1 || memberType == 2 {
            if collectionView == cv{
                
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvRowIdentifier, for: indexPath) as! HomePageCollectionViewCell
                
                let icon_item : IconItem = icon[indexPath.item]
                
                cell.titleLbl.text = icon_item.text
                
                if icon_item.selected{
                    
                    print("icon_item.tex123456ut",icon_item.text)
                    
                    cell.titleView.backgroundColor = .black
                    cell.titleLbl.textColor = .white
                }else{
                    cell.titleView.backgroundColor = .white
                    cell.titleLbl.textColor = .black
                }
                
                
                print("icon_item.text",icon_item.text)
                
                
                
                return cell
            }
            
            
            else{
                
                if ClickViewName == "EVENTS"{
                    if  eventInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            
                            print("getInstituteImg",getInstitute)
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventRowIdentifier, for: indexPath) as! EventListShowingCollectionViewCell
                        cvTop.constant = 0
                        addView.isHidden = false
                        addViewHeight.constant = 50
                        addView.isHidden = false
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .horizontal
                        }
                        
                        //
                        //
                        
                        
                        //                    if memberType == 1 || memberType == 2 {
                        let instEventList : GetInstituteEventDetailData = getInstituteData[indexPath.row]
                        
                        print("NameinstEventListinstEventList",instEventList.name)
                        
                        cell.passGetInstituteData = getInstituteData
                        cell.namePassStr = instEventList.name
                        cell.titlePassStr = instEventList.title
                        cell.fromPassStr = instEventList.fromTime
                        
                        cell.toPassStr = instEventList.toTime
                        
                        cell.venuePassStr = instEventList.venue
                        cell.descPassStr = instEventList.description
                        cell.getMediaInstitute = instEventList.media
                        cell.main_vc = self
                        
                        
                        cell.passType = instEventList.type
                        cell.passProfile = instEventList.profile
                        cell.passUserId = instEventList.user_id
                        cell.passUserName = instEventList.user_name
                        
                        cell.passheading = instEventList.name
                        cell.passEventId = instEventList.id
                        cell.passInstId = instEventList.id
                        cell.getMediaInstitute = instEventList.media
                        
                        
                        //                    }
                        
                        //                    cell.passGetInstituteData = getInstituteData
                        
                        cell.main_vc = self
                        let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                        addGes.addTitleName = "EVENTS"
                        menuType = "EVENTS"
                        addView.addGestureRecognizer(addGes)
                        
                        //                    if getInstituteData.count < 1 {
                        //                        cell.eventListSwipeGif.image = UIImage.gif(name: "Hand Cursor Swipe Right")
                        
                        
                        var lastCountGet = getInstituteData.count
                        
                        print("lastCountGet",lastCountGet)
                        cell.eventListSwipeGif.isHidden = true
                        print("GifgetInstituteData",getInstituteData.count)
                        //                    if lastCountGet == getInstituteData.count {
                        //                        cell.eventListSwipeGif.isHidden = true
                        //                        cell.eventListSwipeGif.isHidden = false
                        //                        cell.eventListRightSwipe.image = UIImage.gif(name: "Hand Cursor Swipe Left")
                        //
                        //                    }
                        //                    }
                        return cell
                    }
                }else if ClickViewName == "ALUMNI DIRECTORY"{
                    if  networkInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: networkRowIdentifier, for: indexPath) as! NetworkRevisedCollectionViewCell
                        
                        cvTop.constant = 0
                        //                    if memberType == 1 || memberType == 2 {
                        
                        
                        addViewHeight.constant = 0
                        addView.isHidden = true
                        
                        let filterGes = UITapGestureRecognizer(target: self, action: #selector(filterVc))
                        networkSortView.addGestureRecognizer(filterGes)
                        
                        
                        
                        let getInstitute : NetworkInstituteData = getNetWorkInstituteData [indexPath.row]
                        cell.nameLbl.text = getInstitute.name
                        cell.designationLbl.text = getInstitute.designation
                        cell.batchLbl.text = getInstitute.batch
                        cell.instituteNameLbl.text = getInstitute.instituteName
                        cell.profileImg.sd_setImage(with: URL(string:  getInstitute.profilePicture!), placeholderImage: UIImage(named: "Avatar"))
                        //            cell.profileImg.applyRoundedCorners(cornerRadii: CGSize(width: 20, height: 20))
                        
                        
                        let rectShape = CAShapeLayer()
                        rectShape.bounds = cell.profileImg.frame
                        rectShape.position = cell.profileImg.center
                        rectShape.path = UIBezierPath(roundedRect: cell.profileImg.bounds, byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: 15, height: 25)).cgPath
                        
                        cell.profileImg.layer.backgroundColor = UIColor.green.cgColor
                        //Here I'm masking the textView's layer with rectShape layer
                        cell.profileImg.layer.mask = rectShape
                        
                        
                        print("imageIntract2222",cell.profileImg.isUserInteractionEnabled)
                        
                        let imagClick = ProfileImageVc(target: self, action:#selector(ProfileIamgeVc))
                        imagClick.ImageUrl = getInstitute.profilePicture
                        imagClick.TitleLbl = getInstitute.name
                        cell.profileImg.addGestureRecognizer(imagClick)
                        
                        
                        
                        let chatGes  = HomeRequestGesture(target: self, action: #selector(chatVc))
                        //                    chatGes.userName = getAlumni.name
                        //                    chatGes.user_id = getAlumni.id
                        //                    chatGes.selectedUserId = getAlumni.id
                        //                    print("getAlumni.id.id",getAlumni.id)
                        //                    chatGes.designationStr = getAlumni.designation
                        //
                        //                    chatGes.userImg = getAlumni.profilePicture
                        cell.ntworkFullView.addGestureRecognizer(chatGes)
                        //                    }else{
                        //
                        //                        let getAlumni : NetworkAlumniData = getNetWorkAlumniData [indexPath.row]
                        //                        cell.nameLbl.text = getAlumni.name
                        //                        cell.designationLbl.text = getAlumni.designation
                        //                        cell.batchLbl.text = getAlumni.batch
                        //                        cell.profileImg.sd_setImage(with: URL(string:  getAlumni.profilePicture!), placeholderImage: UIImage(named: "Avatar"))
                        //            //            cell.profileImg.applyRoundedCorners(cornerRadii: CGSize(width: 20, height: 20))
                        //
                        //
                        //
                        //
                        //                        let rectShape = CAShapeLayer()
                        //                        rectShape.bounds = cell.profileImg.frame
                        //                        rectShape.position = cell.profileImg.center
                        //                        rectShape.path = UIBezierPath(roundedRect: cell.profileImg.bounds, byRoundingCorners: [.bottomLeft  , .topLeft], cornerRadii: CGSize(width: 15, height: 25)).cgPath
                        //
                        //                        cell.profileImg.layer.backgroundColor = UIColor.green.cgColor
                        //                        //Here I'm masking the textView's layer with rectShape layer
                        //                        cell.profileImg.layer.mask = rectShape
                        //
                        //                        print("imageIntract",cell.profileImg.isUserInteractionEnabled)
                        //
                        //                        let imagClick = ProfileImageVc(target: self, action:#selector(ProfileIamgeVc))
                        //                                    imagClick.ImageUrl = getAlumni.profilePicture
                        //                                    imagClick.TitleLbl = getAlumni.name
                        //                                    cell.profileImg.addGestureRecognizer(imagClick)
                        //                    }
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .vertical
                            
                        }
                        
                        
                        
                        return cell
                        
                    }
                }else if ClickViewName == "CHATS"{
                    
                    
                    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                        layout.scrollDirection = .horizontal
                    }
                    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: chatRowIdentifier, for: indexPath) as! HomePageChatCollectionViewCell
                    cvTop.constant = 0
                    addView.isHidden = true
                    
                    addViewHeight.constant = 0
                    addView.isHidden = true
                    cvBottom.isHidden = true
                    //                    cell.main = self
                    //
                    //                    cell.getInstituteData = getNetWorkInstituteData
                    
                    
                    
                    return cell
                    
                }else if ClickViewName == "FUND RAISING"{
                    if  contributeInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            print("FunRaisinggetInstituteImg",getInstitute)

                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contributeRowIdentifier, for: indexPath) as! GetContributeListCollectionViewCell
                        cvTop.constant = 0
                        addViewHeight.constant = 50
                        addView.isHidden = false
                        addView.isHidden = false
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .horizontal
                        }
                        
                        //                    cell.mainVc = self
                        
                        //                    cell.contributeData = contributeData
                        
                        
                        print("contributeDatacontributeDatas",contributeData)
                        let contribute : GetInstituteContributeResponseData = contributeData[indexPath.item]
                        cell.descLbl.text = contribute.description
                        cell.titleLbl.text = contribute.title
                        cell.activeFromLbl.text =  "Active From :" + contribute.activeFrom
                        cell.activeToLbl.text =  "Active To :" + contribute.activeTo
                        cell.bulletPoints = contribute.bulletPoints
                        print("contribute.bulletPoints",contribute.bulletPoints)
                        
                        
                        
                        if contribute.bulletPoints.count < 0 {
                            cell.tvHeight.constant = 0
                            cell.tv.isHidden = true
                            cell.contributeImgTvHeight.constant = 250
                        }else{
                            cell.tvHeight.constant = 80
                            cell.contributeImgTvHeight.constant = 300
                            
                            cell.tv.isHidden = false
                            
                        }
                        
                        
                        if contribute.isAmount == true {
                            cell.moreDetailView.isHidden = false
                        }else{
                            cell.moreDetailView.isHidden = true
                        }
                        
                        
                        //
                        
                        let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                        addGes.addTitleName = "FUND RAISING"
                        menuType = "FUND RAISING"
                        addView.addGestureRecognizer(addGes)
                        cell.alumniInstNameLbl.isHidden = true
                        
                        if contribute.isAmount == true {
                            
                            cell.moreDetailView.isHidden = false
                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                            moreDetails.fundNeeded = contribute.noRequired
                            moreDetails.fundReceived = contribute.noReceived
                            moreDetails.noPending = contribute.noPending
                            moreDetails.requestId = contribute.id
                            moreDetails.getTitleLbl = contribute.title
                            moreDetails.getInstituteName = contribute.instituteName
                            //                moreDetails.instId = contribute.instituteId
                            moreDetails.isAmountCheck = "Amount"
                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                            
                        }else{
                            cell.moreDetailView.isHidden = false
                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                            moreDetails.fundNeeded = contribute.noRequired
                            moreDetails.fundReceived = contribute.noReceived
                            moreDetails.noPending = contribute.noPending
                            moreDetails.requestId = contribute.id
                            moreDetails.getTitleLbl = contribute.title
                            moreDetails.getInstituteName = contribute.instituteName
                            //                moreDetails.instId = contribute.instituteId
                            moreDetails.isAmountCheck = "Volunteer"
                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                            
                        }
                        
                        
                        contributeMedia = contribute.reference_media
                        print("contribute.noRequired",contribute.noRequired)
                        print("contribute.noReceived",contribute.noReceived)
                        print("contribute.noPending",contribute.noPending)
                        //        for i in contributeMedia {
                        cell.noMediaImg.isHidden = true
                        
                        cell.noRecordView.isHidden = true
                        alumniPinkGifView.isHidden = true
                        cell.noRexordImg.isHidden = true
                        
                        if contributeMedia.count < 0 {
                            cell.noMediaImg.isHidden = false
                            
                            cell.noRecordView.isHidden = false
                            cell.noRexordImg.isHidden = false
                        }else{
                            cell.noMediaImg.isHidden = true
                            
                            cell.noRecordView.isHidden = true
                            cell.noRexordImg.isHidden = true
                        }
                        
                        print("bulletPoints.noPending",bulletPoints.count)
                        
                        if contribute.reference_media.count  == 0 {
                            cell.noMediaImg.isHidden = false
                            //
                            
                            
                            if let gifURL = Bundle.main.url(forResource: "Money Donation", withExtension: "gif") {
                                do {
                                    // Load the GIF data
                                    let gifData = try Data(contentsOf: gifURL)
                                    
                                    // Create an animated image from the GIF data
                                    let animatedImage = UIImage.gifImageWithData(gifData)
                                    
                                    // Set the animated image to the UIImageView
                                    cell.noMediaImg.image = animatedImage
                                } catch {
                                    print("Error loading GIF: \(error.localizedDescription)")
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            cell.img1.isHidden = true
                            cell.img2.isHidden = true
                            cell.img3.isHidden = true
                            cell.img4.isHidden = true
                            
                        }
                        
                        
                        
                        else{
                            
                            
                            
                            
                            if contribute.reference_media.count == 1 {
                                cell.noMediaImg.isHidden = true
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = true
                                cell.img3.isHidden = true
                                cell.img4.isHidden = true
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.reference_media[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest.contributeMedia = contribute.reference_media
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest)
                                
                                
                                cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                            }
                            else if contribute.reference_media.count == 2 {
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = true
                                cell.img4.isHidden = true
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.reference_media[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.reference_media[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                //
                                
                                
                                
                                //                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                                //                zoomGest.getInstType = 3
                                //                zoomGest.gesRedirctType = "Contribute"
                                //                zoomGest.img =  alumniContributeMedia[0].url
                                //
                                //    //            print("contribute.reference_media",contribute.reference_media.count)
                                //                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                //                zoomGest.contributeTitleLbl = contribute.title
                                //
                                //                cell.view1.addGestureRecognizer(zoomGest)
                                //
                                //                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                                //                zoomGest1.getInstType = 3
                                //                zoomGest1.gesRedirctType = "Contribute"
                                //                zoomGest.img =  alumniContributeMedia[1].url
                                //
                                //    //            print("contribute.reference_media",contribute.reference_media.count)
                                ////                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                                //                zoomGest1.contributeTitleLbl = contribute.title
                                //
                                //                cell.img1View.addGestureRecognizer(zoomGest1)
                                //
                                
                                cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                            else if contribute.reference_media.count == 3 {
                                
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = false
                                cell.img4.isHidden = true
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.reference_media[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.reference_media[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                //
                                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest3.getInstType = 3
                                zoomGest3.gesRedirctType = "Contribute"
                                zoomGest3.img =  contribute.reference_media[2].url
                                
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest3.contributeTitleLbl = contribute.title
                                
                                cell.img3View.addGestureRecognizer(zoomGest3)
                                
                                
                                //                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                                //                zoomGest.getInstType = 3
                                //                zoomGest.gesRedirctType = "Contribute"
                                //                zoomGest.img =  alumniContributeMedia[0].url
                                //
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                //                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                //                zoomGest.contributeTitleLbl = contribute.title
                                //
                                //                cell.view1.addGestureRecognizer(zoomGest)
                                //
                                //                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                                //                zoomGest1.getInstType = 3
                                //                zoomGest1.gesRedirctType = "Contribute"
                                //                zoomGest.img =  alumniContributeMedia[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                //                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                                //                zoomGest1.contributeTitleLbl = contribute.title
                                //
                                //                cell.img1View.addGestureRecognizer(zoomGest1)
                                //
                                //                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
                                //                zoomGest3.getInstType = 3
                                //                zoomGest3.gesRedirctType = "Contribute"
                                //                zoomGest.img =  alumniContributeMedia[2].url
                                //
                                //
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                //                zoomGest3.alumniContributeMedia = contribute.referenceMedia
                                //                zoomGest3.contributeTitleLbl = contribute.title
                                
                                //                cell.img3View.addGestureRecognizer(zoomGest3)
                                cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img3.sd_setImage(with: URL(string:  contribute.reference_media[2].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                            else if contribute.reference_media.count == 4 {
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = false
                                cell.img4.isHidden = false
                                
                                
                                
                                //                }
                                //                else if alumniContributeMedia.count == 2{
                                //
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.reference_media[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.reference_media[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                //
                                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest3.getInstType = 3
                                zoomGest3.gesRedirctType = "Contribute"
                                zoomGest3.img =  contribute.reference_media[2].url
                                
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.contributeMedia = contribute.reference_media
                                zoomGest3.contributeTitleLbl = contribute.title
                                
                                cell.img3View.addGestureRecognizer(zoomGest3)
                                
                                let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest4.getInstType = 3
                                zoomGest4.gesRedirctType = "Contribute"
                                zoomGest4.img =  contribute.reference_media[3].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest4.contributeTitleLbl = contribute.title
                                zoomGest1.contributeMedia = contribute.reference_media
                                cell.img4View.addGestureRecognizer(zoomGest4)
                                
                                
                                //                if alumniContributeMedia.count == 1{
                                
                                
                                //                }
                                //                else if alumniContributeMedia.count == 3{
                                //
                                //
                                //                }
                                //                else if alumniContributeMedia.count == 4{
                                //
                                //
                                //                }
                                cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img3.sd_setImage(with: URL(string:  contribute.reference_media[2].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img4.sd_setImage(with: URL(string:  contribute.reference_media[3].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                        }
                        
                        
                        //
                        //                    if contributeMedia.count == 1 {
                        //
                        //                        cell.tvHeight.constant = 100
                        //                        cell.img1.isHidden = false
                        //                        cell.imgLstVie.isHidden = false
                        //
                        //                        cell.img1View.isHidden = false
                        //                        cell.img2.isHidden = true
                        //                        cell.img3.isHidden = true
                        //                        cell.img4.isHidden = true
                        //
                        //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                    }
                        //                    else if contributeMedia.count == 2 {
                        //                        cell.tvHeight.constant = 100
                        //                        cell.img1.isHidden = false
                        //                        cell.imgLstVie.isHidden = false
                        //
                        //                        cell.img1View.isHidden = false
                        //                        cell.img2.isHidden = false
                        //                        cell.img3.isHidden = true
                        //                        cell.img4.isHidden = true
                        //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                        //            }
                        //                    }
                        //                    else if contributeMedia.count == 3 {
                        //                        cell.tvHeight.constant = 100
                        //                        cell.img1.isHidden = false
                        //                        cell.imgLstVie.isHidden = false
                        //
                        //                        cell.img1View.isHidden = false
                        //                        cell.img2.isHidden = false
                        //                        cell.img3.isHidden = false
                        //                        cell.img4.isHidden = true
                        //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                        //            }
                        //                    }
                        //                    else if contributeMedia.count == 4 {
                        //                        cell.tvHeight.constant = 100
                        //                        cell.img1.isHidden = false
                        //                        cell.imgLstVie.isHidden = false
                        //
                        //                        cell.img1View.isHidden = false
                        //                        cell.img2.isHidden = false
                        //                        cell.img3.isHidden = false
                        //                        cell.img4.isHidden = false
                        //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                        cell.img4.sd_setImage(with: URL(string:  contributeMedia[3].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                        //            }
                        //                    }
                        //                    //        }
                        //
                        //
                        //
                        //
                        //                    let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                        //                    zoomGest.getInstType = 3
                        //                    zoomGest.gesRedirctType = "Contribute"
                        //
                        //        //            print("contribute.reference_media",contribute.reference_media.count)
                        //                    zoomGest.contributeMedia = contribute.reference_media
                        //                    zoomGest.contributeTitleLbl = contribute.title
                        //
                        
                        
                        
                        
                        let deleteGes = ContributeDeleteGesture(target: self, action: #selector(deleteClick))
                        deleteGes.deleteId = contribute.id
                        cell.viewDelete.addGestureRecognizer(deleteGes)
                        
                        
                        
                        
                        
                        
                        
                        //                    if menuType == "INSTITUTE FUND RAISING"{
                        //
                        //                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contributeRowIdentifier, for: indexPath) as! GetContributeListCollectionViewCell
                        //                        cvTop.constant = 0
                        //                        addViewHeight.constant = 50
                        //                        addView.isHidden = false
                        //                        addView.isHidden = false
                        //
                        //                         if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                        //                        layout.scrollDirection = .horizontal
                        //                    }
                        //
                        //    //                    cell.mainVc = self
                        //
                        //    //                    cell.contributeData = contributeData
                        //
                        //                        let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                        //                        addGes.addTitleName = "FUND RAISING"
                        //                        menuType = "INSTITUTE FUND RAISING"
                        //                        addView.addGestureRecognizer(addGes)
                        //                        cell.alumniInstNameLbl.isHidden = true
                        //                        let contribute : GetInstituteContributeResponseData = contributeData[indexPath.item]
                        //                        cell.descLbl.text = contribute.description
                        //                        cell.titleLbl.text = contribute.title
                        //                        cell.activeFromLbl.text =  "Active From :" + contribute.activeFrom
                        //                        cell.activeToLbl.text =  "Active To :" + contribute.activeTo
                        //                        cell.bulletPoints = contribute.bulletPoints
                        //                        print("contribute.bulletPoints",contribute.bulletPoints)
                        //
                        //
                        //                        if contribute.bulletPoints.count < 0 {
                        //                            cell.tvHeight.constant = 0
                        //                            cell.tv.isHidden = true
                        //                            cell.contributeImgTvHeight.constant = 250
                        //                        }else{
                        //                            cell.tvHeight.constant = 80
                        //                            cell.contributeImgTvHeight.constant = 300
                        //
                        //                            cell.tv.isHidden = false
                        //
                        //                        }
                        //
                        //
                        //                        if contribute.isAmount == true {
                        //                            cell.moreDetailView.isHidden = false
                        //                        }else{
                        //                            cell.moreDetailView.isHidden = true
                        //                        }
                        //
                        //
                        //            //
                        //
                        //
                        //                        if contribute.isAmount == true {
                        //
                        //                            cell.moreDetailView.isHidden = false
                        //                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                        //                            moreDetails.fundNeeded = contribute.noRequired
                        //                            moreDetails.fundReceived = contribute.noReceived
                        //                            moreDetails.noPending = contribute.noPending
                        //                            moreDetails.requestId = contribute.id
                        //            //                moreDetails.instId = contribute.instituteId
                        //                            moreDetails.isAmountCheck = "Amount"
                        //                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                        //
                        //                        }else{
                        //                            cell.moreDetailView.isHidden = false
                        //                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                        //                            moreDetails.fundNeeded = contribute.noRequired
                        //                            moreDetails.fundReceived = contribute.noReceived
                        //                            moreDetails.noPending = contribute.noPending
                        //                            moreDetails.requestId = contribute.id
                        //            //                moreDetails.instId = contribute.instituteId
                        //                            moreDetails.isAmountCheck = "Volunteer"
                        //                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                        //
                        //                        }
                        //
                        //
                        //                        contributeMedia = contribute.reference_media
                        //                        print("contribute.noRequired",contribute.noRequired)
                        //                        print("contribute.noReceived",contribute.noReceived)
                        //                        print("contribute.noPending",contribute.noPending)
                        //                        //        for i in contributeMedia {
                        //                        cell.noMediaImg.isHidden = true
                        //
                        //                        cell.noRecordView.isHidden = true
                        //                        alumniPinkGifView.isHidden = true
                        //                        cell.noRexordImg.isHidden = true
                        //
                        //                        if contributeMedia.count < 0 {
                        //                            cell.noMediaImg.isHidden = false
                        //
                        //                            cell.noRecordView.isHidden = false
                        //                            cell.noRexordImg.isHidden = false
                        //                        }else{
                        //                            cell.noMediaImg.isHidden = true
                        //
                        //                            cell.noRecordView.isHidden = true
                        //                            cell.noRexordImg.isHidden = true
                        //                        }
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //                            cell.img1.isHidden = true
                        //                            cell.img2.isHidden = true
                        //                            cell.img3.isHidden = true
                        //                            cell.img4.isHidden = true
                        //
                        //                        }
                        //
                        //
                        //
                        //                        else{
                        //
                        //
                        //
                        //
                        //                        if contribute.reference_media.count == 1 {
                        //                            cell.noMediaImg.isHidden = true
                        //                            cell.tvHeight.constant = 100
                        //                            cell.img1.isHidden = false
                        //                            cell.imgLstVie.isHidden = false
                        //
                        //                            cell.img2View.isHidden = false
                        //                            cell.img2.isHidden = true
                        //                            cell.img3.isHidden = true
                        //                            cell.img4.isHidden = true
                        //
                        //                            let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest.getInstType = 3
                        //                            zoomGest.gesRedirctType = "Contribute"
                        //                            zoomGest.img =  contribute.reference_media[0].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest.contributeMedia = contribute.reference_media
                        //                            zoomGest.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img1View.addGestureRecognizer(zoomGest)
                        //
                        //
                        //                            cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                        }
                        //                        else if contribute.reference_media.count == 2 {
                        //                            cell.tvHeight.constant = 100
                        //                            cell.img1.isHidden = false
                        //                            cell.imgLstVie.isHidden = false
                        //
                        //                            cell.img2View.isHidden = false
                        //                            cell.img2.isHidden = false
                        //                            cell.img3.isHidden = true
                        //                            cell.img4.isHidden = true
                        //                            let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest1.getInstType = 3
                        //                            zoomGest1.gesRedirctType = "Contribute"
                        //                            zoomGest1.img =  contribute.reference_media[0].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest1.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img1View.addGestureRecognizer(zoomGest1)
                        //
                        //            //
                        //
                        //                            let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest.getInstType = 3
                        //                            zoomGest.gesRedirctType = "Contribute"
                        //                            zoomGest.img =  contribute.reference_media[1].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img2View.addGestureRecognizer(zoomGest)
                        //
                        //            //
                        //
                        //
                        //
                        //            //                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                        //            //                zoomGest.getInstType = 3
                        //            //                zoomGest.gesRedirctType = "Contribute"
                        //            //                zoomGest.img =  alumniContributeMedia[0].url
                        //            //
                        //            //    //            print("contribute.reference_media",contribute.reference_media.count)
                        //            //                zoomGest.alumniContributeMedia = contribute.referenceMedia
                        //            //                zoomGest.contributeTitleLbl = contribute.title
                        //            //
                        //            //                cell.view1.addGestureRecognizer(zoomGest)
                        //            //
                        //            //                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                        //            //                zoomGest1.getInstType = 3
                        //            //                zoomGest1.gesRedirctType = "Contribute"
                        //            //                zoomGest.img =  alumniContributeMedia[1].url
                        //            //
                        //            //    //            print("contribute.reference_media",contribute.reference_media.count)
                        //            ////                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                        //            //                zoomGest1.contributeTitleLbl = contribute.title
                        //            //
                        //            //                cell.img1View.addGestureRecognizer(zoomGest1)
                        //            //
                        //
                        //                            cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                            //            }
                        //                        }
                        //                        else if contribute.reference_media.count == 3 {
                        //
                        //                            cell.tvHeight.constant = 100
                        //                            cell.img1.isHidden = false
                        //                            cell.imgLstVie.isHidden = false
                        //
                        //                            cell.img2View.isHidden = false
                        //                            cell.img2.isHidden = false
                        //                            cell.img3.isHidden = false
                        //                            cell.img4.isHidden = true
                        //                            let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest1.getInstType = 3
                        //                            zoomGest1.gesRedirctType = "Contribute"
                        //                            zoomGest1.img =  contribute.reference_media[0].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest1.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img1View.addGestureRecognizer(zoomGest1)
                        //
                        //            //
                        //
                        //                            let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest.getInstType = 3
                        //                            zoomGest.gesRedirctType = "Contribute"
                        //                            zoomGest.img =  contribute.reference_media[1].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img2View.addGestureRecognizer(zoomGest)
                        //
                        //            //
                        //                            let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest3.getInstType = 3
                        //                            zoomGest3.gesRedirctType = "Contribute"
                        //                            zoomGest3.img =  contribute.reference_media[2].url
                        //
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest3.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img3View.addGestureRecognizer(zoomGest3)
                        //
                        //
                        //            //                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                        //            //                zoomGest.getInstType = 3
                        //            //                zoomGest.gesRedirctType = "Contribute"
                        //            //                zoomGest.img =  alumniContributeMedia[0].url
                        //            //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //            //                zoomGest.alumniContributeMedia = contribute.referenceMedia
                        //            //                zoomGest.contributeTitleLbl = contribute.title
                        //            //
                        //            //                cell.view1.addGestureRecognizer(zoomGest)
                        //            //
                        //            //                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                        //            //                zoomGest1.getInstType = 3
                        //            //                zoomGest1.gesRedirctType = "Contribute"
                        //            //                zoomGest.img =  alumniContributeMedia[1].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //            //                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                        //            //                zoomGest1.contributeTitleLbl = contribute.title
                        //            //
                        //            //                cell.img1View.addGestureRecognizer(zoomGest1)
                        //            //
                        //            //                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
                        //            //                zoomGest3.getInstType = 3
                        //            //                zoomGest3.gesRedirctType = "Contribute"
                        //            //                zoomGest.img =  alumniContributeMedia[2].url
                        //            //
                        //            //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //            //                zoomGest3.alumniContributeMedia = contribute.referenceMedia
                        //            //                zoomGest3.contributeTitleLbl = contribute.title
                        //
                        //            //                cell.img3View.addGestureRecognizer(zoomGest3)
                        //                            cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img3.sd_setImage(with: URL(string:  contribute.reference_media[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                            //            }
                        //                        }
                        //                        else if contribute.reference_media.count == 4 {
                        //                            cell.tvHeight.constant = 100
                        //                            cell.img1.isHidden = false
                        //                            cell.imgLstVie.isHidden = false
                        //
                        //                            cell.img2View.isHidden = false
                        //                            cell.img2.isHidden = false
                        //                            cell.img3.isHidden = false
                        //                            cell.img4.isHidden = false
                        //
                        //
                        //
                        //            //                }
                        //            //                else if alumniContributeMedia.count == 2{
                        //            //
                        //                            let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest1.getInstType = 3
                        //                            zoomGest1.gesRedirctType = "Contribute"
                        //                            zoomGest1.img =  contribute.reference_media[0].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest1.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img1View.addGestureRecognizer(zoomGest1)
                        //
                        //            //
                        //
                        //                            let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest.getInstType = 3
                        //                            zoomGest.gesRedirctType = "Contribute"
                        //                            zoomGest.img =  contribute.reference_media[1].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img2View.addGestureRecognizer(zoomGest)
                        //
                        //            //
                        //                            let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest3.getInstType = 3
                        //                            zoomGest3.gesRedirctType = "Contribute"
                        //                            zoomGest3.img =  contribute.reference_media[2].url
                        //
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            zoomGest3.contributeTitleLbl = contribute.title
                        //
                        //                            cell.img3View.addGestureRecognizer(zoomGest3)
                        //
                        //                            let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                        //                            zoomGest4.getInstType = 3
                        //                            zoomGest4.gesRedirctType = "Contribute"
                        //                            zoomGest4.img =  contribute.reference_media[3].url
                        //
                        //                //            print("contribute.reference_media",contribute.reference_media.count)
                        //                            zoomGest4.contributeTitleLbl = contribute.title
                        //                            zoomGest1.contributeMedia = contribute.reference_media
                        //                            cell.img4View.addGestureRecognizer(zoomGest4)
                        //
                        //
                        //            //                if alumniContributeMedia.count == 1{
                        //
                        //
                        //            //                }
                        //            //                else if alumniContributeMedia.count == 3{
                        //            //
                        //            //
                        //            //                }
                        //            //                else if alumniContributeMedia.count == 4{
                        //            //
                        //            //
                        //            //                }
                        //                            cell.img1.sd_setImage(with: URL(string:  contribute.reference_media[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img2.sd_setImage(with: URL(string:  contribute.reference_media[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img3.sd_setImage(with: URL(string:  contribute.reference_media[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //                            cell.img4.sd_setImage(with: URL(string:  contribute.reference_media[3].url!), placeholderImage: UIImage(named: "Avatar"))
                        //
                        //                            //            }
                        //                        }
                        //                                }
                        //
                        //
                        //
                        //    //
                        //    //                    if contributeMedia.count == 1 {
                        //    //
                        //    //                        cell.tvHeight.constant = 100
                        //    //                        cell.img1.isHidden = false
                        //    //                        cell.imgLstVie.isHidden = false
                        //    //
                        //    //                        cell.img1View.isHidden = false
                        //    //                        cell.img2.isHidden = true
                        //    //                        cell.img3.isHidden = true
                        //    //                        cell.img4.isHidden = true
                        //    //
                        //    //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //
                        //    //                    }
                        //    //                    else if contributeMedia.count == 2 {
                        //    //                        cell.tvHeight.constant = 100
                        //    //                        cell.img1.isHidden = false
                        //    //                        cell.imgLstVie.isHidden = false
                        //    //
                        //    //                        cell.img1View.isHidden = false
                        //    //                        cell.img2.isHidden = false
                        //    //                        cell.img3.isHidden = true
                        //    //                        cell.img4.isHidden = true
                        //    //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //
                        //    //                        //            }
                        //    //                    }
                        //    //                    else if contributeMedia.count == 3 {
                        //    //                        cell.tvHeight.constant = 100
                        //    //                        cell.img1.isHidden = false
                        //    //                        cell.imgLstVie.isHidden = false
                        //    //
                        //    //                        cell.img1View.isHidden = false
                        //    //                        cell.img2.isHidden = false
                        //    //                        cell.img3.isHidden = false
                        //    //                        cell.img4.isHidden = true
                        //    //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //
                        //    //                        //            }
                        //    //                    }
                        //    //                    else if contributeMedia.count == 4 {
                        //    //                        cell.tvHeight.constant = 100
                        //    //                        cell.img1.isHidden = false
                        //    //                        cell.imgLstVie.isHidden = false
                        //    //
                        //    //                        cell.img1View.isHidden = false
                        //    //                        cell.img2.isHidden = false
                        //    //                        cell.img3.isHidden = false
                        //    //                        cell.img4.isHidden = false
                        //    //                        cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //                        cell.img4.sd_setImage(with: URL(string:  contributeMedia[3].url!), placeholderImage: UIImage(named: "Avatar"))
                        //    //
                        //    //                        //            }
                        //    //                    }
                        //    //                    //        }
                        //    //
                        //    //
                        //    //
                        //    //
                        //    //                    let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                        //    //                    zoomGest.getInstType = 3
                        //    //                    zoomGest.gesRedirctType = "Contribute"
                        //    //
                        //    //        //            print("contribute.reference_media",contribute.reference_media.count)
                        //    //                    zoomGest.contributeMedia = contribute.reference_media
                        //    //                    zoomGest.contributeTitleLbl = contribute.title
                        //    //
                        //
                        //
                        //
                        //
                        //                        let deleteGes = ContributeDeleteGesture(target: self, action: #selector(deleteClick))
                        //                        deleteGes.deleteId = contribute.id
                        //                        cell.viewDelete.addGestureRecognizer(deleteGes)
                        //
                        //                        return cell
                        //
                        //    //                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contributeRowIdentifier, for: indexPath) as! HomePAgeContribureCollectionViewCell
                        //    //
                        //    //
                        //    //                    addView.isHidden = false
                        //    //
                        //    //                     if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                        //    //                    layout.scrollDirection = .horizontal
                        //    //                }
                        //    //
                        //    //                    cell.mainVc = self
                        //    //
                        //    //                    cell.contributeData = contributeData
                        //    //
                        //    //                    let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                        //    //                    addGes.addTitleName = "FUND RAISING"
                        //    //                    addView.addGestureRecognizer(addGes)
                        //    //
                        //    //
                        //    //                    return cell
                        //
                        //                    }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        return cell
                        
                    }
                    //                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contributeRowIdentifier, for: indexPath) as! HomePAgeContribureCollectionViewCell
                    //
                    //
                    //                    addView.isHidden = false
                    //
                    //                     if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    //                    layout.scrollDirection = .horizontal
                    //                }
                    //
                    //                    cell.mainVc = self
                    //
                    //                    cell.contributeData = contributeData
                    //
                    //                    let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                    //                    addGes.addTitleName = "FUND RAISING"
                    //                    addView.addGestureRecognizer(addGes)
                    //
                    //
                    //                    return cell
                    
                }else {
                    //
                    
                    if  galleryInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: schoolGalleryRowIdentifier, for: indexPath) as! HomePageSchoolGalleryCollectionViewCell
                        
                        cvTop.constant = 0
                        cell.main = self
                        addView.isHidden = false
                        addViewHeight.constant = 50
                        addView.isHidden = false
                        
                        let addGes = getHomeImgGesture(target: self, action: #selector(addVc))
                        addGes.addTitleName = "GALLERY"
                        menuType = "INSTITUTE GALLERY"
                        addView.addGestureRecognizer(addGes)
                        
                        cell.countView.isHidden = true
                        cell.deleteView.isHidden = false
                        let instute : GalleryGetInstituteListData = instGalleryData[indexPath.row]
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .vertical
                        }
                        
                        //
                        
                        //                        print("garalry.collection_namegaralry.collection_name",i.collection_name)
                        cell.titleLbl.text = instute.collection_name
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        let delete  = GalleryDeleteGesture(target: self, action: #selector(deleteVc))
                        delete.collectionId = instute.collection_id
                        cell.deleteView.addGestureRecognizer(delete)
                        
                        
                        
                        
                        
                        
                        
                        
                        if instute.photos.count == 1{
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            
                            
                            
                            
                            cell.img1.isHidden = false
                            
                            
                            
                            
                            
                            
                            
                            cell.img2.isHidden = true
                            
                            
                            
                            
                            
                            
                            
                            cell.img3.isHidden = true
                            
                            
                            
                            
                            
                            
                            
                            cell.img4.isHidden = true
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            
                            
                            
                            
                            
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            cell.view1.layer.cornerRadius = 20
                            
                            
                            cell.img1height.constant = 200
                            
                            
                            
                        }
                        
                        
                        
                        else   if instute.photos.count == 2{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest1)
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest2)
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img3TopConstains.constant = 10
                            
                            cell.Image2TopConstains.constant = 10
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img1height.constant = 0
                            
                            cell.img1.isHidden = true
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            
                            
                            cell.img4.isHidden = true
                            
                            
                        }
                        
                        
                        
                        else   if instute.photos.count == 3{
                            
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img1height.constant = 200
                            
                            cell.img1.isHidden = false
                            
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            cell.img4.isHidden = true
                            
                            
                        }
                        
                        else   if instute.photos.count == 4{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            
                            
                            let zoomGest4 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest4.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest4.gesRedirctType = "Gallery"
                            
                            zoomGest4.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest4.galleryTitleLbl)
                            
                            zoomGest4.img = instute.photos[3].url
                            
                            zoomGest4.getPhotos = instute.photos
                            
                            zoomGest4.deleteID = instute.photos[3].id
                            
                            cell.view4.addGestureRecognizer(zoomGest4)
                            
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img4.sd_setImage(with: URL(string:  instute.photos[3].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img4.layer.cornerRadius = 20
                            
                            
                            cell.img1height.constant = 200
                            
                            cell.img1.isHidden = false
                            
                            
                            cell.img2.isHidden = false
                            
                            cell.img3.isHidden = false
                            
                            
                            cell.img4.isHidden = false
                            
                            
                            
                        }
                        
                        else{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            
                            
                            let zoomGest4 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest4.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest4.gesRedirctType = "Gallery"
                            
                            zoomGest4.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest4.galleryTitleLbl)
                            
                            zoomGest4.img = instute.photos[3].url
                            
                            zoomGest4.getPhotos = instute.photos
                            
                            zoomGest4.deleteID = instute.photos[3].id
                            
                            cell.view4.addGestureRecognizer(zoomGest4)
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img4.sd_setImage(with: URL(string:  instute.photos[3].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img4.layer.cornerRadius = 20
                            
                            
                            
                            cell.img1height.constant = 200
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            
                            cell.img1.isHidden = false
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            
                            cell.img4.isHidden = false
                            
                            
                            
                            cell.countView.isHidden = false
                            
                            
                            
                            cell.countLbl.isHidden = false
                            
                            cell.countLbl.text = String(instute.photos.count - 4)
                            
                            
                            
                            
                            
                            let count = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            count.getCollectionId = instute.institute_id
                            
                            count.gesRedirctType = "Gallery"
                            count.galleryTitleLbl = instute.collection_name
                            print("zoomGest3.galleryTitleLbl",count.galleryTitleLbl)
                            count.img = instute.photos[3].url
                            
                            count.deleteID = instute.photos[3].id
                            count.getPhotos = instute.photos
                            cell.countView.addGestureRecognizer(count)
                            
                            
                            
                            
                            
                        }
                        
                        
                        return cell
                        
                    }
                    
                }
                
                
            }
            
        }
        else{
            if collectionView == cv{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvRowIdentifier, for: indexPath) as! HomePageCollectionViewCell
                
                
                
                print("ClickViewName1222",ClickViewName)
                let icon_item : IconItem = iconAlumni[indexPath.item]
                cell.titleLbl.text = icon_item.text
                if icon_item.selected{
                    cell.titleView.backgroundColor = .black
                    cell.titleLbl.textColor = .white
                }else{
                    cell.titleView.backgroundColor = .white
                    cell.titleLbl.textColor = .black
                }
                //
                
                
                //
                return cell
            }else{
                if ClickViewName == "EVENTS"{
                    
                    Constant.DefaultsKeys.getEventsType = ""
                    Constant.DefaultsKeys.getEventsProfile = ""
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    if  eventInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventRowIdentifier, for: indexPath) as! EventListShowingCollectionViewCell
                        let alumniEventList : GetAlumniEventDetailData = passGetAlumniData[indexPath.row]
                        
                        cell.passGetAlumniData = passGetAlumniData
                        cell.namePassStr = alumniEventList.name
                        cell.titlePassStr = alumniEventList.title
                        cell.fromPassStr = alumniEventList.fromTime
                        
                        cell.toPassStr = alumniEventList.toTime
                        
                        cell.descPassStr = alumniEventList.description
                        cell.getAlumniMedia = alumniEventList.media
                        cell.main_vc = self
                        cell.venuePassStr = alumniEventList.venue
                        
                        cell.passType = alumniEventList.type
                        
                        cell.passProfile = alumniEventList.profile
                        cell.passUserId = alumniEventList.user_id
                        cell.passUserName = alumniEventList.user_name
                        cell.getEventsType = alumniEventList.type
                        
                        Constant.DefaultsKeys.getEventsType = alumniEventList.type
                        Constant.DefaultsKeys.getEventsProfile = alumniEventList.profile
                        print("cell.getEventsType",alumniEventList.type)
                        
                        
                        cvTop.constant = 0
                        
                        //                    cell.passGetAlumniData = passGetAlumniData
                        
                        cell.main_vc = self
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .horizontal
                        }
                        
                        return cell
                    }
                    
                }else if ClickViewName == "ALUMNI NETWORK"{
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    cvTop.constant = 0
                    if  networkInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: networkRowIdentifier, for: indexPath) as! NetworkRevisedCollectionViewCell
                        
                        
                        cvTop.constant = 0
                        let filterGes = UITapGestureRecognizer(target: self, action: #selector(filterVc))
                        networkSortView.addGestureRecognizer(filterGes)
                        
                        
                        
                        
                        
                        
                        let getAlumni : NetworkAlumniData = getNetWorkAlumniData [indexPath.row]
                        cell.nameLbl.text = getAlumni.name
                        cell.designationLbl.text = getAlumni.designation
                        cell.batchLbl.text = getAlumni.batch
                        cell.instituteNameLbl.text = getAlumni.instituteName
                        cell.profileImg.sd_setImage(with: URL(string:  getAlumni.profilePicture!), placeholderImage: UIImage(named: "Avatar"))
                        
                        
                        
                        
                        let rectShape = CAShapeLayer()
                        rectShape.bounds = cell.profileImg.frame
                        rectShape.position = cell.profileImg.center
                        rectShape.path = UIBezierPath(roundedRect: cell.profileImg.bounds, byRoundingCorners: [.bottomLeft  , .topLeft], cornerRadii: CGSize(width: 15, height: 25)).cgPath
                        
                        cell.profileImg.layer.backgroundColor = UIColor.green.cgColor
                        //Here I'm masking the textView's layer with rectShape layer
                        cell.profileImg.layer.mask = rectShape
                        
                        print("imageIntract",cell.profileImg.isUserInteractionEnabled)
                        
                        let imagClick = ProfileImageVc(target: self, action:#selector(ProfileIamgeVc))
                        imagClick.ImageUrl = getAlumni.profilePicture
                        imagClick.TitleLbl = getAlumni.name
                        cell.profileImg.addGestureRecognizer(imagClick)
                        //                    }
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .vertical
                        }
                        
                        
                        
                        let chatGes  = HomeRequestGesture(target: self, action: #selector(chatVc))
                        chatGes.userName = getAlumni.name
                        chatGes.user_id = getAlumni.id
                        chatGes.selectedUserId = getAlumni.id
                        print("getAlumni.id.id",getAlumni.id)
                        chatGes.designationStr = getAlumni.designation
                        
                        chatGes.userImg = getAlumni.profilePicture
                        
                        chatGes.companyName = getAlumni.companyName
                        
                        chatGes.batch = getAlumni.batch
                        chatGes.instituteName = getAlumni.instituteName
                        cell.ntworkFullView.addGestureRecognizer(chatGes)
                        
                        
                        
                        return cell
                        
                    }
                    
                }else if ClickViewName == "CHATS"{
                    
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: chatRowIdentifier, for: indexPath) as! HomePageChatCollectionViewCell
                    cvTop.constant = 0
                    addView.isHidden = true
                    cvBottom.isHidden = true
                    
                    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                        layout.scrollDirection = .vertical
                    }
                    
                    return cell
                    
                }else if ClickViewName == "CONTRIBUTE"{
                    
                    
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    if  contributeInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contributeRowIdentifier, for: indexPath) as! GetContributeListCollectionViewCell
                        cvTop.constant = 0
                        
                        //                    cell.mainVc = self
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .horizontal
                        }
                        
                        //                    cell.contributeAlumniData = contributeAlumniData
                        
                        
                        cell.viewDelete.isHidden = true
                        cell.viewDeleteHeight.constant = 0
                        
                        let contribute : GetAlumniSupportRequestReesponseData = contributeAlumniData[indexPath.item]
                        cell.descLbl.text = contribute.description
                        cell.titleLbl.text = contribute.title
                        cell.activeFromLbl.text =  "Active From :" + contribute.activeFrom
                        cell.activeToLbl.text =  "Active To :" + contribute.activeTo
                        cell.bulletPoints = contribute.bulletPoints
                        //            print("contribute.bulletPoints",contribute.bulletPoints)
                        
                        cell.alumniInstNameLbl.isHidden = false
                        cell.alumniInstNameLbl.text = contribute.instituteName
                        //            cell.insLbHeight.constant = 23
                        if contribute.isAmount == true {
                            
                            cell.moreDetailView.isHidden = false
                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                            moreDetails.fundNeeded = contribute.noRequired
                            moreDetails.fundReceived = contribute.noReceived
                            moreDetails.noPending = contribute.noPending
                            moreDetails.requestId = contribute.id
                            moreDetails.instId = contribute.instituteId
                            moreDetails.getTitleLbl = contribute.title
                            moreDetails.getInstituteName = contribute.instituteName
                            moreDetails.isAmountCheck = "Amount"
                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                            
                        }else{
                            cell.moreDetailView.isHidden = false
                            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                            moreDetails.fundNeeded = contribute.noRequired
                            moreDetails.fundReceived = contribute.noReceived
                            moreDetails.noPending = contribute.noPending
                            moreDetails.requestId = contribute.id
                            moreDetails.instId = contribute.instituteId
                            moreDetails.getTitleLbl = contribute.title
                            moreDetails.getInstituteName = contribute.instituteName
                            moreDetails.isAmountCheck = "Volunteer"
                            cell.moreDetailView.addGestureRecognizer(moreDetails)
                            
                        }
                        
                        
                        
                        if contribute.referenceMedia.count  == 0 {
                            
                            cell.noMediaImg.isHidden = false
                            
                            cell.img1.isHidden = true
                            cell.img2.isHidden = true
                            cell.img3.isHidden = true
                            cell.img4.isHidden = true
                            
                        }
                        
                        
                        
                        else{
                            
                            
                            cell.noMediaImg.isHidden = true
                            
                            
                            if contribute.referenceMedia.count == 1 {
                                
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                
                                cell.img2.isHidden = true
                                cell.img3.isHidden = true
                                cell.img4.isHidden = true
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.referenceMedia[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest)
                                
                                print("alumniContributeMedia[0].url",contribute.referenceMedia[0].url)
                                cell.img1.sd_setImage(with: URL(string:  contribute.referenceMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                            }
                            else if contribute.referenceMedia.count == 2 {
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = true
                                cell.img4.isHidden = true
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.referenceMedia[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.referenceMedia[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                
                                cell.img1.sd_setImage(with: URL(string:  contribute.referenceMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.referenceMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                            else if contribute.referenceMedia.count == 3 {
                                
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = false
                                cell.img4.isHidden = true
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.referenceMedia[0].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.referenceMedia[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                //
                                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest3.getInstType = 3
                                zoomGest3.gesRedirctType = "Contribute"
                                zoomGest3.img =  contribute.referenceMedia[2].url
                                
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest3.alumniContributeMedia = contribute.referenceMedia
                                zoomGest3.contributeTitleLbl = contribute.title
                                
                                cell.img3View.addGestureRecognizer(zoomGest3)
                                
                                
                                cell.img1.sd_setImage(with: URL(string:  contribute.referenceMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.referenceMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img3.sd_setImage(with: URL(string:  contribute.referenceMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                            else if contribute.referenceMedia.count == 4 {
                                cell.tvHeight.constant = 100
                                cell.img1.isHidden = false
                                cell.imgLstVie.isHidden = false
                                
                                cell.img2View.isHidden = false
                                cell.img2.isHidden = false
                                cell.img3.isHidden = false
                                cell.img4.isHidden = false
                                
                                
                                
                                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest1.getInstType = 3
                                zoomGest1.gesRedirctType = "Contribute"
                                zoomGest1.img =  contribute.referenceMedia[0].url
                                
                                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                                zoomGest1.contributeTitleLbl = contribute.title
                                
                                cell.img1View.addGestureRecognizer(zoomGest1)
                                
                                //
                                
                                let zoomGest = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest.getInstType = 3
                                zoomGest.gesRedirctType = "Contribute"
                                zoomGest.img =  contribute.referenceMedia[1].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest.alumniContributeMedia = contribute.referenceMedia
                                zoomGest.contributeTitleLbl = contribute.title
                                
                                cell.img2View.addGestureRecognizer(zoomGest)
                                
                                //
                                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest3.getInstType = 3
                                zoomGest3.gesRedirctType = "Contribute"
                                zoomGest3.img =  contribute.referenceMedia[2].url
                                
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest3.alumniContributeMedia = contribute.referenceMedia
                                zoomGest3.contributeTitleLbl = contribute.title
                                
                                cell.img3View.addGestureRecognizer(zoomGest3)
                                
                                let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVcContribute))
                                zoomGest4.getInstType = 3
                                zoomGest4.gesRedirctType = "Contribute"
                                zoomGest4.img =  contribute.referenceMedia[3].url
                                
                                //            print("contribute.reference_media",contribute.reference_media.count)
                                zoomGest4.contributeTitleLbl = contribute.title
                                zoomGest4.alumniContributeMedia = contribute.referenceMedia
                                cell.img4View.addGestureRecognizer(zoomGest4)
                                
                                
                                cell.img1.sd_setImage(with: URL(string:  contribute.referenceMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img2.sd_setImage(with: URL(string:  contribute.referenceMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img3.sd_setImage(with: URL(string:  contribute.referenceMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                                cell.img4.sd_setImage(with: URL(string:  contribute.referenceMedia[3].url!), placeholderImage: UIImage(named: "Avatar"))
                                
                                //            }
                            }
                            //        }
                            
                        }
                        
                        if memberType == 1 || memberType == 2 {
                            //
                            cell.viewDelete.isHidden = false
                        }else{
                            cell.viewDelete.isHidden = true
                            //                  getEventAlumniList()
                        }
                        
                        
                        
                        
                        return cell
                        
                    }
                    //
                    //
                }else if ClickViewName == "GALLERY"{
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    
                    
                    if  galleryInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: schoolGalleryRowIdentifier, for: indexPath) as! HomePageSchoolGalleryCollectionViewCell
                        
                        let instute : GalleryGetInstituteListData = instGalleryData[indexPath.row]
                        cvTop.constant = 0
                        
                        cell.countView.isHidden = true
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .vertical
                        }
                        cell.main = self
                        
                        cell.titleLbl.text = instute.collection_name
                        //
                        cell.deleteView.isHidden = true
                        
                        
                        
                        
                        
                        
                        if instute.photos.count == 1{
                            
                            
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img1.isHidden = false
                            
                            cell.img2.isHidden = true
                            
                            
                            cell.img3.isHidden = true
                            
                            cell.img4.isHidden = true
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            cell.view1.layer.cornerRadius = 20
                            
                            
                            cell.img1height.constant = 200
                            
                        }
                        
                        
                        else   if instute.photos.count == 2{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest1)
                            
                            
                            
                            
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest2)
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3TopConstains.constant = 10
                            
                            cell.Image2TopConstains.constant = 10
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            cell.img1height.constant = 0
                            
                            
                            cell.img1.isHidden = true
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            cell.img4.isHidden = true
                            
                        }
                        
                        
                        else   if instute.photos.count == 3{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img1height.constant = 200
                            
                            
                            
                            
                            cell.img1.isHidden = false
                            
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            
                            
                            cell.img4.isHidden = true
                            
                        }
                        
                        
                        else   if instute.photos.count == 4{
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            
                            
                            let zoomGest4 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest4.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest4.gesRedirctType = "Gallery"
                            
                            zoomGest4.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest4.galleryTitleLbl)
                            
                            zoomGest4.img = instute.photos[3].url
                            
                            zoomGest4.getPhotos = instute.photos
                            
                            zoomGest4.deleteID = instute.photos[3].id
                            
                            cell.view4.addGestureRecognizer(zoomGest4)
                            
                            
                            
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            cell.img4.sd_setImage(with: URL(string:  instute.photos[3].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            cell.img4.layer.cornerRadius = 20
                            
                            cell.img1height.constant = 200
                            
                            
                            
                            cell.img1.isHidden = false
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            cell.img3.isHidden = false
                            
                            cell.img4.isHidden = false
                            
                            
                        }
                        
                        
                        
                        else{
                            
                            cell.img1.sd_setImage(with: URL(string:  instute.photos[0].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            
                            
                            cell.img2.sd_setImage(with: URL(string:  instute.photos[1].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img3.sd_setImage(with: URL(string:  instute.photos[2].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img4.sd_setImage(with: URL(string:  instute.photos[3].url), placeholderImage: UIImage(named: "sample_black_screen"))
                            
                            
                            cell.img1.layer.cornerRadius = 20
                            
                            
                            
                            cell.img2.layer.cornerRadius = 70
                            
                            
                            
                            cell.img3.layer.cornerRadius = 50
                            
                            
                            cell.img4.layer.cornerRadius = 20
                            
                            
                            
                            cell.img1height.constant = 200
                            
                            
                            
                            cell.img3TopConstains.constant = 42
                            
                            
                            
                            cell.Image2TopConstains.constant = 27
                            
                            
                            
                            
                            cell.img1.isHidden = false
                            
                            
                            
                            
                            
                            
                            
                            cell.img2.isHidden = false
                            
                            
                            
                            
                            
                            
                            
                            cell.img3.isHidden = false
                            
                            
                            
                            
                            
                            
                            
                            cell.img4.isHidden = false
                            
                            
                            cell.countView.isHidden = false
                            
                            
                            
                            cell.countLbl.isHidden = false
                            
                            
                            
                            cell.countLbl.text = String(instute.photos.count - 4)
                            
                            
                            
                            
                            let count = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            count.getCollectionId = instute.institute_id
                            
                            count.gesRedirctType = "Gallery"
                            count.galleryTitleLbl = instute.collection_name
                            print("zoomGest3.galleryTitleLbl",count.galleryTitleLbl)
                            count.img = instute.photos[3].url
                            
                            count.deleteID = instute.photos[3].id
                            
                            count.getPhotos = instute.photos
                            cell.countView.addGestureRecognizer(count)
                            
                            
                            
                            let zoomGest1 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest1.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest1.galleryTitleLbl = instute.collection_name
                            
                            
                            
                            zoomGest1.gesRedirctType = "Gallery"
                            
                            zoomGest1.img = instute.photos[0].url
                            
                            zoomGest1.deleteID = instute.photos[0].id
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest1.galleryTitleLbl)
                            
                            
                            
                            zoomGest1.getPhotos = instute.photos
                            
                            cell.view1.addGestureRecognizer(zoomGest1)
                            
                            
                            
                            
                            
                            let zoomGest2 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            //
                            
                            zoomGest2.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest2.galleryTitleLbl = instute.collection_name
                            
                            zoomGest2.deleteID = instute.photos[1].id
                            
                            zoomGest2.gesRedirctType = "Gallery"
                            
                            print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)
                            
                            zoomGest2.img = instute.photos[1].url
                            
                            zoomGest2.getPhotos = instute.photos
                            
                            cell.view2.addGestureRecognizer(zoomGest2)
                            
                            
                            
                            let zoomGest3 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest3.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest3.gesRedirctType = "Gallery"
                            
                            zoomGest3.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)
                            
                            zoomGest3.img = instute.photos[2].url
                            
                            zoomGest3.deleteID = instute.photos[2].id
                            
                            zoomGest3.getPhotos = instute.photos
                            
                            cell.view3.addGestureRecognizer(zoomGest3)
                            
                            
                            
                            let zoomGest4 = getHomeImgGesture(target: self, action: #selector(zoomVc))
                            
                            zoomGest4.getCollectionId = instute.institute_id
                            
                            
                            
                            zoomGest4.gesRedirctType = "Gallery"
                            
                            zoomGest4.galleryTitleLbl = instute.collection_name
                            
                            print("zoomGest3.galleryTitleLbl",zoomGest4.galleryTitleLbl)
                            
                            zoomGest4.img = instute.photos[3].url
                            
                            zoomGest4.getPhotos = instute.photos
                            
                            zoomGest4.deleteID = instute.photos[3].id
                            
                            cell.view4.addGestureRecognizer(zoomGest4)
                            
                            
                        }
                        
                        
                        return cell
                    }
                }else  if ClickViewName == "ASSIST"{
                    //
                    addView.isHidden = true
                    addViewHeight.constant = 0
                    cvTop.constant = 50
                    if  assistInfoIdforRefer == 1{
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            
                            layout.scrollDirection = .vertical
                            
                            
                            
                        }
                        
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoIndentifer, for: indexPath) as! InfoCollectionViewCell
                        
                        
                        
                        let getInstitute  = infoRefrenceArray [indexPath.row]
                        
                        
                        
                        if getInstitute.contains(".gif") || getInstitute.contains(".jpg") || getInstitute.contains(".jpeg") || getInstitute.contains(".image") || getInstitute.contains(".svg") || getInstitute.contains(".png"){
                            
                            
                            
                            
                            
                            cell.imageHeight.constant = 150
                            
                            cell.infoLbl.isHidden = true
                            
                            cell.imageViews.isHidden = false
                            
                            cell.imageViews.sd_setImage(with: URL(string: getInstitute ), placeholderImage: UIImage(named: "Avatar"))
                            
                            
                            
                        }else{
                            
                            cell.imageHeight.constant = 0
                            
                            cell.infoLbl.isHidden = false
                            
                            cell.imageViews.isHidden = true
                            
                            
                            
                            cell.infoLbl.text = getInstitute
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        return cell
                        
                        
                        
                    }
                    
                    
                    
                    else{
                        
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: assistRowIdentifier, for: indexPath) as! AssistNewCollectionViewCell
                        
                        print("ASSIST CELL2134")
                        
                        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            layout.scrollDirection = .vertical
                        }
                        
                        
                        
                        cell.EditDeleteView.isHidden = true
                        cell.deleteView.isHidden = true
                        
                        
                        if clickAssistRequestType == "Request" {
                            let getAssistData : GetAssistListtData = getData [indexPath.row]
                            
                            cell.EditDeleteView.isHidden = true
                            cell.deleteView.isHidden = true
                            //
                            cell.nameLbl.text = getAssistData.name
                            cell.titleLbl.text = getAssistData.title
                            cell.descriptionLbl.text = getAssistData.description
                            
                            cell.imgView.sd_setImage(with: URL(string:  getAssistData.profile_picture!), placeholderImage: UIImage(named: "image 2"))
                        }else {
                            
                            //        if yourReqLbl.text == "YOUR REQUESTS"{
                            let getAssistData : GetAssistListtData = getData [indexPath.row]
                            //            cell.editView.isHidden = true
                            
                            cell.deleteView.isHidden = false
                            cell.EditDeleteView.isHidden = false
                            
                            cell.nameLbl.text = getAssistData.name
                            cell.titleLbl.text = getAssistData.title
                            cell.descriptionLbl.text = getAssistData.description
                            
                            
                            cell.imgView.sd_setImage(with: URL(string:  getAssistData.profile_picture!), placeholderImage: UIImage(named: "image 2"))
                            let deleteGesture = ReuestGesture(target: self, action:  #selector(deleteVcAssist))
                            deleteGesture.assistId = getAssistData.assist_id
                            cell.deleteView.addGestureRecognizer(deleteGesture)
                        }
                        
                        
                        //
                        //
                        return cell
                    }
                    
                }
                
                
                
                
                
                
                
                else{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: networkRowIdentifier, for: indexPath) as! HomePageNetwokCollectionViewCell
                    
                    return cell
                }
                
            }
            
        }
    }
    @IBAction func deleteVcAssist(ges : ReuestGesture) {
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("getAssistId",ges.assistId)
            
            
            let deleteModal = DeleteAssistModal()
            deleteModal.assist_id = ges.assistId
            
            var deleteModalStr = deleteModal.toJSONString()
            print("deleteModal",deleteModal.toJSON())
            DeleteAssistRequest.call_request(param: deleteModalStr!, token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteAssistResponse = Mapper<DeleteAssistResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    
                    getAssistList()
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    
                    present(alert, animated: true, completion: nil)
                    
                }
                
                
                
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBAction func chatVc(ges : HomeRequestGesture) {
        if memberType == 1 || memberType == 2 {
            //            let getInstitute : NetworkInstituteData = getInstituteData [indexPath.row]
            //
            
            print("Institute Not Access For Chat")
            
            
        }else{
            
            let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
            viewController.userName = ges.userName
            viewController.user_id = ges.user_id
            viewController.selectedUserId = ges.selectedUserId
            viewController.designationStr = ges.designationStr
            viewController.cNameStr = ges.companyName
            
            viewController.instituteNameStr = ges.instituteName
            viewController.userImg = ges.userImg
            
            viewController.batchStr = ges.batch
            
            present(viewController, animated: true)
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func filterVc() {
        
        networkShowHeight.constant = 50
        
        nameView.backgroundColor = .black
        nameLbl.textColor = .white
        
        
        searchType = "Name"
        batchView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        designationView.backgroundColor = .white
        professionLbl.textColor = .black
        print("working")
    }
    
    
    
    
    @IBAction func ProfileIamgeVc(ges : ProfileImageVc){
        
        print("profileclick")
        
        let vc = ShowProfilVcViewController(nibName: nil, bundle: nil)
        vc.NameLabel = ges.TitleLbl
        vc.imageUrls = ges.ImageUrl
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
        
        
    }
    
    
    @IBAction func moreDetailVc(ges : ContributeDeleteGesture) {
        let storyboard = UIStoryboard(name: "ContributeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ContributeViewController
        viewController.fundNeeded = ges.fundNeeded
        viewController.fundReceived = ges.fundReceived
        viewController.noPending = ges.noPending
        viewController.requestID = ges.requestId
        viewController.instituteID = ges.instId
        viewController.isAmountChck = ges.isAmountCheck
        viewController.getTitleLbl = ges.getTitleLbl
        
        viewController.getInstituteName = ges.getInstituteName
        present(viewController, animated: true)
    }
    
    
    @IBAction func deleteClick(ges : ContributeDeleteGesture) {
        //        print("ges.deleteId",ges.deleteId)
        
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            //
            let deleteModal = DeleteContributeModal()
            deleteModal.support_request_id = ges.deleteId
            
            
            var  deleteModalStr = deleteModal.toJSONString()
            //
            DeleteContributeRequest.call_request(param: deleteModalStr!,token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteContributeResponse = Mapper<DeleteContributeResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    cv.dataSource = self
                    cv.delegate = self
                    cv.reloadData()
                    print("creaveEventRes",deleteRes.message)
                    
                    getContributrList()
                    
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            //            print("Handle Cancel Logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)
        
        //      main.present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func zoomVcContribute(ges : getImgGesture) {
        //        print("imgzomm")
        
        print("gesttgdveb",ges.img)
        //        stringss.removeAll()
        
        print("stringssstringcontributeMediass",ges.contributeMedia)
        print("alumniContributeMediaalumniContributeMedia",ges.alumniContributeMedia)
        
        if memberType == 1 || memberType == 2 {
            for i in ges.contributeMedia{
                
                stringss.append(i.url)
            }
            
        }else{
            for i in ges.alumniContributeMedia{
                
                stringss.append(i.url)
            }
            
        }
        
        if let index = stringss.firstIndex(of: ges.img) {
            stringss.remove(at: index)
            stringss.insert(ges.img, at: 0)
        }
        
        
        
        print("stringssstringssss",stringss)
        
        
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.img
        //
        print("stringssstringss",stringss)
        viewController.redirectType = ges.gesRedirctType
        
        viewController.stringss = stringss
        viewController.contributeTitle = ges.contributeTitleLbl
        present(viewController, animated: true)
    }
    
    @IBAction func zoomVc(ges : getHomeImgGesture) {
        print("imgzomm")
        deleteIDForGallary.removeAll()
        stringss.removeAll()
        
        if memberType == 1 || memberType == 2 {
            for i in ges.getPhotos{
                
                stringss.append(i.url)
                deleteIDForGallary.append(i.id)
            }
            
        }else{
            for i in ges.getPhotos{
                
                stringss.append(i.url)
                deleteIDForGallary.append(i.id)
            }
            
        }
        
        if let index = stringss.firstIndex(of: ges.img) {
            stringss.remove(at: index)
            stringss.insert(ges.img, at: 0)
            
        }
        
        if let indexs = deleteIDForGallary.firstIndex(of: ges.deleteID){
            
            deleteIDForGallary.remove(at: indexs)
            deleteIDForGallary.insert(ges.deleteID, at: 0)
            
        }
        
        
        
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.img
        viewController.deleteHide  = 1
        
        viewController.stringss  =  stringss
        viewController.deleteIDForGallary = deleteIDForGallary
        viewController.redirectType = ges.gesRedirctType
        
        viewController.collecionId = ges.getCollectionId
        
        viewController.galleryTitle = ges.galleryTitleLbl
        viewController.getGalleryPhotos = ges.getPhotos
        print("ges.img",ges.img)
        present(viewController, animated: true)
        
        
    }
    
    
    
    @IBAction func deleteVc( ges : GalleryDeleteGesture) {
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this collection?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("ges.collectionId",ges.collectionId)
            
            
            let deleteModal = DeleteInstituteGalleryModal()
            deleteModal.collection_id = ges.collectionId
            
            var deleteModalStr = deleteModal.toJSONString()
            print("deleteModal",deleteModal.toJSON())
            GalleryDeleteRequest.call_request(param: deleteModalStr!, token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteInstituteGalleryResponse = Mapper<DeleteInstituteGalleryResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    
                    
                    if memberType == 1 || memberType == 2 {
                        getInstituteGalleryList()
                        cvBottom.dataSource = self
                        cvBottom.delegate = self
                        cvBottom.reloadData()
                        //
                    }else{
                        getAlumniGalleryList()
                    }
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    cvBottom.reloadData()
                    
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
                
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    //
    @IBAction func nextVc() {
        let storyboard = UIStoryboard(name: "ContributeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ContributeViewController
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func profileVc() {
        let storyboard = UIStoryboard(name: "ProfilePageStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ProfilePageViewController
        self.present(viewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  collectionView == cv{
            return CGSize(width: 140.0, height: 80)
        }else{
            
            if  ClickViewName == "GALLERY"{
                
                
                if  galleryInfoIdforRefer == 1{
                           return CGSize(width: 340, height: 130)
                }else {
                    
                    if instGalleryData[indexPath.row].photos.count == 1 {
                        
                        
                        return CGSize(width: 393, height: 260)
                        
                    }
                    else if instGalleryData[indexPath.row].photos.count == 2{
                        
                        return CGSize(width: 393, height: 235)
                    }
                    
                    else if instGalleryData[indexPath.row].photos.count == 3{
                        
                        return CGSize(width: 393, height: 450)
                    }
                    else {
                        
                        return CGSize(width: 393, height: 650)
                    }
                }
            } else if  ClickViewName == "ALUMNI DIRECTORY"{
                
                
                if  networkInfoIdforRefer == 1{
                    if showResultType == 1 {
                        return CGSize(width: 293, height: collectionView.frame.size.height-300)
                    }else{
                             return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height-300)
                    }
                }else {
                    if showResultType == 1 {
                        return CGSize(width: 293, height: 115)
                    }else{
                        return CGSize(width: 413, height: 115)
                    }
                }
            }else if  ClickViewName == "ALUMNI NETWORK"{
                if  networkInfoIdforRefer == 1{
                    if showResultType == 1 {
                        return CGSize(width: 293, height: collectionView.frame.size.height-300)
                    }else{
                        return CGSize(width: 293, height: collectionView.frame.size.height-300)

                    }
                }else {
                    if showResultType == 1 {
                        return CGSize(width: 293, height: 115)
                    }else{
                        return CGSize(width: 413, height: 115)
                    }
                }
            }else if  ClickViewName == "EVENTS"{
                
                if memberType == 1 || memberType == 2 {
                    if  eventInfoIdforRefer == 1{
                            return CGSize(width: 340, height: 130)
                    }else {
                        if getInstituteData.count == 1 {
                            return CGSize(width: 420 / 2 + 170 , height: collectionView.frame.size.height)
                            //            }else{
                            
                        }else{
                            return CGSize(width: 420 / 2 + 100 , height: collectionView.frame.size.height)
                        }
                    }
                }else{
                    if  eventInfoIdforRefer == 1{
                              return CGSize(width: 340, height: 130)
                    }else {
                        if passGetAlumniData.count == 1 {
                            return CGSize(width: 420 / 2 + 170 , height:  collectionView.frame.size.height)
                            //            }else{
                            
                        }else{
                            return CGSize(width: 420 / 2 + 100 , height: collectionView.frame.size.height)
                        }
                        
                    }
                }
                return CGSize(width:  400 / 2 + 80 , height: 550)
                
            }else if  ClickViewName == "FUND RAISING" {
                
                if  contributeInfoIdforRefer == 1{
                     return CGSize(width: 340, height: 130)
                }else {
                        
                        //            if memberType == 1 || memberType == 2 {
                        if contributeData.count == 1 {
                            return CGSize(width: 420 / 2 + 190 , height: 680)
                            //            }else{
                            
                        }else{
                            return CGSize(width: 420 / 2 + 100 , height: 680)
                        }
                        
                    }
                
            }else if  ClickViewName == "CONTRIBUTE" {
                if  contributeInfoIdforRefer == 1{
                         print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                     return CGSize(width: 340, height: 130)
                }else {
                    if contributeAlumniData.count == 1 {
                        return CGSize(width: 420 / 2 + 190 , height: 680)
                        //            }else{
                        
                    }else{
                        return CGSize(width: 420 / 2 + 100 , height: 680)
                    }
                }
            }
            
            //
            
            else if  ClickViewName == "ASSIST" {
                if  assistInfoIdforRefer == 1{
                         print("dfghdfbvkbgfhkn",infoRefrenceArray.count)
                     return CGSize(width: 340, height: 130)
                }else {
                        return CGSize(width: collectionView.frame.size.width, height: 200)
                    }
            }
            
            else{
                
                
                print("collectionView.frame.size.width",collectionView.frame.size.width)
                print("collectionView.frame.size.height",collectionView.frame.size.height)
                
                
                return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
                
            }
            
            
            
            
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if memberType == 1 || memberType == 2 {
            if collectionView == cv{
                
                change_icon_style(pos: indexPath.item)
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvRowIdentifier, for: indexPath) as! HomePageCollectionViewCell
                
                let icon_item : IconItem = icon[indexPath.item]
                
                
                print(" indexPath.item", indexPath.item)
                print("icon_item.text11",icon_item.text)
                //                cvBottom.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                //            }else {
                
                if icon_item.text == "EVENTS"{
                    cvBottom.isHidden = true
                    textTypeView.isHidden = true
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    //
                    NetworkShowView.isHidden = true
                    networkShowHeight.constant = 0
                    getOffset  = 0
                    addViewHeight.constant = 50
                    addView.isHidden = false
                    showResultView.isHidden = true
                    
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    getEventInstituteList ()
                    
                }else if icon_item.text == "ALUMNI DIRECTORY"{
                    showResultType = 0
                    clearFilterType = 0
                    //                cvTop.constant = 120
                    
                    filterClickView.isHidden = false
                    nameView.backgroundColor = .black
                    //                cvTop.constant = 100
                    nameLbl.textColor = .white
                    //
                    //                professionLbl.textColor = .black
                    
                    showResultView.isHidden = true
                    NetworkShowView.isHidden = false
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    
                    
                    
                    setNameView.isHidden = true
                    setBatchView.isHidden = true
                    setProfeesionView.isHidden = true
                    setCompanyNameView.isHidden = true
                    
                    
                    nameText = ""
                    cNameText = ""
                    batchText = 0
                    professionText = ""
                    
                    print("clearFilterType456ythg",clearFilterType)
                    if clearFilterType == 1 {
                        clearFilterType = 1
                        if nameView.backgroundColor == .black {
                            
                            let aString = setNameLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            nameText = newString
                            //
                        }else{
                            nameText = ""
                        }
                        
                        if designationView.backgroundColor == .black {
                            let aString = setProfessionLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Profession Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            professionText = newString
                        }else{
                            professionText = ""
                            
                        }
                        
                        
                        if companyNAmeView.backgroundColor == .black {
                            let aString = setCompanyNameLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Company Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            cNameText = newString
                        }else{
                            cNameText = ""
                            
                        }
                        
                        if batchView.backgroundColor == .black {
                            
                            let aString = setBatchLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Batch : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            batchText = Int(newString) ?? 0
                            
                        }else{
                            batchText =  0
                        }
                        
                    }
                    
                    
                    else{
                        if nameView.backgroundColor == .black {
                            nameText = networkEditText.text!
                            
                        }
                        
                        if designationView.backgroundColor == .black {
                            professionText = professionTextField.text!
                        }
                        
                        
                        if companyNAmeView.backgroundColor == .black {
                            cNameText = companyTextField.text!
                        }
                        
                        if batchView.backgroundColor == .black {
                            batchText = Int(BatchTextField.text ?? "") ?? 0
                        }
                        
                    }
                    
                    
                    
                    
                    
                    textTypeView.isHidden = true
                    
                    networkEditText.isHidden = false
                    //                companyTextField.text = ""
                    BatchTextField.isHidden = true
                    
                    companyTextField.isHidden = true
                    professionTextField.isHidden = true
                    
                    
                    
                    networkShowHeight.constant = 50
                    
                    //
                    
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    addView.isHidden = true
                    cvBottom.isHidden = true
                    getOffset  = 0
                    getNetworkInstituteList ()
                    
                }else if icon_item.text == "FUND RAISING"{
                    cvBottom.isHidden = true
                    textTypeView.isHidden = true
                    NetworkShowView.isHidden = true
                    showResultView.isHidden = true
                    
                    //                searchCloseView.isHidden = true
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    //                searchCloseViewWidth.constant = 0
                    //                searchCloseImg.isHidden = true
                    networkShowHeight.constant = 0
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    addViewHeight.constant = 50
                    addView.isHidden = false
                    getOffset  = 0
                    //                searchTextField.resignFirstResponder()
                    getContributrList ()
                    
                }else if icon_item.text == "GALLERY"{
                    cvBottom.isHidden = true
                    gallerview.isHidden = true
                    showResultView.isHidden = true
                    
                    galleryHeight.constant = 0
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    NetworkShowView.isHidden = true
                    //                searchCloseView.isHidden = true
                    //                searchCloseViewWidth.constant = 0
                    //                searchCloseImg.isHidden = true
                    addViewHeight.constant = 50
                    addView.isHidden = false
                    networkShowHeight.constant = 0
                    getOffset  = 0
                    //                searchTextField.resignFirstResponder()
                    getInstituteGalleryList ()
                    
                }
                else if icon_item.text == "CHATS"{
                    print("CHATS")
                    textTypeView.isHidden = true
                    showResultView.isHidden = true
                    
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    NetworkShowView.isHidden = true
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    //
                    networkShowHeight.constant = 0
                    //                searchTextField.resignFirstResponder()
                    
                    //            }
                }
            }else{
                print("DiDSelectNot")
            }
            
        } else {
            if collectionView == cv{
                
                change_icon_style(pos: indexPath.item)
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvRowIdentifier, for: indexPath) as! HomePageCollectionViewCell
                
                let icon_item : IconItem = iconAlumni[indexPath.item]
                print("ClickViewNaDidme1222",ClickViewName)
                
                print(" indexPath.item", indexPath.item)
                
                
                
                if icon_item.text == "EVENTS"{
                    cvBottom.isHidden = true
                    textTypeView.isHidden = true
                    NetworkShowView.isHidden = true
                    //
                    networkShowHeight.constant = 0
                    getOffset  = 0
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    gallerview.isHidden = true
                    showResultView.isHidden = true
                    galleryHeight.constant = 0
                    getEventAlumniList()
                    
                }else if icon_item.text == "ALUMNI NETWORK"{
                    //
                    filterClickView.isHidden = false
                    showResultType = 0
                    cvBottom.isHidden = true
                    print("clearFilterType456ythg",clearFilterType)

//                    nameView.backgroundColor = .black
//                    nameLbl.textColor = .white
//                    companyNAmeView.backgroundColor = .white
//                    companyNameLbl.textColor = .black
//                    
//                    batchView.backgroundColor = .white
//                    passedYrLbl.textColor = .black
//                    
                    
//                    designationView.backgroundColor = .white
//                    professionLbl.textColor = .black
                    
                    sideMenuView.isHidden = true
                    showResultView.isHidden = true
                    setNameView.isHidden = true
                    setBatchView.isHidden = true
                    setProfeesionView.isHidden = true
                    setCompanyNameView.isHidden = true
                    textTypeView.isHidden = true
//                    
                    clearFilterType = 0
                    
                    nameText = ""
                    cNameText = ""
                    batchText = 0
                    professionText = ""
                    
                    
                    
                    if clearFilterType == 1 {
                        clearFilterType = 1
                        if nameView.backgroundColor == .black {
                            
                            let aString = setNameLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            nameText = newString
                            //
                        }else{
                            nameText = ""
                        }
                        
                        if designationView.backgroundColor == .black {
                            let aString = setProfessionLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Profession Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            professionText = newString
                        }else{
                            professionText = ""
                            
                        }
                        
                        
                        if companyNAmeView.backgroundColor == .black {
                            let aString = setCompanyNameLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Company Name : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            cNameText = newString
                        }else{
                            cNameText = ""
                            
                        }
                        
                        if batchView.backgroundColor == .black {
                            
                            let aString = setBatchLbl.text!
                            print("aString",aString)
                            let newString = aString.replacingOccurrences(of: "Batch : ", with: "", options: .literal, range: nil)
                            
                            print("newString",newString)
                            batchText = Int(newString) ?? 0
                            
                        }else{
                            batchText =  0
                        }
                        
                    }
                    
                    
                    else{
                        if nameView.backgroundColor == .black {
                            nameText = networkEditText.text!
                            
                        }
                        
                        if designationView.backgroundColor == .black {
                            professionText = professionTextField.text!
                        }
                        
                        
                        if companyNAmeView.backgroundColor == .black {
                            cNameText = companyTextField.text!
                        }
                        
                        if batchView.backgroundColor == .black {
                            batchText = Int(BatchTextField.text ?? "") ?? 0
                        }
                        
                    }
                    
                    networkEditText.isHidden = false
                    BatchTextField.isHidden = true
                    
                    companyTextField.isHidden = true
                    professionTextField.isHidden = true
                    
                    cvBottomLeading.constant = 0
                    NetworkShowView.isHidden = false
                    
                    networkShowHeight.constant = 50
                    //
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    //
                    getOffset  = 0
                    getNetworkAlumniList ()
                    
                }else if icon_item.text == "CONTRIBUTE"{
                    cvBottom.isHidden = true
                    textTypeView.isHidden = true
                    getOffset  = 0
                    showResultView.isHidden = true
                    
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    NetworkShowView.isHidden = true
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    //
                    networkShowHeight.constant = 0
                    getAlumniContributrList()
                    
                }else if icon_item.text == "GALLERY"{
                    cvBottom.isHidden = true
                    gallerview.isHidden = true
                    textTypeView.isHidden = true
                    showResultView.isHidden = true
                    
                    galleryHeight.constant = 0
                    gallerview.isHidden = false
                    galleryHeight.constant = 50
                    getOffset  = 0
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    NetworkShowView.isHidden = true
                    //
                    networkShowHeight.constant = 0
                    getAlumniGalleryList ()
                    
                }else if icon_item.text == "CHATS"{
                    print("CHATS CELL")
                    cvBottom.isHidden = true
                    gallerview.isHidden = true
                    textTypeView.isHidden = true
                    showResultView.isHidden = true
                    
                    galleryHeight.constant = 0
                    NetworkShowView.isHidden = true
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    //
                    networkShowHeight.constant = 0
                    
                }else if icon_item.text == "ASSIST"{
                    gallerview.isHidden = true
                    galleryHeight.constant = 0
                    cvBottom.isHidden = true
                    textTypeView.isHidden = true
                    //
                    sideMenuView.isHidden = true
                    cvBottomLeading.constant = 0
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    showResultView.isHidden = true
                    
                    gifImage.isHidden = true
                    getOffset  = 0
                    assistView.isHidden = false
                    assistViewHeight.constant = 50
                    print("clickASSIST")
                    requestAidView.isHidden = false
                    requestAidViewHeight.constant = 50
                    NetworkShowView.isHidden = true
                    networkShowHeight.constant = 0
                    //
                    
                    if clickAssistRequestType == "Request" {
                        getAssistAllList()
                    }else {
                        
                        getAssistList()
                    }
                    
                    
                    
                    
                    print("ASSIST CELL")
                    
                    
                }
                
                
                
            }
        }
        
    }
    
    func change_icon_style(pos: Int){
        if memberType == 1 || memberType == 2 {
            for i in 0..<icon.count{
                if pos == i{
                    icon[i].selected =  true
                }else{
                    icon[i].selected = false
                }
            }
            cv.reloadData()
        }else{
            for i in 0..<iconAlumni.count{
                if pos == i{
                    iconAlumni[i].selected =  true
                }else{
                    iconAlumni[i].selected = false
                }
            }
            cv.reloadData()
        }
    }
    
    
    func getEventAlumniList () {
        
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        assistView.isHidden = true
        requestAidView.isHidden = true
        assistViewHeight.constant = 0
        print("getEventAlumniListFunctionInside")
        ClickViewName = "EVENTS"
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        
        
        print("token",token)
        print("param",param)
        
        GetEventAlumniListRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let alumniEventResponse : GetAlumniEventDetailResponse = Mapper<GetAlumniEventDetailResponse>().map(JSONString: res)!
            
            
            if Constant.DefaultsKeys.TokenExpire == 401{
                
                
                let alert = UIAlertController(title: "Alert", message: "TokenExpired" , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
                
            }
            
            
            else{
                
                
                if alumniEventResponse.status == true {
                    passGetAlumniData = alumniEventResponse.data
                    //                getAlumniData = alumniNetworkResponse.data
                    //
                    
                    cvBottom.isHidden = false
                    
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    cvBottom.reloadData()
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    
                    
                }else{
                    
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        eventInfoIdforRefer = 1
                        
                        var info = alumniEventResponse.info
                        
                        //
                        
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                    //
                    
                }
                
            }
        }
    }
    
    
    
    @IBAction func contributeDeleteClick(ges : ContributeDeleteGesture) {
        
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            //
            
            let deleteModal = DeleteContributeModal()
            deleteModal.support_request_id = ges.deleteId
            
            
            var  deleteModalStr = deleteModal.toJSONString()
            //
            DeleteContributeRequest.call_request(param: deleteModalStr!,token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteContributeResponse = Mapper<DeleteContributeResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    cv.dataSource = self
                    cv.delegate = self
                    cv.reloadData()
                    print("creaveEventRes",deleteRes.message)
                    
                    getContributrList()
                    
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            //            print("Handle Cancel Logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    func getEventInstituteList () {
        
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        eventInfoIdforRefer = 0
        ClickViewName = "EVENTS"
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        
        
        print("token",token)
        print("param",param)
        
        GetEventInstituteListRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            //            res.
            let instituteEventResponse : GetInstituteEventDetailResponse = Mapper<GetInstituteEventDetailResponse>().map(JSONString: res)!
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
                
                if instituteEventResponse.status == true {
                    print("error \(instituteEventResponse.status)")
                    
                    getInstituteData.removeAll()
                    
                    print("beforegetInstituteData",getInstituteData)
                    getInstituteData = instituteEventResponse.data
                    
                    
                    cvBottom.isHidden = false
                    
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    cvBottom.reloadData()
                    
                    
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    
                }else{
                    
                    
                    //
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        eventInfoIdforRefer = 1
                        
                        
                        
                        
                        
                        var info = instituteEventResponse.info
                        
                        //
                        
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        
                        
                        
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                }
                
            }
            
            
        }
    }
    
    
    
    
    //    Contribute API RESPONSE
    
    func getContributrList() {
        
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        contributeInfoIdforRefer = 0
        //         cvBottom.isHidden = false
        ClickViewName = "FUND RAISING"
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        print("token",token)
        getContributeRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let contributeModalRes : GetInstituteContributeResponse = Mapper<GetInstituteContributeResponse>().map(JSONString: res)!
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
                if contributeModalRes.status == true {
                    
                    contributeData = contributeModalRes.data
                    
                    
                    cvBottom.isHidden = false
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    cvBottom.reloadData()
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    
                    
                    
                }else{
                    
                    
                    
                    
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        contributeInfoIdforRefer = 1
                        
                        
                        
                        
                        
                        var info = contributeModalRes.info
                        
                        //
                        
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        
                        
                        
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                    
                    
                    
                }
            }
        }
    }
    
    
    
    
    
    
    func getAlumniContributrList() {
        
        print("ClickViewName????",ClickViewName)
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        contributeInfoIdforRefer = 0
        assistView.isHidden = true
        requestAidView.isHidden = true
        assistViewHeight.constant = 0
        //        cvBottom.isHidden = false
        ClickViewName = "CONTRIBUTE"
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset
            
        ]
        
        print("token",token)
        getAlumniContributeRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let contributeModalRes : GetAlumniSupportRequestReesponse = Mapper<GetAlumniSupportRequestReesponse>().map(JSONString: res)!
            
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
                
                if contributeModalRes.status == true {
                    
                    contributeAlumniData = contributeModalRes.data
                    
                    
                    
                    print("contributeAlumniData..c",contributeAlumniData.count)
                    cvBottom.isHidden = false
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    cvBottom.reloadData()
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    
                    
                }else{
                    
                    
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        contributeInfoIdforRefer = 1
                        
                        
                        
                        
                        
                        var info = contributeModalRes.info
                        
                        //
                        
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        
                        
                        
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    //    Network API RESPONSE
    
    @IBAction  func getNetworkAlumniList () {
        //        cvBottom.isHidden = false
        networkInfoIdforRefer = 0
        
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        ClickViewName = "ALUMNI NETWORK"
        assistView.isHidden = true
        requestAidView.isHidden = true
        assistViewHeight.constant = 0
        
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset,
            "year" : batchText,
            "designation" : professionText,
            "name" : nameText,
            "company_name" : cNameText
            
        ]
        
        
        
        print("token",token)
        print("param899889",param)
        
        GetNetworkAlumniRequest.call_request(param: param,token: token){ [self]
            (res) in
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
                let alumniNetworkResponse : NetworkAlumniResponse = Mapper<NetworkAlumniResponse>().map(JSONString: res)!
                
                if alumniNetworkResponse.status == true {
                    
                    print("IF COND")
                    getNetWorkAlumniData = alumniNetworkResponse.data
                    getNetWorkAlumniData2.append(contentsOf: getNetWorkAlumniData)
                    alumni_clone_list = alumniNetworkResponse.data
                    
                    
                    cvBottom.isHidden = false
                    
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    
                    cvBottom.reloadData()
                    //
                    
                }else{
                    
                    print("else COND")
                    
                    
                    
                    
                    if showResultType == 1 {
                        cvBottom.isHidden = true
                        alumniPinkGifView.isHidden = false
                        alumniPinkGifView.backgroundColor = .clear
                        noRecordView.isHidden = false
                        noRecordView.backgroundColor = .clear
                        noRecordLbl.text = alumniNetworkResponse.message
                    }else{
                        
                        if getOffset == 0 {
                            cvBottom.isHidden = false
                            
                            
                            networkInfoIdforRefer = 1
                            
                            
                            
                            
                            
                            var info = alumniNetworkResponse.info
                            
                            //
                            
                            
                            
                            infoRefrenceArray = info!.components(separatedBy: "~~~")
                            
                            
                            
                            
                            
                            print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                            
                            
                            
                            cvBottom.dataSource = self
                            
                            cvBottom.delegate = self
                            
                            
                            
                            cvBottom.reloadData()
                            
                            
                            
                        }
                        
                        
                    }
                    
                    //
                }
                
            }
        }
    }
    
    
    @IBAction  func getNetworkInstituteList () {
        //        cvBottom.isHidden = false
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        networkInfoIdforRefer = 0
        gifImage.isHidden = true
        ClickViewName = "ALUMNI DIRECTORY"
        
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": getOffset,
            "year" : batchText,
            "designation" : professionText,
            "name" : nameText,
            "company_name" : cNameText
        ]
        
        
        
        print("token",token)
        print("param",param)
        
        GetNetworkInstituteRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let instituteNetworkResponse : NetworkInstituteResponse = Mapper<NetworkInstituteResponse>().map(JSONString: res)!
            
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
                if instituteNetworkResponse.status == true {
                    
                    
                    
                    
                    getNetWorkInstituteData = instituteNetworkResponse.data
                    
                    
                    
                    
                    getNetWorkInstituteData2.append(contentsOf: getNetWorkInstituteData)
                    
                    
                    
                    clone_list = instituteNetworkResponse.data
                    
                    
                    cvBottom.isHidden = false
                    
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    
                    cvBottom.reloadData()
                    //
                    
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    
                }else{
                    
                    
                    
                    print("showResultTypeshowResultType",showResultType)
                    
                    if showResultType == 1 {
                        cvBottom.isHidden = true
                        alumniPinkGifView.isHidden = false
                        alumniPinkGifView.backgroundColor = .clear
                        
                        noRecordView.isHidden = false
                        
                        noRecordView.backgroundColor = .clear
                        noRecordLbl.text = instituteNetworkResponse.message
                    }else{
                        
                        if getOffset == 0 {
                            
                            cvBottom.isHidden = false
                            
                            networkInfoIdforRefer = 1
                            
                            
                            
                            
                            
                            var info = instituteNetworkResponse.info
                            
                            //
                            
                            
                            
                            infoRefrenceArray = info!.components(separatedBy: "~~~")
                            
                            
                            
                            
                            
                            print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                            
                            
                            
                            cvBottom.dataSource = self
                            
                            cvBottom.delegate = self
                            
                            
                            
                            cvBottom.reloadData()
                            
                            
                            
                        }
                        
                        
                        //
                    }
                }
                
                
            }
        }
    }
    
    //    Gallery API RESPONSE
    @IBAction func getInstituteGalleryList() {
        //        cvBottom.isHidden = false
        
        noRecordView.isHidden = true
        galleryInfoIdforRefer = 0
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        ClickViewName = "GALLERY"
        let param : [String : Any] =
        [
            "institute_id": instituteId!
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetInstituteSideGalleryReuest.call_request(param: param,token: token){ [self]
            (res) in
            
            let instituteGalleryModalRes : GalleryGetInstituteListResponse = Mapper<GalleryGetInstituteListResponse>().map(JSONString: res)!
            print("res",res)
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
                
                if instituteGalleryModalRes.status == true {
                    
                    instGalleryData =  instituteGalleryModalRes.data
                    Constant.DefaultsKeys.instGalleryData = instituteGalleryModalRes.data
                    for i in instGalleryData {
                        getPhotos = i.photos
                    }
                    cvBottom.isHidden = false
                    
                    print("instGalleryData",instGalleryData)
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    cvBottom.reloadData()
                    
                }else{
                    
                    
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        galleryInfoIdforRefer = 1
                        
                        
                        
                        
                        
                        var info = instituteGalleryModalRes.info
                        
                        //
                        
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        
                        
                        
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                    
                    
                }
            }
        }
    }
    
    
    
    
    @IBAction func getAlumniGalleryList() {
        gallerview.isHidden = true
        galleryHeight.constant = 0
        galleryInfoIdforRefer = 0
        noRecordView.isHidden = true
        alumniPinkGifView.isHidden = true
        gifImage.isHidden = true
        assistView.isHidden = true
        requestAidView.isHidden = true
        assistViewHeight.constant = 0
        //                cvBottom.isHidden = false
        ClickViewName = "GALLERY"
        
        GetAlumniSideGallery.call_request(token: token){ [self]
            (res) in
            
            
            let AlumniGalleryModalRes : GalleryGetAlumniInstituteResponse = Mapper<GalleryGetAlumniInstituteResponse>().map(JSONString: res)!
            
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
                    
                    
                    AlumniGalleryData = AlumniGalleryModalRes.data
                    instituteId = AlumniGalleryModalRes.data[0].institute_id
                    print("getInstituteGalleryListinstituteId",instituteId)
                    print("AlumniGalleryDatacount",AlumniGalleryData.count)
                    if AlumniGalleryData.count < 1 || AlumniGalleryData.count == 1 {
                        gallerview.isHidden = true
                        galleryHeight.constant = 0
                        
                        
                    }else{
                        gallerview.isHidden = false
                        galleryHeight.constant = 50
                        galleryLbl.text = AlumniGalleryModalRes.data[0].institute_name
                        //                                galleryLbl.text = AlumniGalleryModalRes.data[0].institute_name
                    }
                    
                    
                    
                    getInstituteGalleryList()
                    cvBottom.isHidden = false
                    
                    
                    cvBottom.isHidden = false
                    cvBottom.dataSource = self
                    cvBottom.delegate = self
                    noRecordView.isHidden = true
                    alumniPinkGifView.isHidden = true
                    gifImage.isHidden = true
                    cvBottom.reloadData()
                    
                }else{
                    
                    
                    cvBottom.isHidden = false
                    
                    
                    
                    if getOffset == 0 {
                        
                        
                        
                        galleryInfoIdforRefer = 1
                        
                        
                        
                        
                        
                        var info = AlumniGalleryModalRes.info
                        
                        
                        infoRefrenceArray = info!.components(separatedBy: "~~~")
                        
                        print("infoRefrenceArrayinfoRefrenceArray",infoRefrenceArray)
                        
                        
                        
                        cvBottom.dataSource = self
                        
                        cvBottom.delegate = self
                        
                        
                        
                        cvBottom.reloadData()
                        
                        
                        
                    }
                    
                }
                
                
                
            }
        }
    }
    
    
    
    
    
    
    func SpecificSearch(searchText: String) {
        
        if memberType == 1 || memberType == 2 {
            
            
            let filtered_list : [NetworkInstituteData] = Mapper<NetworkInstituteData>().mapArray(JSONString: clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                print("searchType",searchType)
                if searchType == "Name" {
                    getNetWorkInstituteData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased())}
                }else if searchType == "Batch" {
                    getNetWorkInstituteData = filtered_list.filter { $0.batch.lowercased().contains(searchText.lowercased())}
                    
                }else if searchType == "Designation" {
                    
                    
                    getNetWorkInstituteData = filtered_list.filter {  $0.designation.lowercased().contains(searchText.lowercased())}
                }
                
                
                
            }else{
                getNetWorkInstituteData = filtered_list
                print("getInstituteData")
            }
            
            if getNetWorkInstituteData.count > 0{
                noRecordView.isHidden = true
                alumniPinkGifView.isHidden = true
                //                noRecordsLbl.isHidden = true
                
                gifImage.isHidden = true
                
                print ("searchListPendigCount",getNetWorkInstituteData.count)
                //                viewEmpty.alpha = 0
                //                emptyLbl.alpha = 0
            }else{
                noRecordView.isHidden = false
                alumniPinkGifView.isHidden = true
                //                noRecordsLbl.isHidden = false
                gifImage.isHidden = false
                let gifURL = UIImage.gif(name: "no_data_found")
                // Use SDWebImage to load and display the GIF image
                gifImage.image = gifURL
                
            }
            
            
            
            cvBottom.reloadData()
            //
            
        }else{
            let filtered_list : [NetworkAlumniData] = Mapper<NetworkAlumniData>().mapArray(JSONString: alumni_clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                if searchType == "Name" {
                    getNetWorkAlumniData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased())}
                }else if searchType == "Batch" {
                    getNetWorkAlumniData = filtered_list.filter { $0.batch.lowercased().contains(searchText.lowercased())}
                    
                }else if searchType == "Designation" {
                    
                    
                    getNetWorkAlumniData = filtered_list.filter {  $0.designation.lowercased().contains(searchText.lowercased())}
                }
                
                
            }else{
                
                getNetWorkAlumniData = filtered_list
                print("pendingOrder")
            }
            
            if getNetWorkAlumniData.count > 0{
                noRecordView.isHidden = true
                alumniPinkGifView.isHidden = true
                //                noRecordsLbl.isHidden = true
                gifImage.isHidden = true
                
                
                
                print ("searchListPendigCount",getNetWorkAlumniData.count)
                
            }else{
                let gifURL = UIImage.gif(name: "no_data_found")
                // Use SDWebImage to load and display the GIF image
                gifImage.image = gifURL
                //               self.gifImage.image = UIImage.gif(name: "no_data_found")
                gifImage.isHidden = false
                alumniPinkGifView.isHidden = true
                noRecordView.isHidden = false
            }
            
            
            cvBottom.reloadData()
            //
            
        }
        
        
        
        
    }
    
    
    
    @IBAction func searchFilter() {
    }
    
    
    
    
}



struct IconItem {
    
    var text      : String!
    var selected  : Bool!
}
class GalleryDeleteGesture : UITapGestureRecognizer {
    var collectionId : Int!
}


class getHomeImgGesture  : UITapGestureRecognizer {
    var img : String!
    var alumniType : Int!
    var getalumniType : Int! = 0
    var getInstType : Int! = 0
    var photoArray = [UIImage]()
    
    var zoomAlumniMedia : [getAlumniEventReferenceMedia] = []
    var zoomInstituteMedia : [getInstituteEventReferenceMedia] = []
    var contributeMedia : [GetContributeReferenceMedia] = []
    var profileImg : String!
    var contributeTitleLbl : String!
    var galleryTitleLbl : String!
    var eventTitleLbl : String!
    
    var gesRedirctType : String!
    var getPhotos : [GetGalleryPhotos] = []
    var getCollectionId : Int!
    var addTitleName : String!
    var deleteID : Int!
}
class HomeRequestGesture : UITapGestureRecognizer {
    
    
    var editdeleteView : UIView!
    var deleteView : UIView!
    var editView : UIView!
    var assistId : Int!
    
    var userName : String!
    var user_id : Int!
    var selectedUserId : Int!
    var designationStr : String!
    
    var userImg : String!
    
    var companyName : String!
    
    var instituteName : String!
    var batch : String!
    
    
    
    
}


