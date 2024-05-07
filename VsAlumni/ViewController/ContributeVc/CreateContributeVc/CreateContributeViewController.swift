//
//  CreateContributeViewController.swift
//  VsAlumni
//
//  Created by admin on 28/01/24.
//

import UIKit
import AWSS3
import ALCameraViewController
import BSImagePicker
import Photos
import AWSCore
import AWSCognito
import AWSS3
import ObjectMapper
import DropDown
import KRProgressHUD


class CreateContributeViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var goLiveSaveFullView: UIView!
    
    @IBOutlet weak var saveGoliveViewTop: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var bulletShowViewTopConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var selChangeImgHeight: NSLayoutConstraint!
    @IBOutlet weak var imgShowChaneView: UIView!
    
    
    
    @IBOutlet weak var bulletShowViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var rupeeDollarTextField: UILabel!
    
    @IBOutlet weak var bulletFullView: UIView!
    
    
    @IBOutlet weak var fromToDateView: UIView!
    
    @IBOutlet weak var newBulletHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var rupeeDollarView: UIView!
    
    @IBOutlet weak var newBulletView: UIView!
    
    @IBOutlet weak var rupeeDollarWidth: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var supportReqLbl: UILabel!
    
    @IBOutlet weak var amountVolunteerView: UIViewX!
    @IBOutlet weak var amountVolunteerWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var gifImg2: UIImageView!
    
    
    @IBOutlet weak var gifView: UIView!
    
    
    @IBOutlet weak var date_picker: UIDatePicker!
    @IBOutlet weak var cancelView: UIView!
    
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var okView: UIView!
    
   
    @IBOutlet weak var GoLiveView: UIViewX!
    @IBOutlet weak var bulletShowView: UIView!
    @IBOutlet weak var bulletShowViewTop: NSLayoutConstraint!
    @IBOutlet weak var contributeTv: UITableView!
    @IBOutlet weak var changeImgView: UIView!
    @IBOutlet weak var selUploadView: UIView!
    @IBOutlet weak var apiOkView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var countlabel: UILabel!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var descLbl: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveView: UIViewX!
    @IBOutlet weak var imgListView: UIView!
    @IBOutlet weak var volunteerView: UIViewX!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var dateViewTop: NSLayoutConstraint!
    @IBOutlet weak var VolunteerDonorTextField: UILabel!
    @IBOutlet weak var changeImageView: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var selUploadImg: UIImageView!
    @IBOutlet weak var addAttachView: UIView!
    @IBOutlet weak var activeFromView: UIView!
    @IBOutlet weak var activeToview: UIView!
    @IBOutlet weak var toDateLbl: UILabel!
    @IBOutlet weak var dromDatebl: UILabel!
    @IBOutlet weak var apiResponseLbl: UILabel!
    @IBOutlet weak var startTimeView: UIView!
    @IBOutlet weak var supportReqView: UIView!
    @IBOutlet weak var gifImg: UIImageView!
    @IBOutlet weak var supportReqTextField: UITextField!
    @IBOutlet weak var startTimeLBl: UILabel!
    @IBOutlet weak var endTimeView: UIView!
    @IBOutlet weak var imgListHeight: NSLayoutConstraint!
    @IBOutlet weak var endTimeLBl: UILabel!
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var bulletScrollView: UIScrollView!
    
    @IBOutlet weak var addViewTop: NSLayoutConstraint!
    var bulletPoints : [String]!
    var bulletStrArr : [String] = []
    var overBulletStrArr : [String] = []
    var imgCountGet : Int  = 4
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr : [String] = []
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    var image_choose: Bool = false
    var drop_down = DropDown()
    var display_date : String!
    var url_date : String!
    var rowListId = [1]
    var strtDate : String!
    var endDate : String!
    var supportStr : [String] = []
    var supportContentStr : [String] = []
    var supportIdArr : [Int] = []
    var supportId : Int!
    var token : String!
    
    var getSelectedImg : [String] =  []
    var text1 = UITextField()
    var TextView: [UITextView] = []
    var textFields: [UITextView] = []
    var imgs: [UIImageView] = []
    var Btnss: [UIButton] = []
    var newTextField = UITextView()
    var textFieldData = [String]()
    var tags = 0
    
    var contributeSupportData : [GetContributeSupportListData] = []
    var CreateContributeObj : [ContributeReferenceMedia] = []

    let rowIdentifier = "CreatBulletPointTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selUploadImg.contentMode = .scaleAspectFill
        selUploadImg.clipsToBounds = true
        
        scroller.delegate = self
        newTextField.delegate = self
        
        scroller.contentSize = CGSize(width: 100, height: 1200) // Example content size
        scroller.isUserInteractionEnabled = true
        scroller.isScrollEnabled = true
        scroller.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)

        
        print("CREATECONTRIBUTESCREEN")

        bulletScrollView.delegate = self
        
        bulletScrollView.contentSize = CGSize(width: 100, height: 250) // Example content size
        bulletScrollView.isUserInteractionEnabled = true
        bulletScrollView.isScrollEnabled = true
        bulletScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)

        
        gifView.isHidden = true
        gifImg2.isHidden = true
        
