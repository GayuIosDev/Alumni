//
//  EventsWishesAppearedViewController.swift
//  VsAlumni
//
//  Created by admin on 18/10/23.
//

import UIKit
import ALCameraViewController
import BSImagePicker
import Photos
import AWSCore
import AWSCognito
import AWSS3
import ObjectMapper
import AVFoundation
import CoreMedia
import KRProgressHUD
import Alamofire


class EventsWishesAppearedViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextViewDelegate {
    
    
    
    
    @IBOutlet weak var saveLeading: NSLayoutConstraint!
    @IBOutlet weak var pencilHeight: NSLayoutConstraint!
    @IBOutlet weak var changeImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pemcilGalleryView: UIViewX!
    
    @IBOutlet weak var changeView: UIView!
    
    
    @IBOutlet weak var topEventSaveView: UIView!
    
    
    @IBOutlet weak var apiOkView: UIView!
    @IBOutlet weak var progressCountLbl: UILabel!
    @IBOutlet weak var gifImg: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var countlabel: UILabel!
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var imageListShowView: UIView!
    
    @IBOutlet weak var apiResponseLbl: UILabel!
    
    @IBOutlet weak var changeImageView: UIView!
    
    
    @IBOutlet weak var venueTextField: UITextField!
    
    @IBOutlet weak var descTextField: UITextView!
    @IBOutlet weak var eventTitleTextField: UITextView!
    @IBOutlet weak var eventNameTextField: UITextView!
    @IBOutlet weak var progressShowView: UIView!
    @IBOutlet weak var saveLbl: UILabel!
    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var selectPhotoViw: UIView!
    @IBOutlet weak var scheduleLiveView: UIView!
    @IBOutlet weak var goLiveView: UIView!
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var endTimeLBl: UILabel!
    @IBOutlet weak var endDateLbl: UILabel!
    @IBOutlet weak var startTimeLbl: UILabel!
    @IBOutlet weak var startDateLbl: UILabel!
    @IBOutlet weak var date_picker: UIDatePicker!
    @IBOutlet weak var calendarOkView: UIView!
    @IBOutlet weak var endTimeView: UIView!
    @IBOutlet weak var startTimeView: UIView!
    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var calendarCancelView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var endDateView: UIView!
    
    @IBOutlet weak var eventTopBarLbl: UILabel!
    
    
    
    @IBOutlet weak var selectPhotoViewHeight: NSLayoutConstraint!
    @IBOutlet weak var widthselectPhotoView: NSLayoutConstraint!
    
    
    @IBOutlet weak var selPhotoHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var alertView: UIViewX!
    
    @IBOutlet weak var img1CloseView: UIView!
    
    
    @IBOutlet weak var img4CloseView: UIView!
    @IBOutlet weak var img3CloseView: UIView!
    
    @IBOutlet weak var img2CloseView: UIView!
    
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []
    
    var editImgArr : [String] = []
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr :  [String] = []
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    var token : String!
    var imgCountGet : Int  = 4
    var arrSelectedFilePath : [Any] = []
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var editPhotoArray = [UIImage]()
    var getSelectedImg : [String] = []
    var strSubmissionDate = String()
    var image_choose: Bool = false
    
    var createEventReferMedia : [CreateEventReferenceMedia] = []
    var updateEventReferMedia : [UpdateEventReferenceMedia] = []
    
    var VimeoAuthorization : String!
    
    var strTextViewPlaceholder = String()
    var strTextViewPlaceholder4 = String()
    var strTextViewPlaceholder1 = String()

    var strTextViewPlaceholder2 = String()

    
    //    8d74d8bf6b5742d39971cc7d3ffbb51a
    
    var display_time : String!
    var display_hours : String!
    var display_minutes : String!
    var url_time : String!
    var url_hours : String!
    var url_minutes : String!
    var display_date : String!
    var url_date : String!
    var call_back: [((String) -> Void)]?
    
    var IFrameLink : String!
    var videe : String!
    
    var VimeoURL : URL!
    var getVimeoUploadUrl : String!
    
    var getDeleteId : Int!
    var getFromDate : String!
    var getToDate : String!
    var getDesc : String!
    var getTitle : String!
    var getVenue : String!
    var getNameheading : String!
    var editType : Int! = 0
    var editId : Int!
    var isRed = false
    var progressBarTimer: Timer!
    var isRunning = false
    var firstTimeGallery : Int!
    var firstTimeCamera : Int!
    
    @IBOutlet weak var backView: UIView!
    
    
    var fileType : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.isHidden = true
        countlabel.isHidden = true
        descTextField.delegate = self
        eventNameTextField.delegate = self
        eventTitleTextField.delegate = self
        venueTextField.delegate = self
        
        
        photoImg.contentMode = .scaleAspectFill
        photoImg.clipsToBounds = true
        
        strTextViewPlaceholder = "What is the Name of event?"
        strTextViewPlaceholder1 = "Event Title"
        strTextViewPlaceholder2 = "Description...."
        strTextViewPlaceholder4 = "Venue"

        addDoneButtonOnKeyboard()
        
//        eventNameTextField.layer.borderWidth = 0.2
//        eventNameTextField.layer.borderColor = UIColor .lightGray .cgColor
//        
//        descTextField.layer.borderWidth = 0.2
//        descTextField.layer.borderColor = UIColor .lightGray .cgColor
//        
//        eventTitleTextField.layer.borderWidth = 0.2
//        eventTitleTextField.layer.borderColor = UIColor .lightGray .cgColor
        //        dateView.isHidden = true
        gifImg.isHidden = true
        
        topEventSaveView.isHidden = true
        let defaults =  UserDefaults.standard
        
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
        
        overrideUserInterfaceStyle = .light
        
        
        
        
        
        
        
        scroller.delegate = self
        
        scroller.contentSize = CGSize(width: 100, height: 600) // Example content size
        scroller.isUserInteractionEnabled = true
        scroller.isScrollEnabled = true
        scroller.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)

        
        
        
