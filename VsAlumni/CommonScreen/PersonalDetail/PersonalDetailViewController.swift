//
//  PersonalDetailViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit
import DropDown
import ObjectMapper
import AWSS3
import ALCameraViewController
import BSImagePicker
import Photos
import AWSCore
import AWSCognito
import AWSS3
//import


class PersonalDetailViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var maritalTextField: UITextField!
    
    
    
    @IBOutlet weak var skipView: UIView!
    
    
    @IBOutlet weak var selectPhotoView: UIView!
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var date_picker: UIDatePicker!
    
    
    @IBOutlet weak var dobView: UIViewX!
    @IBOutlet weak var martialVew: UIViewX!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryView: UIViewX!
    @IBOutlet weak var genderView: UIViewX!
    @IBOutlet weak var imgUploadView: UIViewX!
    @IBOutlet weak var uploadImg: UIImageView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var stateView: UIViewX!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var nextView: UIView!
    
    var image_choose: Bool = false
    var country : [String] = []
    var state : [String] = []
    var stateIDArr : [Int] = []
    var countryId : Int!
    var stateId : Int!
    var countryIdArr : [Int] = []
    
    
    var display_date : String!
    var url_date : String!
    
    var imgCountGet : Int  = 1
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var drop_down = DropDown()
    let picker = UIImagePickerController()
    var state_data : [StateData] = []
    var country_data : [CountryData] = []
  
    var countryNme : String!
    
    var token : String!
   
    var getStateId : Int!
    var userfirstTimeCreate : Int! = 1

    
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr : String! = ""
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    
    
    var userAlreadyCreateAge : String!
    var userAlreadyCreateDob : String!
    var userAlreadyCreateGender : String!
    var userAlreadyCreateAddress : String!
    var userAlreadyCreateMarital : String!
    var userAlreadyCreatCountry : String!

    var userAlreadyCreateState : String!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        overrideUserInterfaceStyle = .light

        ageTextField.delegate = self
        dobTextField.delegate = self
        genderTextField.delegate = self
        addressTextField.delegate = self
        countryTextField.delegate = self
        
     
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextVc))
        nextView.addGestureRecognizer(tapGesture)
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        skipView.isHidden = true
        
        backView.isHidden = true