//        dateView.isHidden = true
        supportReqTextField.delegate = self
        
        selChangeImgHeight.constant = 0
        
        saveView.isHidden  = true
        supportReqTextField.keyboardType = .numberPad
        supportReqView.isHidden = false
        countlabel.isHidden = true
        let defaults = UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        print("token",token)
        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
        print("TokenExp",TokenExp)
//        if TokenExp == "401" {
//            var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)
//
//            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
//                print("Handle Ok logic here")
//               
//                print("token",token)
//                
//                
//                UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
//                
//                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
//                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
//                self.present(viewController, animated: true)
//                
//            
//                                                 }))
//            
//            
//            
//            present(refreshAlert, animated: true, completion: nil)
//            
//        }
        
        
        
        
      
        titleTextField.delegate = self
        descLbl.delegate = self
//        supportReqTextField.delegate = self
        
        let selectPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        addAttachView.addGestureRecognizer(selectPhotoGes)
        
        getContributrSupport()

//        rupeeDollarTextField.text  = "Rupee"
        changeImgView.isHidden = true
        
        let fromDateGesture = UITapGestureRecognizer(target: self, action: #selector(fromDate))
        activeFromView.addGestureRecognizer(fromDateGesture)
        
        rupeeDollarTextField.text = "Rupee"
        let rupeeDollarGesture = UITapGestureRecognizer(target: self, action: #selector(pickDollarRupee))
        rupeeDollarView.addGestureRecognizer(rupeeDollarGesture)
        
        
//        let addGesture = UITapGestureRecognizer(target: self, action: #selector(addViewList))
//        addView.addGestureRecognizer(addGesture)
        
        let toDateGesture = UITapGestureRecognizer(target: self, action: #selector(toDate))
        activeToview.addGestureRecognizer(toDateGesture)
        
        let VolunteerGesture = UITapGestureRecognizer(target: self, action: #selector(pickIntrestParticipate))
        volunteerView.addGestureRecognizer(VolunteerGesture)
        
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(dismissVc))
        viewBack.addGestureRecognizer(backGesture)
        
        let saveGesture = contributeDeleteGes(target: self, action: #selector(SaveVc))
        saveGesture.goLiveId = 0
        saveView.addGestureRecognizer(saveGesture)
        
        let goLiveGesture = contributeDeleteGes(target: self, action: #selector(SaveVc))
        goLiveGesture.goLiveId = 1
        GoLiveView.addGestureRecognizer(goLiveGesture)
        
        let goLiveSaveGesture = contributeDeleteGes(target: self, action: #selector(SaveVc))
        goLiveSaveGesture.goLiveId = 1
        goLiveSaveFullView.addGestureRecognizer(goLiveSaveGesture)
        
        
        let okGesture = UITapGestureRecognizer(target: self, action: #selector(clickOk))
        apiOkView.addGestureRecognizer(okGesture)
        
        alertView.isHidden = true
        
//        addDoneButtonOnKeyboard()
        addTextField()
       
        
        let startTimeGes = UITapGestureRecognizer(target: self, action: #selector(startTimeVc))
        startTimeView.addGestureRecognizer(startTimeGes)
        
        let endTimeGes = UITapGestureRecognizer(target: self, action: #selector(endTimeVc1))
        endTimeView.addGestureRecognizer(endTimeGes)
        
        
        let selTimeGes = UITapGestureRecognizer(target: self, action: #selector(changeImageListVc))
        selUploadView.addGestureRecognizer(selTimeGes)
        
        let chngImgGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        changeImgView.addGestureRecognizer(chngImgGes)

        
//        contributeTv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)
//        
//        contributeTv.dataSource = self
//        contributeTv.delegate = self
//        
//        
//        contributeTv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)

        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
             NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
     
                    
                    let addGesture = UITapGestureRecognizer(target: self, action: #selector(addViewList))
                    addView.addGestureRecognizer(addGesture)

        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-200
                print("keyboardSize.height2345678",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    func addDoneButtonOnKeyboard( text: UITextView!){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

      
        
            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        supportReqTextField.inputAccessoryView = doneToolbar
        text.inputAccessoryView = doneToolbar
//        newTextField.inputAccessoryView = doneToolbar
       
        
        
        
        }

    @objc func doneButtonAction(text : UITextView!){
            supportReqTextField.resignFirstResponder()
            newTextField.resignFirstResponder()
        
//        newTextField.resignFirstResponder()
           
        }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    
    
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
            if textField.text == "\n" {
                
               
             

    //            eventNameLbl.selectedTextRange = eventNameLbl.textRange(from: eventNameLbl.beginningOfDocument, to: eventNameLbl.beginningOfDocument)
                newTextField.resignFirstResponder()
                return false
            }
            return true
        }
    
    @IBAction func changeImageListVc() {
        
        let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
        
        changeImgView.isHidden = false
//        bulletShowViewTop.constant = 300

        print("photoArray.count",photoArray.count)
        
        viewController.photoArray = photoArray
        viewController.getSelectedImg =  Constant.DefaultsKeys.galleryGetSelectedImg
            
        self.present(viewController, animated: true)
        
        
    }
    
    @IBAction func clickOk() {
        
        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
      let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
      self.present(viewController, animated: true)
    }
    
    @IBAction func startTimeVc() {
            print("startTimeVc")
            if dromDatebl.text != "Active from:" {

              
                
                RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
                    
                    self?.display_date = today_date.dateString("hh:mm:a")

                    self!.startTimeLBl.text = today_date.dateString("hh:mm:a")
                    
                })
            }else{
                        view.makeToast("Please Select From Date")
                    }
            
        }
        
        
        
        
        @IBAction func endTimeVc1() {
            print("bbb")
            
    //        if self.startTimeLBl.text!  == self.endTimeLBl.text! && self.endTimeLBl.text! == "Time" {
            if startTimeLBl.text != "Time" {

                
                print("working")
                
                
                
                if toDateLbl.text == dromDatebl.text{
                    
                    
                    RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
                        
                        self?.display_date = today_date.dateString("hh:mm:a")

                        self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
                        
                        
                        
                        if self!.startTimeLBl.text == self!.endTimeLBl.text{
                            
                            
                            self!.view.makeToast("Please Select valide date")
                            
                            
                                self!.startTimeLBl.text = "Time"
                            self!.endTimeLBl.text = "Time"
                        }
                        
                        else if self!.startTimeLBl.text! > self!.endTimeLBl.text!{
                            
                            self!.view.makeToast("Please Select valide date")
                            
                            
                                self!.startTimeLBl.text = "Time"
                            self!.endTimeLBl.text = "Time"
                            
                        }
                        
                        else{
    //                                       view.makeToast("Please Select From Time")
                           
                           
                           
                           RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
                               
                               self?.display_date = today_date.dateString("hh:mm:a")

                               self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
                               
                       })
                                              
                                              }
                        //            ges.dateLbl.textColor = .black
    //
                    })
    //            }))
    //
    //                          self.present(alert, animated: true, completion: nil)

         
                                       }
                
                
                else{
                    
                    
                    RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
                        
                        self?.display_date = today_date.dateString("hh:mm:a")
                        
                        self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
                        
                        
                    })
                    
                }
            
                    
                    
            }else{
                
                
                view.makeToast("Please Select From Time")
            }
                
                
                

    //
                  
        }
    
    @IBAction func dismissVc() {
        dismiss(animated: true)
    }

    @IBAction func clickSelectPhoto () {
        
        imageStr.removeAll()
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
            
            print("gallery")

   clickGallery()
            
        }else if ((action.title!.elementsEqual("Camera"))){
            
            print("camera")

            clickCamera()
            
        }
        else {
                        
            let optionMenu = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            
            self.present(optionMenu, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    @IBAction func clickCamera() {
        
        let camera_controller = CameraViewController
        
       
        { [weak self] image, asset in
            self!.photoArray.append(image! as UIImage)
            //
            
            
            
            
            self!.getImageURL(images: self!.photoArray)
           
            self!.selUploadImg.image = image!
//            self!.bulletShowViewTop.constant = 170

            self!.selChangeImgHeight.constant = 170

          

            self?.dismiss(animated: true, completion: nil)

        }

        present(camera_controller, animated: true, completion: nil)

    }
    
    
    @IBAction func clickGallery() {
        photoArray.removeAll()
        SelectedAssets.removeAll()
        arrSelectedFilePath.removeAll()
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
                selChangeImgHeight.constant = 170

                
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
                    
                    imageStr.append(absoluteString)
                    Constant.DefaultsKeys.galleryGetSelectedImg.append(absoluteString)
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
//
            return nil
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
                      self.selUploadImg.image = self.photoArray[0]
//                      bulletShowViewTop.constant = 170
                      changeImgView.isHidden = false
                      
                      
                      print("SelectedAssets",SelectedAssets.count)
                      if photoArray.count == 1 ||  photoArray.count == 0{
                                                
                                                
                                                countlabel.isHidden = true
                                                
                                            }
                                            else{
                                                
                                                countlabel.isHidden = false
                                                countlabel.text = "+" + String(photoArray.count-1)
                                                
                                            }
                      
                     
                  }
                  

                 
//             print("photoArray.count" ,photoArray.count)
//
//                 print("photoArray.count" ,photoArray.count)
                
              }

//              print("complete phto array \(self.photoArray)")

        getImageURL(images: photoArray)
          }
    
    
    
    @IBAction func fromDate() {

          print("fromDate")
        
            var todaysDate = NSDate()
           

            
            startTimeLBl.text = "Time"
        endTimeLBl.text = "Time"
            toDateLbl.text = "Active To:"
            
            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date,style: .Inline, didSelectDate: {[weak self] (today_date) in
                self?.display_date = today_date.dateString("dd-MM-yyyy")
                self?.url_date = today_date.dateString("yyyy-MM-dd")
                self?.dromDatebl.text =  self!.display_date
                self?.strtDate = self!.display_date
                self?.dromDatebl.textColor = .black
                
            })
            
        }
        
        
        @IBAction func toDate() {

            if dromDatebl.text != "Active from:" {
                
                var todaysDate = NSDate()

                
                
             
            endTimeLBl.text = "Time"
            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date ,style: .Inline, didSelectDate: {[weak self] (today_date) in
                
                self?.display_date = today_date.dateString("dd-MM-yyyy")
                self?.url_date = today_date.dateString("yyyy-MM-dd")
                self?.toDateLbl.text =  self!.display_date
                self?.endDate = self!.display_date
                self?.toDateLbl.textColor = .black
               })
                
                
            }else{
                view.makeToast("Please Select From Date")
            }
        
        }
    
    @IBAction func pickIntrestParticipate() {

        drop_down.dataSource = supportStr
        drop_down.anchorView = volunteerView
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
          
            
            if item == "Fund Raising" {
                
                rupeeDollarView.isHidden = false
                rupeeDollarWidth.constant = 120
                amountVolunteerWidth.constant = 200
                
            }else{
                
                rupeeDollarView.isHidden = true
                rupeeDollarWidth.constant = 0
                amountVolunteerWidth.constant = 300
                
            }
            
            supportReqTextField.placeholder = supportContentStr[index]
supportId = supportIdArr[index]
            supportReqView.isHidden = false
//            supportReqTextField.placeholder = supportContentStr[index]
//            supportReqLbl.text = supportContentStr[index]
          
        }

       
      
           
//        }
    }
    

    
    
    
    @IBAction func getContributrSupport() {
        
        
     
        print("token",token)
        SupportListRequest.call_request(token: token){ [self]
            (res) in
            
            let contributeModalRes : getContributeSupportList = Mapper<getContributeSupportList>().map(JSONString: res)!
            
            if contributeModalRes.status == true {
                
                contributeSupportData = contributeModalRes.data
                supportId = contributeModalRes.data[0].id
                for i in contributeModalRes.data {
                    supportStr.append(i.supportName)
                  
                    VolunteerDonorTextField.text = contributeModalRes.data[0].supportName
                    supportReqTextField.placeholder = contributeModalRes.data[0].content
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
    
    
    
    
    
    @IBAction func SaveVc(ges : contributeDeleteGes) {
        
        if VolunteerDonorTextField.text != "" && titleTextField.text != "" && descLbl.text != ""  && dromDatebl.text != "Active From:" && toDateLbl.text != "Active To:" && supportReqTextField.text != "" && startTimeLBl.text != "Time" && endTimeLBl.text  != "Time" {
        
        let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
        
        
        
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                
                
                
                
                
                
                if photoArray.count == 0 {
                    
                    KRProgressHUD.show()
                }else{
                    
                    gifView.isHidden = false
                    gifImg2.isHidden = false
                    self.gifImg2.image = UIImage.gif(name: "cloud_file_uploading")
                    
                    getImageURL(images: photoArray)
                }
              
                
               
                
                
                
               
                
//                if imageStr.count < 0 {
//                    
//                    KRProgressHUD.dismiss()
//                    gifView.isHidden = false
//                    gifImg2.isHidden = false
//    //                self.gifImg2.image = UIImage.gif(name: "cloud_file_uploading")
//
//    //                KRProgressHUD.show()
//                    
//                    
//                    let gifURL = UIImage.gif(name: "cloud_file_uploading")
//                              // Use SDWebImage to load and display the GIF image
//                    gifImg2.image = gifURL
//                    
//                }else{
//                    gifView.isHidden = true
//                    gifImg2.isHidden = true
//                }
//                
                
                
                
                
                DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                    
                    
                    
                    KRProgressHUD.dismiss()
                  
                    
                    
                    print("photosAryyass",photoArray.count)
                    print("ImageAwsCousss",imageStr.count)
                    
                    var ModalImagesend : [ContributeReferenceMedia] = []
                    for i in imageStr{
                        
                        
                        
                        let createContributeMediaModal = ContributeReferenceMedia()
                        
                        
                        createContributeMediaModal.url = i
                        createContributeMediaModal.type = "image"
                        
                        
                        
                        ModalImagesend.append(createContributeMediaModal)
                        
//                        if imageStr.count < 0 {
                       //
                       //                    KRProgressHUD.dismiss()
                                           
                                           self.gifImg2.image = UIImage.gif(name: "cloud_file_uploading")
                       
                       //    //                KRProgressHUD.show()
                       //
                       //
                       //                    let gifURL = UIImage.gif(name: "cloud_file_uploading")
                       //                              // Use SDWebImage to load and display the GIF image
                       //                    gifImg2.image = gifURL
                       //
                       //                }else{
                       //                    gifView.isHidden = true
                       //                    gifImg2.isHidden = true
                       //                }
                       //
                        
                    }
                    
                    
                   
                    
//                    for textField in textFieldData {
//                      
//                            textFieldData.append(text)
//                        
//                    }
                    
                    
//                    textFieldData.removeLast()
                    print("SaveTextFieldData",textFieldData)
                    
                    let createContributeModal = CreateContributeModal()
                    
                    createContributeModal.title = titleTextField.text
                    createContributeModal.description = descLbl.text
                    createContributeModal.active_from = strtDate
                    createContributeModal.active_to = endDate
                    
                    createContributeModal.support_type = supportId
                    createContributeModal.no_required = supportReqTextField.text
                    createContributeModal.publish_scheduled_on = strtDate
                    createContributeModal.is_published = ges.goLiveId
                    createContributeModal.bullet_points = textFieldData
                    
                    createContributeModal.reference_media = ModalImagesend
                    
                    
                    
                    
                    var  createContributeModalStr = createContributeModal.toJSONString()
                    print("createContributeModalStr",createContributeModal.toJSON())
                    CreateContributeRequest.call_request(param: createContributeModalStr!, token: token) {
                        
                        [self] (res) in
                        
                        let createContributeRes : ContributeResponse = Mapper<ContributeResponse>().map(JSONString: res)!
//                        
//                       
                        if createContributeRes.status == true {
                            
                            
                            //                    let alert = UIAlertController(title: "", message: ceateGalleryRes.message, preferredStyle: UIAlertController.Style.alert)
                            //                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                            //
                            
                            gifView.isHidden = true
                            gifImg2.isHidden = true
                            
                            
                            
                            
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.gifImage = "success"
                            viewController.messageResponse = createContributeRes.message
                           
                            viewController.EventRedirect = "FUND RAISING"
//                            KRProgressHUD.dismiss()
                            self.present(viewController, animated: true)
                            //
                           
                        }else{
//
                            
                            gifView.isHidden = true
                            gifImg2.isHidden = true
                            
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.gifImage = "failure"
                            viewController.messageResponse = createContributeRes.message
                            viewController.EventRedirect = "FUND RAISING"
//                            KRProgressHUD.dismiss()
                          
                            self.present(viewController, animated: true)
                        }
                        
                        
                        
                    }
                    
                    
                }
                
            }))
            
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                
                print("Handle Cancel Logic here")
                
            }))
            
            
            
            present(refreshAlert, animated: true, completion: nil)
        
        }else{
            let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
               
        
        
    }
    
    
    