//        eventNameTextField!.layer.borderWidth = 0.2
//        eventNameTextField!.layer.borderColor = UIColor.gray.cgColor
//        
        
        Constant.DefaultsKeys.getSelectedImg.removeAll()
        
        changeView.isHidden = true
        progressShowView.isHidden = true
        progressCountLbl.isHidden = true
        progressView.progress = 0.0
        
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        print("token",token)
        
        let selectPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhoto))
        selectPhotoViw.addGestureRecognizer(selectPhotoGes)
        
        
        let pencilGalleryPhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhotoSpecfic))
        pemcilGalleryView.addGestureRecognizer(pencilGalleryPhotoGes)
        
        
        VimeoAuthorization  = defaults.string(forKey: Constant.DefaultsKeys.VimeoToken)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let changePhotoGes = UITapGestureRecognizer(target: self, action: #selector(clickSelectPhotoSpecfic))
        changeView.addGestureRecognizer(changePhotoGes)
        
        selectPhotoViewHeight.constant = 150
        widthselectPhotoView.constant = 150
        selectPhotoViw.layer.cornerRadius = 75
        photoImg.layer.cornerRadius = 75
        
        let startDateGes = UITapGestureRecognizer(target: self, action: #selector(startDateVc))
        startDateView.addGestureRecognizer(startDateGes)
        
        let endDateGes = UITapGestureRecognizer(target: self, action: #selector(endDateVc))
        endDateView.addGestureRecognizer(endDateGes)
        
        let saveGes = EventTapGesture(target: self, action: #selector(CreateSaveEvent))
//        saveGes.goLiveId = 0
        saveView.addGestureRecognizer(saveGes)
        
        
        let goLiveGes = EventTapGesture(target: self, action: #selector(CreateGolLiveEvent))
    
        goLiveView.addGestureRecognizer(goLiveGes)
        
        
        let startTimeGes = UITapGestureRecognizer(target: self, action: #selector(startTimeVc))
        startTimeView.addGestureRecognizer(startTimeGes)
        
        let endTimeGes = UITapGestureRecognizer(target: self, action: #selector(endTimeVc))
        endTimeView.addGestureRecognizer(endTimeGes)
        
        
        
        let backGes = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGes)
        
        
        
        for i in getMediaInstitute{
            
            
            imageStr.append(i.url)
            Constant.DefaultsKeys.getSelectedImg.append(i.url)
            getSelectedImg.append(i.url)
            print("getMediaInstitutegetMediaInstitute",i.url)
        }
        
        
        
        
        print("editType",editType)
        print("getNameheading",getTitle)
        print("getFromDate",getFromDate)
        print("getToDate",getToDate)
        
//        selPhotoHeight.constant = 200
        
        eventTopBarLbl.text = "Create New Event"
        saveLbl.text = "SAVE"
        
        if editType == 1 {
            
            var fullName: String = getToDate
            let fullNameArr = fullName.components(separatedBy: " ")
            
            var firstName: String = fullNameArr[0]
            var lastName: String = fullNameArr[1]
            
            var endDate: String = getToDate
            let endDateArrameArr = fullName.components(separatedBy: " ")
            
            var EndD: String = endDateArrameArr[0]
            var endTime: String = endDateArrameArr[1]
            print("firstName",firstName)
            
            print("lastName",lastName)
//            selectPhotoViw.isHidden = true
//            pemcilGalleryView.isHidden = true
            saveLbl.text = "UPDATE"
            eventTopBarLbl.text = "Update Event"
            eventNameTextField.text = getNameheading
            eventTitleTextField.text = getTitle
            descTextField.text = getDesc
            venueTextField.text = getVenue
            startDateLbl.text = firstName
            startTimeLbl.text = lastName
            endDateLbl.text = EndD
            endTimeLBl.text = endTime
            firstTimeGallery = 1
            pencilHeight.constant = 0
            selectPhotoViewHeight.constant = 160
            widthselectPhotoView.constant = 330
            
            saveLeading.constant = 130
            goLiveView.isHidden = true
            photoImg.layer.cornerRadius = 5
            
            
//            self.photoImg.image = self.getMediaInstitute[0].url
            
            self.photoImg.sd_setImage(with: URL(string:  getMediaInstitute[0].url!), placeholderImage: UIImage(named: "image 2"))

            pemcilGalleryView.isHidden = true
            changeView.isHidden = false
           
//            editPhotoArray.append(getMediaInstitute)
            
            countlabel.isHidden = false
            countlabel.text = "+" + String(getMediaInstitute.count-1)
        }else{
            
            goLiveView.isHidden = false
            saveLeading.constant = 60
        }
        //        let calendarCancelGes = UITapGestureRecognizer(target: self, action: #selector(calendarCancel))
        //        calendarCancelView.addGestureRecognizer(calendarCancelGes)
        //
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Will")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("Will11")
    }
    @IBAction func calendarCancel () {
        
        dateView.isHidden = true
    }
    
    
    
    
    
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-61
                print("keyboardSize.height",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    @IBAction func clickOk() {
        
        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
        self.present(viewController, animated: true)
    }
    
    
    @IBAction func backVc(){
        dismiss(animated: true)
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        if textField.text == "\n" {
        //
        //
        //
        
                            venueTextField.resignFirstResponder()
                            return false
        
                        }
        return true
    }
    
//        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//    
//            
////            if let UITextViewA = eventNameTextField {
////                
//                if text == "\n" {
//                    
//                    
//                    
//                    
//                    venueTextField.resignFirstResponder()
//                    return false
//                    
//                }
////                
////            }
////                if let UITextViewA = eventTitleTextField {
////                    
////                    if text == "\n" {
////                        
////                        
////                        
////                        
////                        eventTitleTextField.resignFirstResponder()
////                        return false
////                        
////                    }
////                
////                    }
//
//            
//            
////            if (eventNameTextField.text != nil){
////                if text == "\n" {
////                    
////                    
////                    
////                    
////                    eventNameTextField.resignFirstResponder()
////                    return false
////                    
////                }
////            
////                
////                }else  if (eventTitleTextField.text != nil){
////                    if text == "\n" {
////    //                    eventTitleTextField.resignFirstResponder()
////    //
////    //                    eventTitleTextField.text = "Event Title"
////    //                    eventTitleTextField.textColor = UIColor.lightGray
////    //
////    //                    eventTitleTextField.selectedTextRange = eventTitleTextField.textRange(from: eventTitleTextField.beginningOfDocument, to: eventTitleTextField.beginningOfDocument)
////                        eventTitleTextField.resignFirstResponder()
////                        return false
////                    }
////                }else if (descTextField != nil) {
////                    if text == "\n" {
////                        //                    descTextField.resignFirstResponder()
////                        //
////                        //                    descTextField.text = "Description...."
////                        //                    descTextField.textColor = UIColor.lightGray
////                        //
////                        //                    descTextField.selectedTextRange = descTextField.textRange(from: descTextField.beginningOfDocument, to: descTextField.beginningOfDocument)
////                        descTextField.resignFirstResponder()
////                        return false
////                        
////                    }
////                    
////                    
////                }
////                
//    
//    
//    
//    
//    
//    
//    
//        return true
//        
//    
//}
    
    
    
    
    
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        venueTextField.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            venueTextField.resignFirstResponder()
        }
    
    
    
    func setupTextViewAccessoryView() {
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton))
        doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        toolBar.items = [flexsibleSpace, doneButton]
        eventNameTextField.inputAccessoryView = toolBar
        
        
        let toolBar1: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = false
        let doneButton1: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton1))
        doneButton1.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        toolBar1.items = [flexsibleSpace, doneButton1]
        eventTitleTextField.inputAccessoryView = toolBar1
        
        
        let toolBar2: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = false
        let doneButton2: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton2))
        doneButton2.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        toolBar2.items = [flexsibleSpace, doneButton2]
        descTextField.inputAccessoryView = toolBar2
        
        
        
        
        let toolBar3: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar3.barStyle = UIBarStyle.default
        toolBar3.isTranslucent = false
        let doneButton3: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton3))
        doneButton3.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        toolBar3.items = [flexsibleSpace, doneButton3]
        venueTextField.inputAccessoryView = toolBar3
        
    }
    
    @objc func didPressDoneButton(button: UIButton) {
        if( eventNameTextField.text == "" ||  eventNameTextField.text!.count == 0 || ( eventNameTextField.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            eventNameTextField.text = strTextViewPlaceholder
            eventNameTextField.textColor = UIColor.black
        }
        eventNameTextField.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
    
    
    @objc func didPressDoneButton3(button: UIButton) {
        if( venueTextField.text == "" ||  venueTextField.text!.count == 0 || ( venueTextField.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            venueTextField.text = strTextViewPlaceholder4
            venueTextField.textColor = UIColor.black
        }
        venueTextField.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
    @objc func didPressDoneButton1(button: UIButton) {
        if( eventTitleTextField.text == "" ||  eventTitleTextField.text!.count == 0 || ( eventTitleTextField.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            eventTitleTextField.text = strTextViewPlaceholder1
            eventTitleTextField.textColor = UIColor.black
        }
        eventTitleTextField.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
    
    @objc func didPressDoneButton2(button: UIButton) {
        if( descTextField.text == "" ||  descTextField.text!.count == 0 || ( descTextField.text!.trimmingCharacters(in: .whitespaces).count) == 0){
            descTextField.text = strTextViewPlaceholder2
            descTextField.textColor = UIColor.black
        }
        descTextField.resignFirstResponder()
//        textviewEnableorDisable()
    }
    
//    func textviewEnableorDisable(){
//        if(eventNameTextField.text.count > 0 && eventNameTextField.text != strTextViewPlaceholder){
//            enableButtonAction()
//        }else{
//            disableButtonAction()
//        }
//    }
//    
//    func textviewEnableorDisable1(){
//        if(eventTitleTextField.text.count > 0 && eventTitleTextField.text != strTextViewPlaceholder1){
//            enableButtonAction()
//        }else{
//            disableButtonAction()
//        }
//    }
    
//    func textviewEnableorDisable2(){
//        if(descTextField.text.count > 0 && descTextField.text != strTextViewPlaceholder2){
//            enableButtonAction()
//        }else{
//            disableButtonAction()
//        }
//    }
    
    func btnStart() {
                
                if(isRunning){
                    progressBarTimer.invalidate()
                }
                else{
                progressView.progress = 0.0
                self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(EventsWishesAppearedViewController.updateProgressView), userInfo: nil, repeats: true)
              
                }
                isRunning = !isRunning
            }

        @objc func updateProgressView(){
               progressView.progress += 0.1
            progressView.isHidden = false
          
            progressShowView.isHidden = false

            progressCountLbl.isHidden = false
            gifImg.isHidden = false
            
            var number = Int(progressView.progress*100)
            progressCountLbl.text = String(number) + " % "
            print("pr1234567", progressView.progress*100)
            if progressView.progress*100 == 100 {
                progressShowView.isHidden = true
                

                progressCountLbl.isHidden = true
                gifImg.isHidden = true
            }
            let gifURL = UIImage.gif(name: "video_uploaded")
                      // Use SDWebImage to load and display the GIF image
            gifImg.image = gifURL
//            self.gifImg.image = UIImage.gif(name: "video_uploaded")

            print("progressView progressView", progressView.progress)
               progressView.setProgress(progressView.progress, animated: true)
               if(progressView.progress == 1.0)
               {
                   
                   print(" progressView progressView 34444444", progressView.progress)
                   progressBarTimer.invalidate()
                   isRunning = false
                   
    //               btn.setTitle("Start", for: .normal)
               }
           }
    
    
    
    
    
    
    @IBAction func img2Close() {
        img2.isHidden = true
    }
    
    @IBAction func img3Close() {
        img3.isHidden = true
    }
    
    @IBAction func img4Close() {
        img4.isHidden = true
    }
    
    
    @IBAction func img1Close() {
        img1.isHidden = true
    }
    
    
    @IBAction func startDateVc() {
        
        var todaysDate = NSDate()
        
        
        
//        
        if startDateLbl.text != "Active from:" {
            //
            //
            //
            //            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
            //
            //                self?.display_date = today_date.dateString("hh:mm:a")
            //
            //                self!.startDateLbl.text = today_date.dateString("hh:mm:a")
            //
            //            })
            //        }else{
            //                    view.makeToast("Please Select From Date")
            //                }
            //
            //
            //
            
            
            
            
            startDateLbl.text = "Start Date"
            endTimeLBl.text = "Time"
            endDateLbl.text = "End Date"
            startTimeLbl.text = "Time"
            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date,style: .Inline, didSelectDate: {[weak self] (today_date) in
                self?.display_date = today_date.dateString("dd-MM-yyyy")
                self?.url_date = today_date.dateString("yyyy-MM-dd")
                self?.startDateLbl.text =  self!.display_date
//                self?.strtDate = self!.display_date
                self?.startDateLbl.textColor = .black
                
            })
        }
    }
    


    
    
    @IBAction func endDateVc() {
//        dateView.isHidden = false

        
        if startDateLbl.text != "Start Date" {
//            var strDate = startDateLbl.text
//            print("strDate",strDate)
            var todaysDate = NSDate()
           
            endTimeLBl.text = "Time"

            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, minDate: todaysDate as Date ,style: .Inline, didSelectDate: {[weak self] (today_date) in
                self?.display_date = today_date.dateString("dd-MM-yyyy")
                self?.url_date = today_date.dateString("yyyy-MM-dd")
                self!.endDateLbl.text = self!.display_date
                //            ges.dateLbl.textColor = .black
                
            })
            
        }else{
            view.makeToast("Please Select From Date")
        }
    }
    
    
    
    
    
    
    @IBAction func startTimeVc() {
        
        
        
        if startDateLbl.text != "Start Date" {

      
        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
            
            self?.display_date = today_date.dateString("hh:mm:a")
            self!.startTimeLbl.text = today_date.dateString("hh:mm:a")
            
        })
        }else{
                    view.makeToast("Please Select From Date")
                }
        
    }
    
    
    
    @IBAction func endTimeVc() {
        print("bbb")
        
        
        
        
        if startTimeLbl.text != "Time" {

            
            print("working")
            
            
            
            if endDateLbl.text == startDateLbl.text{
                
                
                RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
                    
                    self?.display_date = today_date.dateString("hh:mm:a")

                    self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
                    
                    
                    
                    if self!.startTimeLbl.text == self!.endTimeLBl.text{
                        
                        
                        self!.view.makeToast("Please Select valide date")
                        
                        
                            self!.startTimeLbl.text = "Time"
                        self!.endTimeLBl.text = "Time"
                    }
                    
                    else if self!.startTimeLbl.text! > self!.endTimeLBl.text!{
                        
                        self!.view.makeToast("Please Select valide date")
                        
                        
                            self!.startTimeLbl.text = "Time"
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
//        if startTimeLbl.text != "Time" {
//            
////            if startDateLbl.text == endDateLbl.text {
//                
//                var start = startTimeLbl.text!
//                var end = endTimeLBl.text!
//            
//            
//
////                if  start < end {
//                    
//                    
//            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
//                
//                
//                
//                
//                
//                
////                var start1 = self!.startTimeLbl.text!
////                var end1 = self!.endTimeLBl.text!
////            
////                if end1 > start1 {
////                    print("futureTime is greater than currentTime")
////                } else if end1 < start1 {
////                    print("futureTime is less than currentTime")
////                } else {
////                    print("futureTime is equal to currentTime")
////                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                print("startTimeLbl.text",self!.startTimeLbl.text)
//                print("endTimeLBl.text",self!.endTimeLBl.text)
//              
////                if  self!.endTimeLBl.text! > self!.startTimeLbl.text!  {
//                    self?.display_date = today_date.dateString("hh:mm:a")
//                    //            self?.display_date = today_date.dateString("dd-M-yyyy")
//                    //            self?.url_date = today_date.dateString("yyyy-M-dd")
//                    self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
////                }else{
////                    self!.view.makeToast("Please Select From Time Greater Than End Time")
////                }
////                if start == end {
////                 
////                    self!.view.makeToast("Please Select From Time Greate To Time")
////
////                    self!.endTimeLBl.text = ""
////            }
//               
//            })
//            
//           
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
//            
////            if start == end {
////             
////                self.view.makeToast("Please Select From Time Greate To Time")
////
////                self.endTimeLBl.text = ""
////        
////        }else{
////            RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .time, style: .Wheel, didSelectDate: {[weak self] (today_date) in
////                
////              
////                
////                self?.display_date = today_date.dateString("hh:mm:a")
////                //            self?.display_date = today_date.dateString("dd-M-yyyy")
////                //            self?.url_date = today_date.dateString("yyyy-M-dd")
////                self!.endTimeLBl.text = today_date.dateString("hh:mm:a")
////               
////            })
////         
//            //            ges.dateLbl.textColor = .black
////        }
////                }else {
////                    
////                    view.makeToast("Please Select From Time Greater Than End Time")
////                }
////            }
//        }else{
//            view.makeToast("Please Select From Time")
//        }
    }
    @objc func endTimeValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        strSubmissionDate = dateFormatter.string(from: sender.date) as String
        endTimeLBl.text = selectedDate
        print("selectedDate",selectedDate)
//        submissionDateButton.setTitle("   " + selectedDate + "   ", for: .normal)
        
    }
    
    
    @IBAction func CreateSaveEvent(ges : EventTapGesture) {
        
        
        
        
        
        
        
        var validateStartDate : String!
        
        var dates : String = startDateLbl.text!
        
        var times : String =  startTimeLbl.text!
        
        validateStartDate = dates  +  times
        
        
        
        
        
        var validateEndDate : String!
        
        var endDates : String = endDateLbl.text!
        
        var endTimes : String =  endTimeLBl.text!
        
        validateEndDate = endDates  +  endTimes
        print("endTimesendTimes",endTimes)
        print("validateEndDate",validateEndDate)
        
        
        
        print("imageStr.count",imageStr.count)
  
//            
//            
            print("editType",editType)
            
            print("fileType",fileType)
            
            
            
            if editType ==  1 {
                
                
                if venueTextField.text != "" && startDateLbl.text != "" &&  startTimeLbl.text != "" && endDateLbl.text != "" && endTimeLBl.text !=  "" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != ""  {
                    
                    
                    KRProgressHUD.show()
                    
                    
                    print("editImgArrgetSelectedImg",getSelectedImg)
                    
                    
                    getImageURL(images: photoArray)
                    
                    
                    if editType == 1 {
                        for i in  Constant.DefaultsKeys.getSelectedImg{
                            let updateEventReferModal = UpdateEventReferenceMedia()
                            //                            if i.type == "image" {
                            
                            
                            
                            updateEventReferModal.type = "image"
                            
                            updateEventReferModal.url = i
                            
                            updateEventReferMedia.append(updateEventReferModal)
                            //
                        }
                    }
                    
                    

                    
                    
                    
                    
                    
                    
                    
                    let createEventModal = UpdateEventModal()
                    createEventModal.event_id = editId
                    createEventModal.event_name = eventNameTextField.text
                    createEventModal.event_title = eventTitleTextField.text
                    createEventModal.description = descTextField.text
                    createEventModal.venue = venueTextField.text
                    createEventModal.from_time = validateStartDate
                    createEventModal.to_time = validateEndDate
                    createEventModal.maps_location =  ""
                    createEventModal.is_published = 0
                
                    createEventModal.reference_media = updateEventReferMedia
                    
                    
                    
                    
                    
                    var  createEventModalStr = createEventModal.toJSONString()
                    print("createEventModalStrtoJson",createEventModal.toJSON())
                    print("createEventModalStr",createEventModalStr)
                    print("token",token)
                    
                    UpdateEventRequest.call_request(param: createEventModalStr!,token: token) {
                        
                        
                        
                        [self] (res) in
                        
                        
                        
                        let creaveEventRes : UpdateEventResponse = Mapper<UpdateEventResponse>().map(JSONString: res)!
                        
                            
                        if creaveEventRes.status == true {
                            
                            print("creaveEventRes",creaveEventRes.message)
                            Constant.DefaultsKeys.getSelectedImg.removeAll()
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.gifImage = "success"
                            viewController.EventRedirect = "EVENTS"
                            viewController.messageResponse = creaveEventRes.message
                            
                            KRProgressHUD.dismiss()
                            self.present(viewController, animated: true)
                            
                         
                        }else{
                            Constant.DefaultsKeys.getSelectedImg.removeAll()
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.EventRedirect = "EVENTS"
                            viewController.gifImage = "failure"
                            viewController.messageResponse = creaveEventRes.message
                            KRProgressHUD.dismiss()
                            self.present(viewController, animated: true)
                        }
                        
                        
                    }
                    
                    
                }else{
                    
                    let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                if fileType == "image" || fileType == nil{
                    
                    
                    print("photoArray",photoArray.count)
                    if venueTextField.text != "" && startDateLbl.text != "Start Date" &&  startTimeLbl.text != "Time" && endDateLbl.text != "End Date" && endTimeLBl.text !=  "Time" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != "" 
                         {
                        
                        
                        let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            
                            
                            
//                            KRProgressHUD.show()
                            
                            progressShowView.isHidden = false
                            progressCountLbl.isHidden = false
                            progressCountLbl.text = "Uploading"
//                            progressBarTimer.isHidden = true
                            gifImg.isHidden = false
//                            self.gifImg.image = UIImage.gif(name: "cloud_file_uploading")
                            
                            let gifURL = UIImage.gif(name: "cloud_file_uploading")
                                      // Use SDWebImage to load and display the GIF image
                            gifImg.image = gifURL
                            getImageURL(images: photoArray)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                                
                                
                                
                                //                                KRProgressHUD.dismiss()
                                
                                
                                
                                var ModalImagesend : [CreateEventReferenceMedia] = []
                                
                                
                                
                                
                                
                                print("imageAryy",imageStr.count)
                                
                                
                                
                                
                                print("fileTypefileTypefileType",fileType)
                                
                                
                                let createEventModal = CreateEventModal()
                                
                                if imageStr.count == 0 {
                                    let createEventReferModal = CreateEventReferenceMedia()
                                    
                                    
                                    
                                    createEventReferModal.type = ""
                                    
                                    createEventReferModal.url = ""
                                    
                                    ModalImagesend.append(createEventReferModal)
                                    
                                    
                                    
                                    createEventModal.event_name = eventNameTextField.text
                                    
                                    createEventModal.event_title = eventTitleTextField.text
                                    
                                    createEventModal.description = descTextField.text
                                    
                                    createEventModal.venue = venueTextField.text
                                    
                                    createEventModal.from_time = validateStartDate
                                    
                                    createEventModal.to_time = validateEndDate
                                    
                                    createEventModal.maps_location =  ""
                                    
                                    createEventModal.is_published = 0
                                    
                                    createEventModal.reference_media = ModalImagesend
                                    
                                }else{
                                for i in imageStr{
                                    
                                    
                                    
                                    let createEventReferModal = CreateEventReferenceMedia()
                                    
                                    
                                    
                                    createEventReferModal.type = fileType
                                    
                                    createEventReferModal.url = i
                                    
                                    ModalImagesend.append(createEventReferModal)
                                    
                                    
                                    
                                    createEventModal.event_name = eventNameTextField.text
                                    
                                    createEventModal.event_title = eventTitleTextField.text
                                    
                                    createEventModal.description = descTextField.text
                                    
                                    createEventModal.venue = venueTextField.text
                                    
                                    createEventModal.from_time = validateStartDate
                                    
                                    createEventModal.to_time = validateEndDate
                                    
                                    createEventModal.maps_location =  ""
                                    
                                    createEventModal.is_published = 0
                                    
                                    createEventModal.reference_media = ModalImagesend
                                    
                                    
                                }
                                
                            }
                                
                                
                                    var  createEventModalStr = createEventModal.toJSONString()
                                    
                                    print("createEventModalStrtoJson",createEventModal.toJSON())
                                    
                                    print("createEventModalStr",createEventModalStr)
                                    
                                    print("token",token)
                                    
                                    CreateEventRequest.call_request(param: createEventModalStr!,token: token) {
                                        
                                        
                                        
                                        [self] (res) in
                                        
                                        
                                        
                                        let creaveEventRes : CreateEventResponse = Mapper<CreateEventResponse>().map(JSONString: res)!
                                        if creaveEventRes.status == true {
                                            
                                            
                                            
                                            print("creaveEventRes",creaveEventRes.message)
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                            viewController.alertShowType = 1
                                            gifImg.isHidden = true
                                            progressShowView.isHidden = true
                                            viewController.EventRedirect = "EVENTS"
                                            viewController.gifImage = "success"
                                            viewController.messageResponse = creaveEventRes.message
                                            
                                            KRProgressHUD.dismiss()
                                            self.present(viewController, animated: true)
                                            
                                            
                                            
                                        }else{
                                            
                                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                            viewController.alertShowType = 1
                                            viewController.EventRedirect = "EVENTS"
                                            viewController.gifImage = "failure"
                                            viewController.messageResponse = creaveEventRes.message
                                            KRProgressHUD.dismiss()
                                            self.present(viewController, animated: true)
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
//                                }
                                
                                
                                
                            }
                            
                        }))
                        
                        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                     //
                                                 print("Handle Cancel Logic here")
                     
                                             }))
                     //
                        present(refreshAlert, animated: true, completion: nil)


                    }
                    else{
                        let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
                
                
                
                
                else if fileType == "video" || fileType == nil{
                    
                    
                    if venueTextField.text != "" && startDateLbl.text != "Start Date" &&  startTimeLbl.text != "Time" && endDateLbl.text != "End Date" && endTimeLBl.text !=  "Time" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != ""  {
                        
                        
                        print("progressCountLbl.text",progressCountLbl.text)
                        
                        let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            
                          
                                
//                                KRProgressHUD.show()
                                
                                
                                
                                
                                uploadVideoVimeoo(videoURL: VimeoURL, accessToken: VimeoAuthorization)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                                    
                                    
                                    
//                                    KRProgressHUD.dismiss()
                                    
                                    
                                    
                                    var ModalImagesend : [CreateEventReferenceMedia] = []
                                    
                                    
                                    
                                    
                                    
                                    print("imageAryy",imageStr.count)
                                    
                                    
                                    
                                    
                                    print("fileTypefileTypefileType",fileType)
                                    
                                    
                                    let createEventModal = CreateEventModal()
                                    
                                  
                                        
                                        
                                        
                                        
                                        let createEventReferModal = CreateEventReferenceMedia()
                                        
                                        createEventReferModal.type = fileType
                                        
                                        createEventReferModal.url = getVimeoUploadUrl
                                        
                                   
                                        createEventModal.event_name = eventNameTextField.text
                                        
                                        createEventModal.event_title = eventTitleTextField.text
                                        
                                        createEventModal.description = descTextField.text
                                        
                                        createEventModal.venue = venueTextField.text
                                        
                                        createEventModal.from_time = validateStartDate
                                        
                                        createEventModal.to_time = validateEndDate
                                        
                                        createEventModal.maps_location =  ""
                                        
                                        createEventModal.is_published = 0
                                        
                                        createEventModal.reference_media = ModalImagesend
                                    
                                        
                                        var  createEventModalStr = createEventModal.toJSONString()
                                        
                                        print("createEventModalStrtoJson",createEventModal.toJSON())
                                        
                                        print("createEventModalStr",createEventModalStr)
                                        
                                        print("token",token)
                                        
                                        CreateEventRequest.call_request(param: createEventModalStr!,token: token) {
                                            
                                            
                                            
                                            [self] (res) in
                                            
                                            
                                            
                                            let creaveEventRes : CreateEventResponse = Mapper<CreateEventResponse>().map(JSONString: res)!
                                            
                                            if creaveEventRes.status == true {
                                                
                                                
                                                
                                                print("creaveEventRes",creaveEventRes.message)
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                                viewController.alertShowType = 1
                                                viewController.EventRedirect = "EVENTS"
                                                viewController.gifImage = "success"
                                                viewController.messageResponse = creaveEventRes.message
                                                
                                                KRProgressHUD.dismiss()
                                                self.present(viewController, animated: true)
                                                
                                                
                                            }else{
                                                
                                                
                                                
                                                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                                viewController.alertShowType = 1
                                                viewController.EventRedirect = "EVENTS"
                                                viewController.gifImage = "failure"
                                                viewController.messageResponse = creaveEventRes.message
                                                KRProgressHUD.dismiss()
                                                self.present(viewController, animated: true)
                                                
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
//                                    }
                                    
                                }
                                
                                
                                
                            
                            
                        }))
                        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                     //
                                                 print("Handle Cancel Logic here")
                     
                                             }))
                     //
                        present(refreshAlert, animated: true, completion: nil)

                        
