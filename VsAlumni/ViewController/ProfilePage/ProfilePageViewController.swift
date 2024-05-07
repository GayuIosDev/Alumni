//
//  ProfilePageViewController.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper
import ALCameraViewController
import BSImagePicker
import Photos
import AWSCore
import AWSCognito
import AWSS3
import SDWebImage


class ProfilePageViewController: UIViewController, UIScrollViewDelegate {

    
    
    @IBOutlet weak var notificationViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var totalBadgeHeight: NSLayoutConstraint!
    
    @IBOutlet weak var totalBadgesView: UIView!
    
    
    
    
    @IBOutlet weak var logoutTop: NSLayoutConstraint!
    
    @IBOutlet weak var logoutViewHeight: NSLayoutConstraint!
    @IBOutlet weak var changeProfessionalView: UIView!
    
    
    @IBOutlet weak var logoutImg: UIImageView!
    
    
    @IBOutlet weak var appShareView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var schoolNameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var photoView: UIViewX!
    
    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var logoutView: UIView!
    
    
    @IBOutlet weak var changeEmailView: UIView!
    
    
    @IBOutlet weak var notificationView: UIView!
    
    @IBOutlet weak var changePAsswordView: UIView!
    
    
    @IBOutlet weak var editView: UIViewX!
    @IBOutlet weak var changeDetailView: UIView!
    @IBOutlet weak var privacyPolicyView: UIView!
    
    @IBOutlet weak var helpView: UIView!
    
    @IBOutlet weak var faqView: UIView!
    @IBOutlet weak var termsAndConditionView: UIView!
    
    @IBOutlet weak var professionalViewHeight: NSLayoutConstraint!
    @IBOutlet weak var changeProfessionalHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var rateUsView: UIView!
    
    @IBOutlet weak var feedBackView: UIView!
    

    @IBOutlet weak var chngPasswordHeight: NSLayoutConstraint!
    
    
    
    
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr : String! = ""
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    var token : String!
    var imgCountGet : Int  = 1
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    
    var image_choose: Bool = false
    
    
    var termsAndCondition : String!
    var faq : String!
    var help : String!
    var privacyPolicy : String!
    
    var firstName : String!
    var lastName : String!
    var email : String!
    
    var profileImgStr : String!
    var shareLinkStr : String!
    
    var memberType : Int!

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileImg.contentMode = .scaleAspectFill
        profileImg.clipsToBounds = true
        
        scroller.delegate = self
        