//    @IBAction func addViewList(){
//        tags += 1
//        addTextField()
//        print("rowListId",rowListId)
//
////        contributeTv.dataSource  = self
////
////        contributeTv.delegate = self
////
////        
////
////        contributeTv.reloadData()
//
//    }
//    
//    
//    func addTextField() {
//        
//        
//        
//        let newTextField = UITextField(frame: CGRect(x: 50, y: textFields.count * 40 + 10, width: 270, height: 30))
//              newTextField.borderStyle = .roundedRect
//        bulletShowView.addSubview(newTextField)
//        bulletShowViewTopConstraints.constant = CGFloat(textFields.count * 50 + 50)
//        addViewTop.constant = CGFloat(textFields.count * 50 + 20)
//
//        newTextField.delegate = self
//              textFields.append(newTextField)
//        
//        
//        let imageView = UIImageView()
//                
//                // Set the image for the UIImageView
//                imageView.image = UIImage(named: "tick")
//        imageView.tintColor = .green
//                // Optionally, set content mode for the image view
//                imageView.contentMode = .scaleAspectFit
//                
//                // Set the frame for the UIImageView
//                imageView.frame = CGRect(x: 20, y: imgs.count * 40 + 10, width: 20, height: 20)
//        bulletShowViewTopConstraints.constant = CGFloat(imgs.count * 50 + 50)
//        addViewTop.constant = CGFloat(imgs.count * 50 + 20)
//                // Add UIImageView to the view hierarchy
//                self.bulletShowView.addSubview(imageView)
//        
//        imgs.append(imageView)
//        
//        
//        
//        
////        bulletScrollView.delegate = self
////        
////        bulletScrollView.contentSize = CGSize(width: 100, height: 100 + 20) // Example content size
////        bulletScrollView.isUserInteractionEnabled = true
////        bulletScrollView.isScrollEnabled = true
////        bulletScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
//
//        
//        let button = UIButton(type: .system)
//               
//               // Set button title
//               button.setTitle("Tap Me", for: .normal)
//               
//               // Set title color
//               button.setTitleColor(.white, for: .normal)
//        button.tag = tags
//        
//               // Set background color
////               button.backgroundColor = .blue
//               
//               // Add action for button tap
//               button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//               
//               // Set the frame for the button
//        button.frame = CGRect(x: 335, y: Btnss.count * 40 + 10, width: 20, height: 20)
//        bulletShowViewTopConstraints.constant = CGFloat(Btnss.count * 50 + 50)
//        addViewTop.constant = CGFloat(Btnss.count * 50 + 20)
//        button.setImage(UIImage(named: "cross"), for: .normal)
//        button.tintColor = .black
//               // Add UIButton to the view hierarchy
//               self.bulletShowView.addSubview(button)
//        Btnss.append(button)
//        
//    }
//    
//
////            
////            
//           
//        //
//          
//        //
//           
//
//
//
//
    
    
    
    
    
    
    
    @IBAction func addViewList(){
        
        
        
        
        print("tagsssssssssfedsaz",tags)
        
        
        if tags == -1{
            
            
         
            
            
                
                tags += 1
                
                
                
                addTextField()
                
                
                
            
            
        }
        
        else{
            
            if  textFields[tags].text == ""{
                
                
                
                
                
                
                
            }
            
            
            
            else{
                
                tags += 1
                
                
                
                addTextField()
                
                
                
            }
            
        }
        
        
    }
        

        func addTextField() {

            
           
          
                   
                         newTextField = UITextView(frame: CGRect(x: 50, y: textFields.count * 40 + 25, width: 270, height: 30))

            //                  newTextField.borderStyle = .roundedRect

                        newTextField.layer.borderWidth = 0.3
                        
           
            
                        newTextField.layer.borderColor = UIColor .lightGray .cgColor
                        bulletShowView.addSubview(newTextField)
                        
                        
                        
                        
                      
            //            bulletShowViewTopConstraints.constant = CGFloat(textFields.count * 50 + 50)
                        bulletShowViewHeight.constant = CGFloat(textFields.count * 40 + 50)
                        saveGoliveViewTop.constant = CGFloat(textFields.count * 3 + 5)
                              addViewTop.constant = CGFloat(textFields.count * 7 + 25)
                      //

                        newTextField.delegate = self

                              textFields.append(newTextField)

                      
                       
                    print("textFields.text.count",textFields)
                        
                      
                       
                        
//                        for textField in textFields {
//            //                if let textF = textField.text {
//            //                    textFieldData.append(textF)
//            //
//            //                    text1.text = textF
//                                
//                                if textField.text != "" {
//                                    let addGesture = UITapGestureRecognizer(target: self, action: #selector(addViewList))
//                                    addView.addGestureRecognizer(addGesture)
//                                              print("newTextField.text. ISEmpty")
//                                          }else{
//                                              
//                                             
//                                              print("newTextField.Added")
//                                          }
//                                
//                                
//                              
//                              
//                            
//                        }
//                        
                        
                        
                        
            //

                        let imageView = UIImageView()

                                

                                // Set the image for the UIImageView

                                imageView.image = UIImage(named: "tick")

                        imageView.tintColor = .green

                                // Optionally, set content mode for the image view

                                imageView.contentMode = .scaleAspectFit

                                

                                // Set the frame for the UIImageView

                                imageView.frame = CGRect(x: 20, y: imgs.count * 40 + 25, width: 20, height: 20)

                                

                                // Add UIImageView to the view hierarchy

                                self.bulletShowView.addSubview(imageView)

                        

                        imgs.append(imageView)

                        

                        let button = UIButton(type: .system)

                               

                               // Set button title

                               button.setTitle("Tap Me", for: .normal)

                               

                               // Set title color

                               button.setTitleColor(.white, for: .normal)

                        button.tag = tags

                        

                               // Set background color

                //               button.backgroundColor = .blue

                               

                               // Add action for button tap

                               button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

                               

                               // Set the frame for the button

                        button.frame = CGRect(x: 335, y: Btnss.count * 40 + 25, width: 20, height: 20)
                        button.setImage(UIImage(named: "cross"), for: .normal)

                        button.tintColor = .black

                               // Add UIButton to the view hierarchy

                               self.bulletShowView.addSubview(button)

                        Btnss.append(button)

           
            
            addDoneButtonOnKeyboard(text: newTextField)
            

        }

        

       