//
//                        
//                        
//                        present(refreshAlert, animated: true, completion: nil)
//                        
                    }else{
                        let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
               
            }
        
        
    }
    
    
    
    @IBAction func CreateGolLiveEvent(ges : EventTapGesture) {
        
        
        
        
        
        
        
        var validateStartDate : String!
        
        var dates : String = startDateLbl.text!
        
        var times : String =  startTimeLbl.text!
        
        validateStartDate = dates  +  times
        
        
        
        
        
        var validateEndDate : String!
        
        var endDates : String = endDateLbl.text!
        
        var endTimes : String =  endTimeLBl.text!
        
        validateEndDate = endDates  +  endTimes
        print("endTimesendTimes",endTimes)
        print("validateEndDate",validateEndDate)
        
        
        
        print("imageStr.count",imageStr.count)
  
//
//
            print("editType",editType)
            
            print("fileType",fileType)
            
            
            
            if editType ==  1 {
                
                
                if venueTextField.text != "" && startDateLbl.text != "" &&  startTimeLbl.text != "" && endDateLbl.text != "" && endTimeLBl.text !=  "" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != ""  {
                    
                    
                    KRProgressHUD.show()
                    
                    
                    print("editImgArrgetSelectedImg",getSelectedImg)
                    
                    
                    getImageURL(images: photoArray)
                    
                    
                    if editType == 1 {
                        for i in  Constant.DefaultsKeys.getSelectedImg{
                            let updateEventReferModal = UpdateEventReferenceMedia()
                            //                            if i.type == "image" {
                            
                            
                            
                            updateEventReferModal.type = "image"
                            
                            updateEventReferModal.url = i
                            
                            updateEventReferMedia.append(updateEventReferModal)
                            //
                        }
                    }
                    
                    

                    
                    
                    
                    
                    
                    
                    
                    let createEventModal = UpdateEventModal()
                    createEventModal.event_id = editId
                    createEventModal.event_name = eventNameTextField.text
                    createEventModal.event_title = eventTitleTextField.text
                    createEventModal.description = descTextField.text
                    createEventModal.venue = venueTextField.text
                    createEventModal.from_time = validateStartDate
                    createEventModal.to_time = validateEndDate
                    createEventModal.maps_location =  ""
                    createEventModal.is_published = 1
                  
                    createEventModal.reference_media = updateEventReferMedia
                    
                    
                    
                    
                    
                    var  createEventModalStr = createEventModal.toJSONString()
                    print("createEventModalStrtoJson",createEventModal.toJSON())
                    print("createEventModalStr",createEventModalStr)
                    print("token",token)
                    
                    UpdateEventRequest.call_request(param: createEventModalStr!,token: token) {
                        
                        
                        
                        [self] (res) in
                        
                        
                        
                        let creaveEventRes : UpdateEventResponse = Mapper<UpdateEventResponse>().map(JSONString: res)!
                        
                            
                        if creaveEventRes.status == true {
                            
                            print("creaveEventRes",creaveEventRes.message)
                            Constant.DefaultsKeys.getSelectedImg.removeAll()
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.gifImage = "success"
                            viewController.EventRedirect = "EVENTS"
                            viewController.messageResponse = creaveEventRes.message
                            
                            KRProgressHUD.dismiss()
                            self.present(viewController, animated: true)
                            
                         
                        }else{
                            Constant.DefaultsKeys.getSelectedImg.removeAll()
                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                            viewController.alertShowType = 1
                            viewController.EventRedirect = "EVENTS"
                            viewController.gifImage = "failure"
                            viewController.messageResponse = creaveEventRes.message
                            KRProgressHUD.dismiss()
                            self.present(viewController, animated: true)
                        }
                        
                        
                    }
                    
                    
                }else{
                    
                    let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                if fileType == "image" {
                    
                    
                    print("photoArray",photoArray.count)
                    if venueTextField.text != "" && startDateLbl.text != "Start Date" &&  startTimeLbl.text != "Time" && endDateLbl.text != "End Date" && endTimeLBl.text !=  "Time" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != ""
                        && photoArray.count != 0  {
                        
                        
                        let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            
                            
                            
//                            KRProgressHUD.show()
                            
                            progressShowView.isHidden = false
                            progressCountLbl.isHidden = false
                            progressCountLbl.text = "Uploading"
//                            progressBarTimer.isHidden = true
                            gifImg.isHidden = false
//                            self.gifImg.image = UIImage.gif(name: "cloud_file_uploading")
                            
                            let gifURL = UIImage.gif(name: "cloud_file_uploading")
                                      // Use SDWebImage to load and display the GIF image
                            gifImg.image = gifURL
                            getImageURL(images: photoArray)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                                
                                
                                
//                                KRProgressHUD.dismiss()
                                
                                
                                
                                var ModalImagesend : [CreateEventReferenceMedia] = []
                                
                                
                                
                                
                                
                                print("imageAryy",imageStr.count)
                                
                                
                                
                                
                                print("fileTypefileTypefileType",fileType)
                                
                                
                                let createEventModal = CreateEventModal()
                                for i in imageStr{
                                    
                                    
                                    
                                    let createEventReferModal = CreateEventReferenceMedia()
                                    
                                    
                                    
                                    createEventReferModal.type = fileType
                                    
                                    createEventReferModal.url = i
                                    
                                    ModalImagesend.append(createEventReferModal)
                                    
                                    
                                    
                                    createEventModal.event_name = eventNameTextField.text
                                    
                                    createEventModal.event_title = eventTitleTextField.text
                                    
                                    createEventModal.description = descTextField.text
                                    
                                    createEventModal.venue = venueTextField.text
                                    
                                    createEventModal.from_time = validateStartDate
                                    
                                    createEventModal.to_time = validateEndDate
                                    
                                    createEventModal.maps_location =  ""
                                    
                                    createEventModal.is_published = 1
                                    
                                    createEventModal.reference_media = ModalImagesend
                                    
                                    
                                }
                                    var  createEventModalStr = createEventModal.toJSONString()
                                    
                                    print("createEventModalStrtoJson",createEventModal.toJSON())
                                    
                                    print("createEventModalStr",createEventModalStr)
                                    
                                    print("token",token)
                                    
                                    CreateEventRequest.call_request(param: createEventModalStr!,token: token) {
                                        
                                        
                                        
                                        [self] (res) in
                                        
                                        
                                        
                                        let creaveEventRes : CreateEventResponse = Mapper<CreateEventResponse>().map(JSONString: res)!
                                        if creaveEventRes.status == true {
                                            
                                            
                                            
                                            print("creaveEventRes",creaveEventRes.message)
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                            viewController.alertShowType = 1
                                            gifImg.isHidden = true
                                            progressShowView.isHidden = true
                                            viewController.EventRedirect = "EVENTS"
                                            viewController.gifImage = "success"
                                            viewController.messageResponse = creaveEventRes.message
                                            
                                            KRProgressHUD.dismiss()
                                            self.present(viewController, animated: true)
                                            
                                            
                                            
                                        }else{
                                            
                                            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                            viewController.alertShowType = 1
                                            viewController.EventRedirect = "EVENTS"
                                            viewController.gifImage = "failure"
                                            viewController.messageResponse = creaveEventRes.message
                                            KRProgressHUD.dismiss()
                                            self.present(viewController, animated: true)
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
//                                }
                                
                                
                                
                            }
                            
                        }))
                        
                        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                     //
                                                 print("Handle Cancel Logic here")
                     
                                             }))
                     //
                        present(refreshAlert, animated: true, completion: nil)


                    }
                    else{
                        let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }else if fileType == "video"{
                    
                    
                    if venueTextField.text != "" && startDateLbl.text != "Start Date" &&  startTimeLbl.text != "Time" && endDateLbl.text != "End Date" && endTimeLBl.text !=  "Time" && eventNameTextField.text != "" &&  eventTitleTextField.text != "" && descTextField.text != "" && VimeoURL.absoluteString != "" {
                        
                        
                        print("progressCountLbl.text",progressCountLbl.text)
                        
                        let refreshAlert = UIAlertController(title: "Hold on!", message: "Are you sure you want to submit?", preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            
                          
                                
//                                KRProgressHUD.show()
                                
                                
                                
                                
                                uploadVideoVimeoo(videoURL: VimeoURL, accessToken: VimeoAuthorization)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now()+4.3) { [self] in
                                    
                                    
                                    
//                                    KRProgressHUD.dismiss()
                                    
                                    
                                    
                                    var ModalImagesend : [CreateEventReferenceMedia] = []
                                    
                                    
                                    
                                    
                                    
                                    print("imageAryy",imageStr.count)
                                    
                                    
                                    
                                    
                                    print("fileTypefileTypefileType",fileType)
                                    
                                    
                                    let createEventModal = CreateEventModal()
                                    
                                  
                                        
                                        
                                        
                                        
                                        let createEventReferModal = CreateEventReferenceMedia()
                                        
                                        createEventReferModal.type = fileType
                                        
                                        createEventReferModal.url = getVimeoUploadUrl
                                        
                                   
                                        createEventModal.event_name = eventNameTextField.text
                                        
                                        createEventModal.event_title = eventTitleTextField.text
                                        
                                        createEventModal.description = descTextField.text
                                        
                                        createEventModal.venue = venueTextField.text
                                        
                                        createEventModal.from_time = validateStartDate
                                        
                                        createEventModal.to_time = validateEndDate
                                        
                                        createEventModal.maps_location =  ""
                                        
                                        createEventModal.is_published = 1
                                        
                                        createEventModal.reference_media = ModalImagesend
                                    
                                        
                                        var  createEventModalStr = createEventModal.toJSONString()
                                        
                                        print("createEventModalStrtoJson",createEventModal.toJSON())
                                        
                                        print("createEventModalStr",createEventModalStr)
                                        
                                        print("token",token)
                                        
                                        CreateEventRequest.call_request(param: createEventModalStr!,token: token) {
                                            
                                            
                                            
                                            [self] (res) in
                                            
                                            
                                            
                                            let creaveEventRes : CreateEventResponse = Mapper<CreateEventResponse>().map(JSONString: res)!
                                            
                                            if creaveEventRes.status == true {
                                                
                                                
                                                
                                                print("creaveEventRes",creaveEventRes.message)
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                                viewController.alertShowType = 1
                                                viewController.EventRedirect = "EVENTS"
                                                viewController.gifImage = "success"
                                                viewController.messageResponse = creaveEventRes.message
                                                
                                                KRProgressHUD.dismiss()
                                                self.present(viewController, animated: true)
                                                
                                                
                                            }else{
                                                
                                                
                                                
                                                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                                                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                                                viewController.alertShowType = 1
                                                viewController.EventRedirect = "EVENTS"
                                                viewController.gifImage = "failure"
                                                viewController.messageResponse = creaveEventRes.message
                                                KRProgressHUD.dismiss()
                                                self.present(viewController, animated: true)
                                                
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
//                                    }
                                    
                                }
                                
                                
                                
                            
                            
                        }))
                        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                     //
                                                 print("Handle Cancel Logic here")
                     
                                             }))
                     //
                        present(refreshAlert, animated: true, completion: nil)

                        
