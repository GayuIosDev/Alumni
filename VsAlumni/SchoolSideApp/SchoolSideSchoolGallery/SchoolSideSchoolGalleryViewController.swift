//
//  SchoolSideSchoolGalleryViewController.swift
//  VsAlumni
//
//  Created by admin on 14/12/23.
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
import Foundation
import SystemConfiguration
import KRProgressHUD

class SchoolSideSchoolGalleryViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    
    
    @IBOutlet weak var collectionNameTop: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var toDateHideView: UIView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var changeImgView: UIView!
    
    @IBOutlet weak var countlabel: UILabel!
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var gifImg: UIImageView!
    
    @IBOutlet weak var gifView: UIView!
    
    @IBOutlet weak var date_picker: UIDatePicker!
    
    
    
    @IBOutlet weak var alertview: UIViewX!
    
    @IBOutlet weak var alertLbl: UILabel!
    
    @IBOutlet weak var okView: UIView!
    
    
    @IBOutlet weak var view4ShowView: UIView!
    
    @IBOutlet weak var imgListView: UIView!
    
    @IBOutlet weak var ImgColletionView: UIViewX!
    @IBOutlet weak var imgSelectionView: UIView!
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    
    
    @IBOutlet weak var eventNameLbl: UITextView!
    
    @IBOutlet weak var browseView: UIView!
    
    @IBOutlet weak var uploadLbl: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var toDateView: UIView!
    
    @IBOutlet weak var fromDteTextField: UITextField!
    
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var fromDateView: UIView!
    
    
    @IBOutlet weak var uploadImg: UIImageView!
    
    @IBOutlet weak var uploadView: UIView!
    
    @IBOutlet weak var selectPhotoView: UIView!
    
    @IBOutlet weak var selUploadImg: UIImageView!
    

    @IBOutlet weak var changeImageView: UIView!
    
    

    var imgCountGet : Int  = 20
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var getSelectedImg : [String] = []
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr  : [String] = []
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    var image_choose: Bool = false
    
    var CreateInstituteObj : [CreateInstituteGalleryPhotos] = []
    var firstTimeClick : Int!
    
    var display_date : String!
    var url_date : String!
    var token : String!
    
    
    let placeholderText = "Enter Collection Name"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Constant.DefaultsKeys.galleryGetSelectedImg.removeAll()