//    func textViewDidEndEditing(_ textView: UITextView) {
//       
//        
//        
////        print("printssssssssssss",textField.text)
//
//        
//
//        if textView.text == "" {
//
//           
//
//        }else{
//
//            
//
//            if let index = textFields.firstIndex(of: textView), let text = textView.text {
//
////                textFieldData.append(text)   // Update the data array
//
//            }
//
//            
//
//        }
//
//        }
    
    
    
    

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("print1")
        print("textViewDidBeginEditing",textView.text)
        
        
        if textView.text == "" {
            
            
            
            
            
        }else{
            
            
            
            if let index = textFields.firstIndex(of: textView), let text = textView.text {
                
                textFieldData.append(text)   // Update the data array
                
            }
            
            
        }
    }

       func textViewDidEndEditing(_ textView: UITextView) {
           print("print2")
           
           
           print("textViewDidEndEditing",textView.text)
       }
    


    
    
    
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        if textView.text == "" {
//
//            
//
//          
//
//        }else{
//
//            
//
//            if let index = textFields.firstIndex(of: textView), let text = textView.text {
//                textFieldData.append(text)
//                 // Update the data array
//
//            }
//
//            
////            if let text = textView.text, text.count > 2 {
////                // Calculate the index of the third character
////                let thirdIndex = text.index(text.startIndex, offsetBy: 2)
////                
////                // Get the character at the third index
////                let thirdCharacter = text[thirdIndex]
////                textFieldData.append(text)
////                // Print the third character and its index
////                print("Third character: \(thirdCharacter), Index: \(thirdIndex)")
////            } else {
////                // Handle the case where the text view doesn't have enough characters
////                print("Text view doesn't contain enough characters.")
////            }
////            
////            
//            
//            
//            
//            
//            
//
//        }
//
////        searchCloseView.isHidden = true
//
////        print("sarammmad ad fwfad43432432",textField.text)
//
//    }
//
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        
//        
//        
//        
//    }

           




//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        if textView.text == "" {
//
//            
//
//          
//
//        }else{
//
//            
//
//            if let index = textFields.firstIndex(of: textView), let text = textView.text {
//
//                textFieldData.append(text)   // Update the data array
//
//            }
//
//            
//            
////            if let text = textView.text, text.count > 2 {
////                // Calculate the index of the third character
////                let thirdIndex = text.index(text.startIndex, offsetBy: 2)
////                
////                // Get the character at the third index
////                let thirdCharacter = text[thirdIndex]
////                textFieldData.append(text)
////                // Print the third character and its index
////                print("Third character: \(thirdCharacter), Index: \(thirdIndex)")
////            } else {
////                // Handle the case where the text view doesn't have enough characters
////                print("Text view doesn't contain enough characters.")
////            }
////
//            
//
//        }
//
//        return true
//        
//    }


//            func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
////                print("While entering the characters this method gets called")
//
//                
//
//                
//
//               
//
//            }

        

        

        func removeTextField(at index: Int) {

            tags += -1
            
            guard index >= 0 && index < textFields.count else {

                return // Index out of bounds

            }

            let textFieldToRemove = textFields.remove(at: index)

            textFieldToRemove.removeFromSuperview()

            
            addViewTop.constant = -10
            saveGoliveViewTop.constant = -10
//            bulletShowViewHeight.constant =


            let Image = imgs.remove(at: index)

            Image.removeFromSuperview()

            let deletes = Btnss.remove(at: index)

            deletes.removeFromSuperview()

            
            if tags == -1{
                
                textFieldData.removeAll()
            }else{
                
                textFieldData.remove(at: tags)
            }
           

    //        textFieldData

        }


    
//    func removeTextField(at index: Int) {
//        guard index >= 0 && index < textFields.count else {
//            return // Index out of bounds
//        }
//        let textFieldToRemove = textFields.remove(at: index)
//        textFieldToRemove.removeFromSuperview()
//        let Image = imgs.remove(at: index)
//        Image.removeFromSuperview()
//        let deletes = Btnss.remove(at: index)
//        deletes.removeFromSuperview()
//        
       
//    }
    @objc func buttonTapped(_ sender: UIButton) {
           print("Button tapped!",sender.tag)
           // Add your custom action here
        
//        if !textFields.isEmpty {
//                    removeTextField(at: textFields.count - 1)
//                }
        
        
        print("tagsssssss",sender.tag)
        removeTextField(at: sender.tag)
//        deleteTextField()
       }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//            if let index = textFields.firstIndex(of: textField), let text = textField.text {
//                textFieldData[index] = text // Update the data array
//            }
//        textField.delegate = self
//        }
//    func deleteTextField() {
////        guard let lastTextField = textFields.popLast() else {
////                    return
////                }
////                lastTextField.removeFromSuperview()
//
//
//        guard index >= 0 && index < textFields.count else {
//               return // Index out of bounds
//           }
//           let textFieldToRemove = textFields.remove(at: index)
//           textFieldToRemove.removeFromSuperview()
//    }
    
    @IBAction func pickDollarRupee() {
        
        print("pickEstblishYear")
        
        
        
        
            var optionArray = [
                                     "Rupee","Dollar"
                                     ]
//
            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                rupeeDollarTextField.text = item
//    stateId = stateIDArr[index]
              
            }
            
            drop_down.dataSource = optionArray
            drop_down.anchorView = rupeeDollarView
            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
            drop_down.show()
         
            
//        }
        
    }
    
    
    @IBAction  func deleteItem(ges : contributeDeleteGes) {
        

//            
        print("Delete")
        bulletStrArr.remove(at: ges.deleteGest)

//        contributeTv.dataSource = self
//        contributeTv.delegate = self
//            contributeTv.reloadData()

        
        
    }
    
    @objc func handleRegister(_ sender: UIButton){
        
        print("removeerowwsBefore",rowListId.count)
            rowListId.remove(at:sender.tag)

//        rowListId.
        
        print("removeerowwsAfter",rowListId.count)
//
       contributeTv.deleteRows(at:[IndexPath(row:sender.tag,section:0)],with:.none)
       
        }
    
    
    
    
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rowListId.count
//        
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! CreatBulletPointTableViewCell
//
//     
//        cell.selectionStyle =  .none
//
//        bulletStrArr.removeAll()
//        print("bulletList",cell.textField.text)
//        
//        cell.textField.delegate = self
//        print("bulletStrArrCount",bulletStrArr.count)
//        if cell.textField.text != "" {
//            var bulletList : String!
//            bulletList  = cell.textField.text!
//            bulletStrArr.append(bulletList)
//            
//            for i in bulletStrArr {
//                bulletList =   i
//                
//            }
//            
//            overBulletStrArr.append(bulletList)
//        }
//        
//        
//        
//        
//        let uniqueStrings = uniqueElementsFrom(array:overBulletStrArr)
//        print("Unique elements from",uniqueStrings)
//        
//        bulletPoints = uniqueStrings
////
//        print("overBulletStrArr",overBulletStrArr)
//        print("bulletStrArr",bulletStrArr)
//        
//        
//        cell.btns.tag = indexPath.row
//
//        cell.btns.addTarget(self, action:#selector(handleRegister(_:)), for: .touchUpInside)
//
//      
//        return cell
//    }
    
    
    
    func uniqueElementsFrom(array: [String]) -> [String] {
      var set = Set<String>()
      let result = array.filter {
        guard !set.contains($0) else {
          
          return false
        }
        set.insert($0)
        return true
      }
      return result
    }

    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! CreatBulletPointTableViewCell
//
//        let deleteGesture = contributeDeleteGes(target: self, action: #selector(deleteItem))
//        deleteGesture.deleteGest = indexPath.row
//        cell.deleteView.addGestureRecognizer(deleteGesture)
//        
//    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
//        if  textFieldData.count == 0{
//                    
//                    
//                    
//                }
//                
//                else{
//                    tags += 1
////                    addTextField()
//                    print("rowListId",rowListId)
//                    
//                    //        contributeTv.dataSource  = self
//                    //
//                    //        contributeTv.delegate = self
//                    //
//                    //
//                    //
//                    //        contributeTv.reloadData()
//                    
//                }
//        
        
        
        
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return   UITableView.automaticDimension
//    }
//    
    
    
    
    
    @IBAction func datePickAction(_ sender: Any) {
    }
    
    
    
}

class contributeDeleteGes : UITapGestureRecognizer {
    var deleteGest : Int!
    var deleteIndex : Index!
    
  
        
        var goLiveId :  Int!
    



}