//
//
//
//                        present(refreshAlert, animated: true, completion: nil)
//
                    }else{
                        let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
                else{
                    let alert = UIAlertController(title: "Alert", message: "All fields are Mandatory", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }

        
    }
   
   
    
    
    func choose_image_handler(action: UIAlertAction){
        
        
        let alert = UIAlertController(title: "Select Attachment", message: "", preferredStyle: .actionSheet)
        
        print(action.title!)
        
        if ((action.title!.elementsEqual("Gallery"))){
            
            print("camera")
            

            print("gallery")

   clickGallery()

            
        }else if ((action.title!.elementsEqual("Camera"))){
            
            
            
            clickCamera()
            
        }
    else if ((action.title!.elementsEqual("Video"))){
        
        
        
        uploadVideoVc()
        
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
//                      getMediaInstitute.append()
                      self.photoImg.image = self.photoArray[0]
                      
                      selectPhotoViewHeight.constant = 160
                      widthselectPhotoView.constant = 353
                      
                      photoImg.layer.cornerRadius = 5
                      
                      
//                      getMediaInstitute.append(photoArray)
                      
                      firstTimeGallery = 1
                      changeView.isHidden = false
                      
                      selPhotoHeight.constant = 270
                    
                      pemcilGalleryView.isHidden = true
                      
                      if photoArray.count == 1 ||  photoArray.count == 0{
                                                
                                                
                                                countlabel.isHidden = true
                                                
                                            }
                                            else{
                                                if editType == 1 {
                                                    countlabel.isHidden = true
                                                  
                                                }else{
                                                    countlabel.isHidden = false
                                                    countlabel.text = "+" + String(photoArray.count-1)
                                                    
                                                    
                                                }
                                            }
                      
//
                  }
                  
                  
//
             print("photoArray.count" ,photoArray.count)



                 print("photoArray.count" ,photoArray.count)
                
              }

        
//        if editType == 1{
            getImageURL(images: photoArray)
            print("complete phto array \(self.photoArray)")
//        }
          }
    
    
    
    
    
    @IBAction func clickCamera() {
        
        let camera_controller = CameraViewController
        
       
        { [weak self] image, asset in

            
            self!.photoArray.append(image! as UIImage)
            
            self!.getImageURL(images: self!.photoArray)
            
            self!.photoImg.image = image!
            self!.selectPhotoViewHeight.constant = 160
            self!.widthselectPhotoView.constant = 353
            
            self!.photoImg.layer.cornerRadius = 5
          
            self!.pemcilGalleryView.isHidden = true
            self!.changeView.isHidden = false
            self!.selPhotoHeight.constant = 270
            self?.dismiss(animated: true, completion: nil)

        }

        present(camera_controller, animated: true, completion: nil)

    }
    
    
    
    
   

    @IBAction func clickGallery() {
        photoArray.removeAll()
        SelectedAssets.removeAll()
        arrSelectedFilePath.removeAll()
    totalImageCount = 0
        currentImageCount = 0
        let imagePicker = ImagePickerController()

    print("imgCountGet1",imgCountGet)

        imagePicker.settings.selection.max = imgCountGet
    
   
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        fileType = "image"


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
        
        print("getImageURLgetImageURL")
        print("currentImageCount",currentImageCount)
        print("images.count",images.count)
        self.originalImagesArray = images
        self.totalImageCount = images.count
        if currentImageCount < images.count{
            self.uploadAWS(image: images[currentImageCount])
        }
    }
    
    
    
    
    
    func uploadAWS(image : UIImage){
        
      
        print("uploadAWSuploadAWS")
        let S3BucketName = "alumnite-chalkpz"
        let CognitoPoolID = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a"
        let Region = AWSRegionType.APSouth1
        
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:Region,identityPoolId:CognitoPoolID)
        let configuration = AWSServiceConfiguration(region:Region, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        
        let currentTimeStamp = NSString.init(format: "%ld",Date() as CVarArg)
        let imageNameWithoutExtension = NSString.init(format: "vc_%@",currentTimeStamp)
        let imageName = NSString.init(format: "%@%@",imageNameWithoutExtension, ".png")
        
        
        
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
                print("Upload failed : (\(error))")
            }
            var imageFilePath = NSMutableArray()
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent((uploadRequest?.bucket!)!).appendingPathComponent((uploadRequest?.key!)!)
                if let absoluteString = publicURL?.absoluteString {
                    print("Uploaded to:\(absoluteString)")
                    
                    
                    print("AlreadteditgetSelectedImg",getSelectedImg)
                  
                    
                    imageStr.append(absoluteString)
                    Constant.DefaultsKeys.getSelectedImg.append(absoluteString)
                    getSelectedImg.append(absoluteString)
                    print("AfterteditImgArr", getSelectedImg)
                   
                    let imageDicthome = NSMutableDictionary()
                    imageDicthome["path"] = absoluteString
                    imageDicthome["type"] = "IMAGE"
                    let imageDict = NSMutableDictionary()
                    var emptyDictionary = [String: String]()
                   
                    imageFilePath.add(imageDicthome)
                    
                    
                    
                    self.imageUrlArray.add(imageDict)
                  
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
            
            return nil
        }
        
        if editType == 1 {
            countlabel.isHidden = false
            print("editImgArrcccount",Constant.DefaultsKeys.getSelectedImg.count)
            countlabel.text = "+" + String(Constant.DefaultsKeys.getSelectedImg.count+1)
        }
    }
    
    
    @IBAction func changeSelectPhoto () {
        
        
        
        let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
        
        for i in ["Gallery","Camera","Video"] {
            
            alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
            
        }
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func clickSelectPhoto () {
        
        
        if firstTimeGallery == 1 {
            changeView.isHidden = false
            
            selPhotoHeight.constant = 270

                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                
        //        changeImageView.isHidden = false
            
            
         
           

                print("photoArray.count",imageStr.count)
            if editType == 1 {
                viewController.editType = 1
            }else{
                viewController.editType = 0
            }
            viewController.getMediaInstitute = getMediaInstitute
            viewController.photoArray = photoArray
            viewController.EventRedirect = "EVENTS"
            viewController.getSelectedImg = Constant.DefaultsKeys.getSelectedImg
        //        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                self.present(viewController, animated: true)
                
                
            
//            view.backgroundColor =
        }else{
            let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
            
            for i in ["Gallery","Camera","Video"] {
                
                alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
                
            }
            
            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            
            
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func clickSelectPhotoSpecfic () {
        
        
        
            let alert = UIAlertController(title: "Upload your profile here", message: "", preferredStyle: .actionSheet)
            
            for i in ["Gallery","Camera","Video"] {
                
                alert.addAction(UIAlertAction(title: i, style: .default, handler: choose_image_handler))
                
            }
            
            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            
            
            
            self.present(alert, animated: true, completion: nil)
            
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let url = info[.mediaURL] as? URL {
                // Handle the selected video URL here
                print("oplddd",url)
                fileType = "video"
                VimeoURL = url
                countlabel.isHidden = true
                self.photoImg.image = self.createThumbnailImage(videopath: url as URL)

               
                
            }
            
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
    
    
    @IBAction func  uploadVideoVc(){

        
        photoImg.image = UIImage(named: "gallery_pick")
        let imagePickerController = UIImagePickerController()

               imagePickerController.delegate = self

        imagePickerController.sourceType = .photoLibrary

               imagePickerController.mediaTypes = ["public.movie"]


               present(imagePickerController, animated: true, completion: nil)

    }
    
    func createThumbnailImage(videopath: URL) -> UIImage? {
        let asset = AVURLAsset(url: videopath)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        let timestamp = CMTime(seconds: 0.0, preferredTimescale: 60)
        if let imageRef = try? generator.copyCGImage(at: timestamp, actualTime: nil) {
            print("imageRef",imageRef)
            return UIImage(cgImage: imageRef)
            
        } else {
            return nil
        }
    }
    
    func uploadVideoVimeoo(videoURL: URL, accessToken: String) {
        btnStart()
            initiateVideoUpload(accessToken: accessToken) { [self] uploadLink in
                print("uploadLink",uploadLink)

         guard let uploadLink = uploadLink else {
         print("Failed to initiate video upload.")
             
//             progressView.isHidden = true
             
             let refreshAlert = UIAlertController(title: "", message: "Video upload failed.", preferredStyle: UIAlertController.Style.alert)
                          
                          refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                              (action: UIAlertAction!) in
                              
                                  self.progressShowView.isHidden = true
                         
                          }))
                          
                          
                          
                          
                          present(refreshAlert, animated: true, completion: nil)
             
         return
         }

         guard let videoData = try? Data(contentsOf: videoURL) else {
         print("Error: Unable to read video data.")
         return
         }
                print("videoData",videoData)

         uploadVideoChunk(videoData: videoData, uploadURL: uploadLink) { success in
         if success {
             self.progressShowView.isHidden = true
//             progressView.isHidden = true
             print("Video upload successful.",uploadLink)


         print("Video upload successful.")
         } else {
             self.progressShowView.isHidden = true
//             progressView.isHidden = true
             
             let refreshAlert = UIAlertController(title: "", message: "Video upload failed.", preferredStyle: UIAlertController.Style.alert)
                          
                          refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                              
                              
                              self.progressShowView.isHidden = true
                         
                          }))
                          
                          
                          
                          
                          present(refreshAlert, animated: true, completion: nil)
         print("Video upload failed.")
         }
         }
         }
        }
    
    
    func initiateVideoUpload(accessToken: String, completion: @escaping (String?) -> Void) {
        
        
            let endpoint = "https://api.vimeo.com/me/videos"
            let headers: HTTPHeaders = [
            "Authorization": VimeoAuthorization,
            "Content-Type": "application/json"
            ]
   
            // Initiate the upload
            AF.request(endpoint, method: .post, headers: headers)
            .validate()
            .responseJSON { [self] response in
                print("videoDataresponse",response)
   
   
            switch response.result {
   
            case .success(let data):
   
                 let resultNew = data as? [String:Any]
                let upload = resultNew!["upload"] as! AnyObject
                let embedUrl = resultNew!["player_embed_url"] as! String
   
                let embed = resultNew!["embed"] as! AnyObject
                IFrameLink = embed["html"]  as! String
                videe = embedUrl as! String
                
                var fullName: String = videe
                let fullNameArr = fullName.components(separatedBy: "?")

                var firstName: String = fullNameArr[0]
                print("firstName",firstName)
                getVimeoUploadUrl = firstName
                print("videe = embedUrl",videe)
                print("IFrameLink",IFrameLink)
   
   
            if let uploadLink = (data as? [String: Any])?["upload"] as? AnyObject {
                let values = uploadLink as? [String:Any]
                let upload_link = values!["upload_link"]  as! String
   print("upload_link1233",upload_link)
                completion(upload_link)
            } else {
            completion(nil)
            }
            case .failure(let error):
            print("Failed to initiate video upload: \(error)")
            completion(nil)
            }
            }
           }
       
       
    func uploadVideoChunk(videoData: Data, uploadURL: String, completion: @escaping (Bool) -> Void) {
     AF.upload(videoData, to: uploadURL, method: .put)
     .validate()
     .response { response in
     if response.error == nil {
     completion(true)
     } else {
     print("Failed to upload video chunk: \(response.error.debugDescription)")
     completion(false)
     }
     }
    }


    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("false")



        //
        if eventNameTextField.text == "" {
            eventNameTextField.text = strTextViewPlaceholder
            eventNameTextField.textColor = UIColor.black
            eventNameTextField.font = .boldSystemFont(ofSize: 14)

            eventNameTextField.font = UIFont(name: "verdana", size: 13.0)
//            let selectRecpient = UITapGestureRecognizer(target: self, action: #selector(SelectRepVc))
//            selectRecipientsView.addGestureRecognizer(selectRecpient)

        }
         if eventTitleTextField.text == "" {
            eventTitleTextField.text = strTextViewPlaceholder1
            eventTitleTextField.textColor = UIColor.black
             eventTitleTextField.font = .boldSystemFont(ofSize: 14)

//            eventTitleTextField.font = UIFont(name: "verdana", size: 13.0)
//            let selectRecpient = UITapGestureRecognizer(target: self, action: #selector(SelectRepVc))
//            selectRecipientsView.addGestureRecognizer(selectRecpient)

        }
         if descTextField.text == "" {
            descTextField.text = strTextViewPlaceholder2
            descTextField.textColor = UIColor.black
            descTextField.font = UIFont(name: "verdana", size: 13.0)
//            let selectRecpient = UITapGestureRecognizer(target: self, action: #selector(SelectRepVc))
//            selectRecipientsView.addGestureRecognizer(selectRecpient)

        }