//        selectPhotoView.isHidden = true
        getCountryList()
        
        let genderGesture = UITapGestureRecognizer(target: self, action: #selector(pickGender))
        genderView.addGestureRecognizer(genderGesture)
        
        let calendarGesture = UITapGestureRecognizer(target: self, action: #selector(pickCalendar))
        dobView.addGestureRecognizer(calendarGesture)
        
        let countryGesture = UITapGestureRecognizer(target: self, action: #selector(pickCountry))
        countryView.addGestureRecognizer(countryGesture)
        
        let stateGesture = UITapGestureRecognizer(target: self, action: #selector(pickState))
        stateView.addGestureRecognizer(stateGesture)
        
        let NextGesture = UITapGestureRecognizer(target: self, action: #selector(uploadPersonalDetail))
        nextView.addGestureRecognizer(NextGesture)
        
        let imgGesture = UITapGestureRecognizer(target: self, action: #selector(imageUpload))
        imgUploadView.addGestureRecognizer(imgGesture)
        
        let maritalGesture = UITapGestureRecognizer(target: self, action: #selector(pickMarital))
        martialVew.addGestureRecognizer(maritalGesture)
        
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        uploadImg.layer.cornerRadius = 60
      
        addDoneButtonOnKeyboard()
        
        
        let skipGesture = UITapGestureRecognizer(target: self, action: #selector(SkipVc))
        skipView.addGestureRecognizer(skipGesture)
        
        print("userfirstTimeCreate",userfirstTimeCreate)
        if userfirstTimeCreate == 1 {
            
          
        }else{
            userAlreadyCreateAge = ageTextField.text
             userAlreadyCreateDob = dobTextField.text
             userAlreadyCreateGender = genderTextField.text
             userAlreadyCreateAddress = addressTextField.text
            userAlreadyCreatCountry = countryTextField.text
            userAlreadyCreateState = stateTextField.text
            userAlreadyCreateMarital = maritalTextField.text

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

        ageTextField.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            ageTextField.resignFirstResponder()
        }
    
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    @IBAction func imageUpload() {
        
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
    
    @IBAction func nextVc() {
        let storyboard = UIStoryboard(name: "EducationalDetailsStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! EducationalDetailsViewController
        self.present(viewController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func pickCalendar() {
        
        
        print("pickCalendar")

       

        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date ,style: .Inline, didSelectDate: {[weak self] (today_date) in
            
            
            self?.display_date = today_date.dateString("dd-M-yyyy")
            self?.url_date = today_date.dateString("yyyy-M-dd")
            self?.dobTextField.text = self!.display_date
            self?.dobTextField.textColor = .black
           })
        
       
    
    }
    
    
    
    @IBAction func pickGender() {

      
        print("pickGender")

        // The view to which the drop down will appear on
        drop_down.anchorView = view // UIView or UIBarButtonItem
        
        // The list of items to display. Can be changed dynamically
       
       
        
        // Action triggered on selection
        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            genderTextField.text = item
        }
        drop_down.dataSource = ["Male", "Female","Others"]
        drop_down.anchorView = genderView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()

    }
    
    @IBAction func pickMarital() {


        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
          maritalTextField.text = item


        }
       
        drop_down.dataSource = ["Married", "Un Married"]
        drop_down.anchorView = genderView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()

       
      

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
   
//                    let defaults = UserDefaults.standard
////                    defaults.set(version_response.order_list_pageSize, forKey: DefaultsKeys.page_size)
//                    let vc = LoginViewController(nibName: nil, bundle: nil)
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                }
            }else{
                
//                _ =  SweetAlert().showAlert(" The request is invalid",subTitle: "",style: .warning,buttonTitle: "OK",buttonColor:.black)
                
            }
        }
        
    }
    
    
    
    @IBAction func pickCountry() {

        print("drop")

//        getCountryList()
        country_data.forEach { (countryName) in

            country.append(countryName.countryName)
            countryIdArr.append(countryName.idCountry)
        }
        
        drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
          countryTextField.text = item

            countryNme = item
            print("index)",countryId)

            countryId = countryIdArr[index]
            
            getStateList()
        
           
        }
       
        drop_down.dataSource = country
        drop_down.anchorView = countryView
        drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
        drop_down.show()

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
          
        }

        drop_down.dataSource = state
        drop_down.anchorView = stateView
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
    
    
    
    @IBAction func SkipVc() {
        let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
        self.present(viewController, animated: true)
    }
    
    
  @IBAction  func uploadPersonalDetail () {
        
      
      
      
      if ageTextField.text != "" && dobTextField.text != "" && genderTextField.text != "" && addressTextField.text !=  "" && stateTextField.text != "" &&  countryTextField.text != ""   {
          
          print("stateTextField.text",stateTextField.text)
          print("countryTextField.text",countryTextField.text)
          
          
          let personalModal = AlumniPersonalDetailModal()
       
          personalModal.profile_pic = imageStr
          personalModal.age = Int(ageTextField.text!)
          personalModal.dob = dobTextField.text
          personalModal.gender = genderTextField.text
          personalModal.address = addressTextField.text
          personalModal.state = stateId
          personalModal.country = String(countryId)
          personalModal.marital = maritalTextField.text
          
          
          var  personalModaStr = personalModal.toJSONString()
          print("personalModaStr",personalModal.toJSONString())
          print("token",token)
          AlumniPersonalDetailRequest.call_request(param: personalModaStr!, token: token) {
              
              [self] (res) in
              
              let personalRes : AlumniPersonalDetailModalResponse = Mapper<AlumniPersonalDetailModalResponse>().map(JSONString: res)!
              print("personalRes.status",personalRes.status)
              
              if personalRes.status == true {
//                  
//                  PreferencesUtil.saveToPrefs(key: Constant.PersonalDetailResponse, value: res)
////                  
////                  let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
////                  let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
////                  viewController.token = token
////                  self.present(viewController, animated: true)
                  let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
                  let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
                  self.present(viewController, animated: true)
//
              }else{
                  let alert = UIAlertController(title: "Alert", message: personalRes.message, preferredStyle: UIAlertController.Style.alert)
                  alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                  self.present(alert, animated: true, completion: nil)
              }
//              
//              
//              
          }
      }else{
          let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    }
    
    
    @IBAction func open_camera(){

       
        
     }

     
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera",preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
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
                  }

             print("photoArray.count" ,photoArray.count)

//              uploadImage(imageData: photoArray[0])


                 print("photoArray.count" ,photoArray.count)
                
              }

              print("complete phto array \(self.photoArray)")

          }
    
//    func uploadImage(imageData : UIImage){
//        print("upload aws")
//        
//            AWSS3Manager.shared.uploadImage(image: imageData, progress: {[weak self] ( uploadProgress) in
//                
//                guard let strongSelf = self else { return }
//                
//            }) {[weak self] (uploadedFileUrl, error) in
//                
//                guard let strongSelf = self else { return }
//                if let finalPath = uploadedFileUrl as? String { // 3
//                    print("Uploaded aws file path",finalPath)
//                    
//                
//                   
//                    
//                   
//                    let userDefault = UserDefaults.standard
//                    
//                } else {
//                    print("\(String(describing: error?.localizedDescription))") // 4
//                }
//            }
//        
//        
//        
//        
//    }
    
    
    
    
    
    
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

        
//        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
//            picker.allowsEditing = false
//            picker.sourceType = UIImagePickerController.SourceType.camera
//            picker.cameraCaptureMode = .photo
//            self!.Selected_Image.image = image!
//            picker.modalPresentationStyle = .fullScreen
//            present(picker, animated: true, completion: nil)
//        }
//        else {
//            noCamera()
//        }
    
    
    
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
    
    
    
    
    
    
}