        scroller.contentSize = CGSize(width: 100, height: 600) // Example content size
        scroller.isUserInteractionEnabled = true
        scroller.isScrollEnabled = true
        scroller.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)

        
        
        
        let defaults =  UserDefaults.standard
        termsAndCondition = defaults.string(forKey: Constant.DefaultsKeys.TermsAndCondition)
        faq = defaults.string(forKey: Constant.DefaultsKeys.faq)
        help = defaults.string(forKey: Constant.DefaultsKeys.help)
        privacyPolicy = defaults.string(forKey: Constant.DefaultsKeys.privacyPolicy)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)

        lastName = defaults.string(forKey: Constant.DefaultsKeys.lastName)
        shareLinkStr = defaults.string(forKey: Constant.DefaultsKeys.ShareAppLink)
        
        firstName = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        email = defaults.string(forKey: Constant.DefaultsKeys.email)
        overrideUserInterfaceStyle = .light
        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
        print("TokenExp",TokenExp)
        
        
        
        totalBadgeHeight.constant = 0
        notificationViewHeight.constant = 0
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
        
        
//        self.logoutImg.image = UIImage.gif(name: "account_logout")
        if memberType == 1 || memberType == 2 {
            
            schoolNameLbl.text = firstName
        }else{
            schoolNameLbl.text = firstName
//            + lastName
        }
        emailLbl.text = email
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        profileImgStr = defaults.string(forKey: Constant.DefaultsKeys.profileImg)
        
        print("profileImgStrprofileImg",profileImg)
        
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
        
        
//        if profileImgStr != nil {
//            
//            
//            profileImg.sd_setImage(with: URL(string:  profileImgStr!), placeholderImage: UIImage(named: "image 2"))
//        }else{
//            let gifURL = UIImage.gif(name: "empty_profile")
//                      // Use SDWebImage to load and display the GIF image
//
//            profileImg.image = gifURL
////            profileImg.image = UIImage(named: "image 2" )
//        }
        profileImg.layer.cornerRadius = 50
        chngPasswordHeight.constant = 0
        
        changeProfessionalHeight.constant = 0

        print("memberTypememberType",memberType)
        if memberType == 1 || memberType == 2 {
            //
            professionalViewHeight.constant = 350
            logoutTop.constant = 70
            chngPasswordHeight.constant = 0
            changePAsswordView.isHidden = true
            changeProfessionalHeight.constant = 0
            changeProfessionalView.isHidden = true
//            logoutViewHeight.constant = 300
            
            //            createAddView.isHidden = false
                    }else{
                        professionalViewHeight.constant = 450
                        logoutTop.constant = 20

                        changeProfessionalHeight.constant = 50
                        chngPasswordHeight.constant = 50
                        changePAsswordView.isHidden = false
                        changeProfessionalView.isHidden = false

        }
        
     
      
        
        let selectPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        photoView.addGestureRecognizer(selectPhotoGes)
        
        
        let changeProfesionalGes = UITapGestureRecognizer(target: self, action: #selector(changeProfessionalVc))
        changeProfessionalView.addGestureRecognizer(changeProfesionalGes)
        
        let editPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        editView.addGestureRecognizer(editPhotoGes)
        
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        
        let logoutGesture = UITapGestureRecognizer(target: self, action: #selector(logoutVc))
        logoutView.addGestureRecognizer(logoutGesture)
        
        
        let changePaswordGesture = UITapGestureRecognizer(target: self, action: #selector(changePasswordVc))
        changePAsswordView.addGestureRecognizer(changePaswordGesture)
        
        
        
        let changeDetailGesture = UITapGestureRecognizer(target: self, action: #selector(changeDetailVc))
        changeDetailView.addGestureRecognizer(changeDetailGesture)
        
        
        
        
        let notificationGesture = UITapGestureRecognizer(target: self, action: #selector(NotificationVc))
        notificationView.addGestureRecognizer(notificationGesture)
        
        
        
        
        let privacyPolicyGesture = UITapGestureRecognizer(target: self, action: #selector(PrivacyPolicyVc))
        privacyPolicyView.addGestureRecognizer(privacyPolicyGesture)
        
        
        
        let faqGesture = UITapGestureRecognizer(target: self, action: #selector(faqVc))
        faqView.addGestureRecognizer(faqGesture)
        
        
        
        
        let helpGesture = UITapGestureRecognizer(target: self, action: #selector(helpVc))
        helpView.addGestureRecognizer(helpGesture)
        
        
        
        
        let termsAndConditionGesture = UITapGestureRecognizer(target: self, action: #selector(TermsAndConditionVc))
        termsAndConditionView.addGestureRecognizer(termsAndConditionGesture)
        
        
        let appShareGesture = UITapGestureRecognizer(target: self, action: #selector(shareLink))
        appShareView.addGestureRecognizer(appShareGesture)
        
        
        
        let feedBackGesture = UITapGestureRecognizer(target: self, action: #selector(feedBackVc))
        feedBackView.addGestureRecognizer(feedBackGesture)
        
        
        let rateusGesture = UITapGestureRecognizer(target: self, action: #selector(rateUsVc))
        rateUsView.addGestureRecognizer(rateusGesture)
        
        
//        
        let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
        zoomGest4.getInstType = 4
        zoomGest4.profileImg = profileImgStr
        photoView.addGestureRecognizer(zoomGest4)


    }
    
    @IBAction func shareLink() {
        if let urlStr = NSURL(string: shareLinkStr) {
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
    
    
    @IBAction func zoomVc(ges : getImgGesture) {
        print("imgzomm")
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
               let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.img
        print("ges.getalumniType",ges.getalumniType)
        print("ges.getInstType",ges.getInstType)

        viewController.getEventInst = ges.getInstType
        viewController.redirectType = "Profile"
        viewController.profileImg = profileImgStr

        print("ges.img",ges.img)
        self.present(viewController, animated: true)
    }
    
    
    
    
    @IBAction func clickSelectPhoto () {
        
        let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
        
        for i in ["Gallery","Camera"] {
            
            alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
            
        }
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    @IBAction func backVc() {
        
        dismiss(animated: true)
        
    }
    
    @IBAction func logoutVc() {
        
        var refreshAlert = UIAlertController(title: "Logout", message: "Are you sure want to logout", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("token",token)
            
            LogoutCredentialRequest.call_request(param: "",token: token ) {
                
                [self] (res) in
                
                let logoutRes : LogoutCredentialResponse = Mapper<LogoutCredentialResponse>().map(JSONString: res)!
                print("logoutRes.status",logoutRes.status)
                
                
                
                
                if Constant.DefaultsKeys.TokenExpire == 401{
                    
                    
                    
                    
                    var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                        
                        PreferencesUtil.removePrefs(key: Constant.LoginResponse)
                        
                        UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
                            
                            let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                            self.present(viewController, animated: true)
                            
                        }
                    }))
                    
                    present(refreshAlert, animated: true, completion: nil)
                    
                }else{
                    
                    
                    
                    if logoutRes.status == true {
                        
                        PreferencesUtil.removePrefs(key: Constant.LoginResponse)
                        
                        UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
                            let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                            self.present(viewController, animated: true)
                        }
                        
                    }else{
                        let alert = UIAlertController(title: "Alert", message: logoutRes.message, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }
                    
                }
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            
            
            
            
            
            
            
            
            
            
            
        
        
        
        
       
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
                      self.profileImg.image = self.photoArray[0]
                      let defaults =  UserDefaults.standard
                      print("self.photoArray[0]",self.photoArray[0])

//                      defaults.removeObject(forKey: Constant.DefaultsKeys.photoArray)

//                      defaults.se

//                      defaults.set(self.photoArray[0], forKey: Constant.DefaultsKeys.photoArray)
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
            
            self!.profileImg.image = image!
          
          
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
                
                         print("ProfilepathImg",PicsLocalPath)

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
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear122")
        let defaults =  UserDefaults.standard

        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)

        lastName = defaults.string(forKey: Constant.DefaultsKeys.lastName)

        
        firstName = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        email = defaults.string(forKey: Constant.DefaultsKeys.email)
        if memberType == 1 || memberType == 2 {
            schoolNameLbl.text = firstName
           
        }else{
            schoolNameLbl.text = firstName + " " + lastName
        }
//
    emailLbl.text = email
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear11")
        let defaults =  UserDefaults.standard
//       
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)

        lastName = defaults.string(forKey: Constant.DefaultsKeys.lastName)

        
        firstName = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        email = defaults.string(forKey: Constant.DefaultsKeys.email)
        
        
        if memberType == 1 || memberType == 2 {
            schoolNameLbl.text = firstName
            //
        }else{
            schoolNameLbl.text = firstName + " " + lastName
        }
    emailLbl.text = email
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
        
        //  let imageURL = Bundle.main.url(forResource: "lock_icon", withExtension: ext)!
        
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
                    
                    
                    
                    
                    
                    
                    let profileModal = ProfileSettingChangeProfilePictureModal()
                    profileModal.profile_pic = imageStr
                    
                    
                    var  profileModalStr = profileModal.toJSONString()
                    print("profileModalStr",profileModal.toJSON())
                    print("token",token)
                    ProfileSettingChangeProfileDetailRequest.call_request(param: profileModalStr!,token: token) {
                        
                        [self] (res) in
                        
                        let profileRes : ProfileSettingChangeProfilePictureResponse = Mapper<ProfileSettingChangeProfilePictureResponse>().map(JSONString: res)!
                        
                        print("profileRes.status",profileRes.status)
                        if profileRes.status == true {
                            let alert = UIAlertController(title: "", message: profileRes.message, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
//                                let loginRes : LoginCredentialAlumniResponse = Mapper<LoginCredentialAlumniResponse>().map(JSONString: res)!
//                                print("loginRes.status",loginRes.status)
//                                if loginRes.status == true {
//                                    PreferencesUtil.saveToPrefs(key: Constant.LoginResponse, value: res)
                                    let userdefault = UserDefaults.standard
                                    userdefault.set(imageStr, forKey: Constant.DefaultsKeys.profileImg)
//                                    let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
//                                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
//                                    self.present(viewController, animated: true)
                        }else{
                            let alert = UIAlertController(title: "Alert", message: profileRes.message, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                            }
                            
                            
                           
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    let imageDicthome = NSMutableDictionary()
                    imageDicthome["path"] = absoluteString
                    imageDicthome["type"] = "PDF"
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
    
    
    
    
    
    
    
    
    @IBAction func changePasswordVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
        viewController.ChangeEducationalDetail = 1
//        viewController.token = schoolRegRes.token
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func changeDetailVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "ChangeDetailStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ChangeDetailViewController
//         viewController.titlen = "Change Details"
//        viewController.token = schoolRegRes.token
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func NotificationVc() {
        
        
        
        
//        let storyboard = UIStoryboard(name: "ProfileRedirectStoryboard", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController() as! ProfileRedirectViewController
//        viewController.title = "Change Password"
////        viewController.token = schoolRegRes.token
//        self.present(viewController, animated: true)
    }
    
    
    @IBAction func PrivacyPolicyVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "ProfileRedirectStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ProfileRedirectViewController
        viewController.titleName = "Privacy Policy"
        viewController.webUrl = privacyPolicy
        self.present(viewController, animated: true)
    }
    
    @IBAction func TermsAndConditionVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "ProfileRedirectStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ProfileRedirectViewController
        viewController.titleName = "Terms And Condition"
        viewController.webUrl = termsAndCondition
        self.present(viewController, animated: true)
    }

    
    
    @IBAction func feedBackVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "FeedBackStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! FeedBackViewController
//        viewController.titleName = "Feed Back"
//        viewController.webUrl = termsAndCondition
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func rateUsVc() {
        
        
        
        
     let vc  = RateUSViewController(nibName: nil, bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    
    @IBAction func faqVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "ProfileRedirectStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ProfileRedirectViewController
        viewController.titleName = "Faq"
        viewController.webUrl = faq
        self.present(viewController, animated: true)
    }
    
    
    @IBAction func helpVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "ProfileRedirectStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ProfileRedirectViewController
        viewController.titleName = "Help"
        viewController.webUrl = help
        self.present(viewController, animated: true)
    }
    
    
    
    @IBAction func changeProfessionalVc() {
        
        
        
        
        let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
        viewController.ChangeProfessionalDetail = 1
//        viewController.webUrl = help
        self.present(viewController, animated: true)
    }
    
    
}