//         if venueTextField.text == "" {
//            venueTextField.text = strTextViewPlaceholder4
//            venueTextField.textColor = UIColor.black
//            venueTextField.font = UIFont(name: "verdana", size: 14.0)
//        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {

       
        if eventNameTextField.text == strTextViewPlaceholder{
            eventNameTextField.text = ""
            eventNameTextField.textColor = UIColor.black
            eventNameTextField.font = .boldSystemFont(ofSize: 14)

//            eventNameTextField.font = UIFont(name: "verdana", size: 14.0)
        }
         if eventTitleTextField.text == strTextViewPlaceholder1 {
            eventTitleTextField.text = ""
            eventTitleTextField.textColor = UIColor.black
             eventTitleTextField.font = .boldSystemFont(ofSize: 14)

//            eventTitleTextField.font = UIFont(name: "verdana", size: 14.0)
        }
         if descTextField.text == strTextViewPlaceholder2 {
            descTextField.text = ""
            descTextField.textColor = UIColor.black
//             eventNameTextField.font = .boldSystemFont(ofSize: 14)

            descTextField.font = UIFont(name: "verdana", size: 14.0)
        }

        
//        if venueTextField.text == strTextViewPlaceholder4 {
//            venueTextField.text = ""
//            venueTextField.textColor = UIColor.black
//            venueTextField.font = UIFont(name: "verdana", size: 14.0)
//       }

    }
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        setupTextViewAccessoryView()
        
        if(eventNameTextField.text == strTextViewPlaceholder)
        {
            eventNameTextField.text = ""
            eventNameTextField.textColor = UIColor.black
            eventNameTextField.font = .boldSystemFont(ofSize: 14)

        }
       
        
        
        if(eventTitleTextField.text == strTextViewPlaceholder1)
        {
            eventTitleTextField.text = ""
            eventTitleTextField.textColor = UIColor.black
            eventTitleTextField.font = .boldSystemFont(ofSize: 14)
        }
        
        
        
        
        if(descTextField.text == strTextViewPlaceholder2)
        {
            descTextField.text = ""
            descTextField.textColor = UIColor.black
        }
        
        
//        if(venueTextField.text == strTextViewPlaceholder4)
//        {
//            venueTextField.text = ""
//            venueTextField.textColor = UIColor.black
//        }
        
        
        
        
        return true
    }
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
//        imageListShowView.isHidden = true
    }
    
    
    @IBAction func datePickAction(_ sender: Any) {
    }
    
    
}



class EventTapGesture : UITapGestureRecognizer {
    
    var goLiveId :  Int!
}