//        eventNameLbl.becomeFirstResponder()
//
//        eventNameLbl.selectedTextRange = eventNameLbl.textRange(from: eventNameLbl.beginningOfDocument, to: eventNameLbl.beginningOfDocument)
//        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
     
        selUploadImg.contentMode = .scaleAspectFill
        selUploadImg.clipsToBounds = true
        collectionNameTop.constant = 10

        gifView.isHidden = true
        gifImg.isHidden = true
        changeImgView.isHidden = true
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
        

        let fromDateGesture = UITapGestureRecognizer(target: self, action: #selector(fromDate))
        fromDateView.addGestureRecognizer(fromDateGesture)
        
        dateView.isHidden = true
        
        countlabel.isHidden = true
        
        toDateHideView.isHidden = true
        browseView.isHidden = false
        uploadLbl.isHidden = false
        uploadImg.isHidden = false
        let toDateGesture = UITapGestureRecognizer(target: self, action: #selector(toDate))
        toDateView.addGestureRecognizer(toDateGesture)
        
        
        let selectPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        selectPhotoView.addGestureRecognizer(selectPhotoGes)
        
        
        let uploadGes = UITapGestureRecognizer(target: self, action: #selector(uploadgalleryDetail))
        uploadView.addGestureRecognizer(uploadGes)
        
//        ImgColletionView.isHidden = true
//        imgListView.isHidden = true
//        view4ShowView.isHidden = true
//        alertview.isHidden = true

        
//        ImageChangeImageViewController
        eventNameLbl.delegate = self
        fromDteTextField.delegate = self
        toDateTextField.delegate = self
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)
        
        addDoneButtonOnKeyboard()
        
        let selTimeGes = UITapGestureRecognizer(target: self, action: #selector(changeImageListVc))
        changeImgView.addGestureRecognizer(selTimeGes)
        
        
      

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if textView.text == placeholderText {
//            textView.text = ""
////            eventNameLbl.resignFirstResponder()
//        }
//        return true
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = placeholderText
////            eventNameLbl.resignFirstResponder()
//        }
//    }
    
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        if textField.text == "\n" {
            
           
         

//            eventNameLbl.selectedTextRange = eventNameLbl.textRange(from: eventNameLbl.beginningOfDocument, to: eventNameLbl.beginningOfDocument)
            eventNameLbl.resignFirstResponder()
            return false
        }
        return true
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

        eventNameLbl.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            eventNameLbl.resignFirstResponder()
        }
    
    
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        if text == "\n" {
//            
//           
//         
//
////            eventNameLbl.selectedTextRange = eventNameLbl.textRange(from: eventNameLbl.beginningOfDocument, to: eventNameLbl.beginningOfDocument)
//            eventNameLbl.resignFirstResponder()
//            return false
//        }
////        else{
////            eventNameLbl.text = "Enter Collection Name"
////            eventNameLbl.textColor = UIColor.lightGray
////        }
//        
//        
//        
////        collectionViewHeight.constant = CGFloat(eventNameLbl.text.count * 10)
//        return true
//        }

    
    
    
    
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool 
    
    
    
    
    
    
    
    
    
    @IBAction func clickSelectPhoto () {
        
        if firstTimeClick == 1 {
            
            
            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            
            changeImgView.isHidden = false

            collectionNameTop.constant = 60
            viewController.photoArray = photoArray
            viewController.getSelectedImg =  Constant.DefaultsKeys.galleryGetSelectedImg
           
            
    //        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.present(viewController, animated: true)
            
            
         
            
        }else{
            let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
            
            for i in ["Gallery","Camera"] {
                
                alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
                
            }
            
            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            
            
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func changeImageListVc() {
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
    
    

    @IBAction  func uploadgalleryDetail () {
        
        
        print("uploadgalleryDetailimageStr.coun",imageStr.count)
        print("eventNameLbl.coun",eventNameLbl.text.count)
        
        if eventNameLbl.text != "" && imageStr.count != 0 {
//            && fromDteTextField.text != "" && toDateTextField.text != "" {
            
            let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
            
            
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                
                
                gifView.isHidden = false
                gifImg.isHidden = false
//                self.gifImg.image = UIImage.gif(name: "cloud_file_uploading")

                
                
                let gifURL = UIImage.gif(name: "cloud_file_uploading")
                          // Use SDWebImage to load and display the GIF image
                gifImg.image = gifURL
                
                
                getImageURL(images: photoArray)
                
                DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                    
                    
                    
                    
                    
                    
                    var imageModal : [CreateInstituteGalleryPhotos] = []
                    
                    print("photoaryysssss",photoArray.count)
                    print("imageulrssssssss",imageStr.count)
                    for i in Constant.DefaultsKeys.galleryGetSelectedImg{
                        
                        
                        
                        
                        let createGalleryPhotosModal = CreateInstituteGalleryPhotos()
                        
                        createGalleryPhotosModal.url = i
                        createGalleryPhotosModal.gextension = ""
                        createGalleryPhotosModal.resolution = ""
                        createGalleryPhotosModal.tile_type = ""
                        
                        imageModal.append(createGalleryPhotosModal)
                    }
                    let createInstituteGalleryModal = CreateInstituteGalleryModal()
                    
//                    createInstituteGalleryModal.from_date = fromDteTextField.text
//                    createInstituteGalleryModal.to_date = toDateTextField.text
                    createInstituteGalleryModal.collection_name = eventNameLbl.text
                    createInstituteGalleryModal.no_of_photo = imageStr.count
                    createInstituteGalleryModal.photos = imageModal
                    
                    
                    
                    
                    var  ceateGalleryStr = createInstituteGalleryModal.toJSONString()
                    print("ceateGalleryStr",createInstituteGalleryModal.toJSON())
                    CreateInstituteGalleryRequest.call_request(param: ceateGalleryStr!, token: token) {
                        
                        [self] (res) in
                        
                        let ceateGalleryRes : CreateInstituteGalleryResponse = Mapper<CreateInstituteGalleryResponse>().map(JSONString: res)!
                        
                        
                        if ceateGalleryRes.status == true {
                            
                           

                            
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1 
                            viewController.gifImage = "success"
                            viewController.messageResponse = ceateGalleryRes.message
//                            KRProgressHUD.dismiss()
                            gifView.isHidden = true
                            gifImg.isHidden = true
                            self.present(viewController, animated: true)
                            
                            
                            
                            
                        
                            
                            //                            let defaults = UserDefaults.standard
                            //                            defaults.set(schoolRegRes.token, forKey: Constant.DefaultsKeys.token)
                            //                            defaults.set(contactNumberTextfield.text, forKey: Constant.DefaultsKeys.MobileNumber)
                            //                            defaults.set(createPasswordTextField.text, forKey: Constant.DefaultsKeys.Password)
                            //
                            //                            let storyboard = UIStoryboard(name: "OtpGenerateStoryboard", bundle: nil)
                            //                            let viewController = storyboard.instantiateInitialViewController() as! OtpGenerateViewController
                            //                            viewController.type = "institute"
                            //                            viewController.token = schoolRegRes.token
                            //                            self.present(viewController, animated: true)
                            
                        }else{
                            
                            
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.gifImage = "failure"
                            viewController.messageResponse = ceateGalleryRes.message
//                            KRProgressHUD.dismiss()
                            gifView.isHidden = true
                            gifImg.isHidden = true
                            self.present(viewController, animated: true)
//                            let alert = UIAlertController(title: "Alert", message: ceateGalleryRes.message, preferredStyle: UIAlertController.Style.alert)
//                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                            self.present(alert, animated: true, completion: nil)
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
//                      ImgColletionView.isHidden = false
//                      imgListView.isHidden = false
//                      view4ShowView.isHidden = false
                      changeImgView.isHidden = false
                      collectionNameTop.constant = 60
                      firstTimeClick = 1
                      if photoArray.count == 1 ||  photoArray.count == 0{
                                                
                                                
                                                countlabel.isHidden = true
                                                
                                            }
                                            else{
                                                countlabel.isHidden = false
                                                countlabel.text = "+" + String(photoArray.count-1)
                                                
                                            }
                      
                     
                  
                    browseView.isHidden = true
                      uploadLbl.isHidden = true
                      uploadImg.isHidden = true
                    
                  }

             print("photoArray.count" ,photoArray.count)

//              uploadImage(imageData: photoArray[0])


                 print("photoArray.count" ,photoArray.count)
                
              }

              print("complete phto array \(self.photoArray)")

        
        
        getImageURL(images: photoArray)
          }
    
    
    
    
    @IBAction func clickCamera() {
//        selectPhotoView.isHidden = true
        
        let camera_controller = CameraViewController
        
       
        { [weak self] image, asset in

            
            
            self!.photoArray.append(image! as UIImage)
            //
            
            
            
            
            self!.getImageURL(images: self!.photoArray)
            self!.selUploadImg.image = image!
            self!.changeImgView.isHidden = false
            self!.browseView.isHidden = true
            self!.uploadLbl.isHidden = true
            self!.uploadImg.isHidden = true
          
            self?.dismiss(animated: true, completion: nil)

        }

        present(camera_controller, animated: true, completion: nil)

    }
    
    
    @IBAction func clickGallery() {
//        photoArray.removeAll()
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
//                getSelectedImg.append(PicsLocalPath)
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
                    getSelectedImg.append(absoluteString)
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
    
    
    
    
    
    
   
    
    @IBAction func fromDate() {

        var todaysDate = NSDate()
       

        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date,style: .Inline, didSelectDate: {[weak self] (today_date) in
            
            self?.display_date = today_date.dateString("dd-MM-yyyy")
            self?.url_date = today_date.dateString("yyyy-MM-dd")
            self?.fromDteTextField.text = self!.display_date
            self?.fromDteTextField.textColor = .black
           })
    
    }
    
 
    
    @IBAction func toDate() {

        var todaysDate = NSDate()
       

        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date,style: .Inline, didSelectDate: {[weak self] (today_date) in
            
            
            self?.display_date = today_date.dateString("dd-MM-yyyy")
            self?.url_date = today_date.dateString("yyyy-MM-dd")
            self?.toDateTextField.text = self!.display_date
            self?.toDateTextField.textColor = .black
           })
    
    }
    
        
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


            self.view.endEditing(true)


            return false


        }
    
    
    
    
    @IBAction func doneBtn(_ sender: UIButton) {
        
        print("click")
//        calendarView.isHidden = true
//        calanderTopHeight.constant = 0
        
    }
    
    
    
    
    @IBAction func datePicAction(_ sender: UIDatePicker) {
        
        
        print("print \(sender.date)")

               let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "dd/M/yyyy"
               let somedateString = dateFormatter.string(from: sender.date)

           
           toDateTextField.text = somedateString
                  print(somedateString)
           
       
    }
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
    }
    
    
    
    
   
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("false")



        //
        if eventNameLbl.text == "" {
//            eventNameLbl.text = "Enter Collection Name"
            eventNameLbl.textColor = UIColor.black
            eventNameLbl.font = UIFont(name: "verdana", size: 13.0)
//            let selectRecpient = UITapGestureRecognizer(target: self, action: #selector(SelectRepVc))
//            selectRecipientsView.addGestureRecognizer(selectRecpient)

        }
       
    }
    
    
    
    
    
}


                        
