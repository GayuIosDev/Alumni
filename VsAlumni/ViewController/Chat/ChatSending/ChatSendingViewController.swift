//
//  ChatSendingViewController.swift
//  VsAlumni
//
//  Created by admin on 12/02/24.
//

import UIKit

import ALCameraViewController
import ObjectMapper
import Photos
import BSImagePicker
import AVFAudio
import AVFoundation
import AWSCognito
import AWSCore
import AWSS3
import SocketIO
import CryptoSwift
import KRProgressHUD
import Alamofire

import SDWebImage



class ChatSendingViewController: UIViewController, UITextFieldDelegate,AVAudioRecorderDelegate, AVAudioPlayerDelegate, UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIDocumentMenuDelegate,UIDocumentPickerDelegate,UITextViewDelegate {
    
    
    @IBOutlet weak var deleteView: UIView!
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    @IBOutlet weak var recodeImg: UIImageView!
    
    @IBOutlet weak var MediaFileHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var mediaFileView: UIView!
    
    
    @IBOutlet weak var mediaFileVideoView: UIViewX!
    @IBOutlet weak var mediaFileInFilesView: UIViewX!
    
    @IBOutlet weak var mediaFileGallery: UIViewX!
    
    
    @IBOutlet weak var mediaFileCameraView: UIViewX!
    
    
    @IBOutlet weak var messageTextField: UITextView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    
    @IBOutlet weak var chatVoiceRecTime: UILabel!
    @IBOutlet weak var profilePickImg: UIImageView!
    
    @IBOutlet weak var onlineOfflineShow: UIImageView!
    
    @IBOutlet weak var galleryView: UIView!
    
    @IBOutlet weak var voiceRecordView: UIView!
    
    
    @IBOutlet weak var CameraView: UIView!
    
    
    
    
    
    @IBOutlet weak var cameraWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var galleryWidth: NSLayoutConstraint!
    
    @IBOutlet weak var designation: UILabel!
    
    @IBOutlet weak var bottomHeight: NSLayoutConstraint!
    var contentTypeSend : Int!
    let picker = UIImagePickerController()
    var audioImg : UIImageView!
    var filePathVoiceRecord : String!
    
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    var arrSelectedFilePath : [Any] = []
    var image_choose: Bool = false
    var urls : URL!
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    var player: AVPlayer! = nil
    var imagePicker = UIImagePickerController()
    
    var state: AGAudioRecorderState = .Ready
    var recorder: AGAudioRecorder = AGAudioRecorder(withFileName: "TempFile")
    
    var meterTimer:Timer!
    var isAudioRecordingGranted: Bool!
    var isRecording = false
    var isPlaying = false
    var VoiceFilePath : String!
    var pdfFilePath : String!
    var login_Id : Int!
    
    var imgCountGet : Int  = 10
    
    var IsBday : Bool! = false
    var ackArray : [String] = []
    
    var deletedMsgId : [Int]! = []
    var intArr : [Int] = []
    let rowId = "ChatListShowingTableViewCell"
    let rowIdReceiver = "ChatReceiverTableViewCell"
    let rowIdSender = "ChatSenderTableViewCell"
//    let DefaultProfile = "ChatProfileTableViewCell"
        let identifer2 = "ChatProfile"

    var userName : String! = ""
    var cNameStr : String! = ""
    var instituteNameStr : String! = ""
    var userImg : String! = ""
    var user_id : Int!
    
    var batchStr : String! = ""
    var getBulkChatList : [GetBulkChatListData] = []

    var getBulkChatList2 : [GetBulkChatListData] = []
    var getLocalFile  = ""
    var getContentType  = ""
    var totalImageCount = 0
    var imageUrlArray = NSMutableArray()
    var originalImagesArray = [UIImage]()
    var imageStr  : [String] = []
    var convertedImagesUrlArray = NSMutableArray()
    var currentImageCount = 0
    
    
    
    var chatWishType : Int!
    var videourl : URL!
    var IFrameLink : String!
    
    var videe : String!
    var pdfData : Data? = nil
    
    
    var VimeoURL : URL!
    
    var iframes : String!
    var videoUploadUrl : String!
    var getVimeoUploadUrl : String!
    
    var VimeoAuthorization : String!
    
    var userId : Int!
    var selectedUserId : Int!
    var joinRoomArr : [Int] = []
    var roomId : Int!
    var token : String!
    var tapType : Int!
    var designationStr : String!
    var loginUserName : String!
    var isNewDataLoading = false
    let refreshControl = UIRefreshControl()
    var chatCount = 0
    var ofsetCount = 0
    
    
    var deletedMsgs : [Int] = []
    
    var bdayRedirect : String!
    var bdayRedirectName : String!
    var bdayRedirectDesignation : String!
    var bdayRedirectProfile : String!
    var bdayRedirectId : Int!

    
    
    var getRoomId : Int!
    var getMsgId : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        mSocket.emit(ChatUtil., Arrays.toString(user_ids),user_id);
        
        
       
               
        deleteView.isHidden = true
        
        chatVoiceRecTime.isHidden = true
        galleryView.isHidden = false
        CameraView.isHidden = false
        galleryWidth.constant = 50
        cameraWidth.constant = 50
        
        
        
        let defaults =  UserDefaults.standard
       token  =   defaults.string(forKey: Constant.DefaultsKeys.token)
        
        userId  = defaults.integer(forKey: Constant.DefaultsKeys.LoginId)
        loginUserName  = defaults.string(forKey: Constant.DefaultsKeys.firstName)
        VimeoAuthorization  = defaults.string(forKey: Constant.DefaultsKeys.VimeoToken)

//        if bdayRedirect == "Chat" {
            joinRoomArr.append(userId)
            joinRoomArr.append(selectedUserId)
            
        
        if chatWishType == 1 {
            messageTextField.text = "Happy birthday"
        }
        
        
            print("joinRoomArr",joinRoomArr)
            let resultString = "[" + joinRoomArr.map { "\($0)" }.joined(separator: ",") + "]"
            SocketIOManager.socket.emit("join_room",resultString,userId)
            SocketIOManager.socket.on("update_room") {[self]  dataArray, ack in
                var getUserId = (dataArray[0])
                
                print("getUserId",getUserId)
                print("userId",userId)
                
                
                //            SocketIOManager.
                
                
                
                if(self.userId == getUserId as! Int)
                {
                    self.roomId = (dataArray[1]) as! Int
                    print("roomId \(dataArray[1])")
                    
                    
                    
                    bulkChatList()
                    
                    
                    
                    
                    
                    
                }
                
            }
            
            
            profilePickImg.sd_setImage(with: URL(string:  userImg), placeholderImage: UIImage(named: "image 2"))

            
//        }
        
//        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)

        
        
//        if tapType == 1{
//            print("Chat Not Access Detail VC")
//        }else{
//            let ChatScreenGesture  = UITapGestureRecognizer(target:self,action:#selector(chatDetailVc))
//            self.voiceRecordView.addGestureRecognizer(ChatScreenGesture)

//        }
        
//        tv.dataSource = self
//        tv.delegate = self
//
        
        print("user_id",user_id)
        
      
        //        "login_user", async (user_id)
        
        mediaFileView.isHidden = true
        
        
        overrideUserInterfaceStyle = .light
        
        //
        
        check_record_permission()
        profilePickImg.layer.cornerRadius = 20
        //        bulkChatResponse()
        
        
        let rownib2 = UINib(nibName: identifer2, bundle: nil)
        tv.register(rownib2, forHeaderFooterViewReuseIdentifier: identifer2)
        
//        tv.register(UINib(nibName:  DefaultProfile, bundle: nil), forCellReuseIdentifier:  DefaultProfile)
        tv.register(UINib(nibName: rowId, bundle: nil), forCellReuseIdentifier: rowId) 
        tv.register(UINib(nibName: rowIdReceiver, bundle: nil), forCellReuseIdentifier: rowIdReceiver)
        tv.register(UINib(nibName: rowIdSender, bundle: nil), forCellReuseIdentifier: rowIdSender)

        //        if messageTextField.text
        
        messageTextField.delegate = self
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(dismissVc))
        backView.addGestureRecognizer(backGesture)
        
        //        profilePickImg.sd_setImage(with: URL(string:  getAssistData.profile_picture!), placeholderImage: UIImage(named: "image 2"))
        
        
        let cameraViewGesture  = UITapGestureRecognizer(target:self,action:#selector(open_camera))
        self.CameraView.addGestureRecognizer(cameraViewGesture)
        
        
        
        let mediaCameraViewGesture  = UITapGestureRecognizer(target:self,action:#selector(open_camera))
        self.mediaFileCameraView.addGestureRecognizer(mediaCameraViewGesture)
        
        let mediaGalleryViewGesture  = UITapGestureRecognizer(target:self,action:#selector(open_gallery))
        self.mediaFileGallery.addGestureRecognizer(mediaGalleryViewGesture)
        
        let filesGesture  = UITapGestureRecognizer(target:self,action:#selector(PdfFile))
        self.mediaFileInFilesView.addGestureRecognizer(filesGesture)
        //
        //        let imgZoomGesture  = UITapGestureRecognizer(target:self,action:#selector(ImgZoomVc))
        //        imgZoom.addGestureRecognizer(imgZoomGesture)
        
        
        let videoGesture  = UITapGestureRecognizer(target:self,action:#selector(uploadViewVc))
        self.mediaFileVideoView.addGestureRecognizer(videoGesture)
        
        
        let mediaGesture  = UITapGestureRecognizer(target:self,action:#selector(MediaFileVc))
        self.galleryView.addGestureRecognizer(mediaGesture)
        
        
        nameLbl.text = userName
        designation.text = designationStr
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        let ChatSendGesture  = UITapGestureRecognizer(target:self,action:#selector(messageSending))
//        self.voiceRecordView.addGestureRecognizer(ChatSendGesture)
        
        print("recodeImg.image",recodeImg.image)
//        if  recodeImg.image == UIImage(systemName: "microphone") {
            
            //
            let recordGesture  = UITapGestureRecognizer(target:self,action:#selector(voiceRecClickAction))
            self.voiceRecordView.addGestureRecognizer(recordGesture)
//        }
        
//        scrollToBottom()
       
        //
//        tv.estimatedRowHeight = 50
//                 tv.rowHeight = UITableView.automaticDimension
        
        
       
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tv.refreshControl = refreshControl

        
        
        
     
        
        
               }
    
    
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        SocketIOManager.socket.on("ack_msg") { [self]dataArray, ack in
//            print("ack_user_id \(dataArray[0])")
//            print("ack_room_id \(dataArray[1])")
//            print("ack_msg_id \(dataArray[2])")
//            print("chats_ack_value \(dataArray[3])")
////            tv.dataSource = self
//            bulkChatList()
////            tv.delegate = self
////            tv.reloadData()
//        }
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        SocketIOManager.socket.on("ack_msg") { [self]dataArray, ack in
            print("ack_user_id \(dataArray[0])")
            print("ack_room_id \(dataArray[1])")
            print("ack_msg_id \(dataArray[2])")
            print("chats_ack_value \(dataArray[3])")
           
            bulkChatList()
            tv.delegate = self
            tv.dataSource = self
            tv.reloadData()
        }
        
        
        
//        SocketIOManager.socket.on("ack_delete_msg") {[self]  dataArray, ack in
//            
//            
//            
//            
//            
//            bulkChatList()
//             tv.reloadData()
//             tv.delegate =  self
//             tv.dataSource = self
//        }
        
    }
    
    @objc func handleRefresh() {
        
       
            print("afterofset",ofsetCount)
            tv.refreshControl?.endRefreshing()
            
        ofsetCount += 10
        
        print("beforeofsetssss",ofsetCount)
        bulkChatList()
            
      
    }
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        if textField.text  == ""{
//
//            recodeImg.image = UIImage(named: "microphone")
//
//        }
//        else{
//
//            recodeImg.image = UIImage(named: "send-message")
//
//        }
//
//
//        }
//    func textViewDidEndEditing(_ textView: UITextView) {
//        // your code here.
//        print("helpppppp",textView.text)
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == tv{
            let pageWidth = tv.frame.size.width
            let page_number: Int = Int(self.tv.contentOffset.y / pageWidth)
            print("currentpage ", page_number)
            //                change_icon_style(pos: page_number)
            
        }
    }
    func textViewDidChange(_ textView: UITextView) {

        if textView.text  == ""{
       
                   recodeImg.image = UIImage(named: "microphone")
       
               }
               else{
       
                   recodeImg.image = UIImage(named: "send-message")
       
               }
        print("123445555555",textView.text)
    }
    @IBAction func voiceRecClickAction() {
        var msgText = messageTextField.text?.count
//        print("Message Send",msgText)
        if  msgText != 0{
           
            print("Message Sendssssss")
            messageSending()
//
        }else{
            
            recordAudio()
//            let recordGesture  = UITapGestureRecognizer(target:self,action:#selector(recordAudio))
//            self.voiceRecordView.addGestureRecognizer(recordGesture)
            print("record Send444444")
        }
    }
    
    func scrollToBottom(){

        
        DispatchQueue.main.async { [self] in
                let section = 0
                let numberOfRows = self.getBulkChatList.count
                
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows - 1, section: section)
                    self.tv.scrollToRow(at: indexPath, at: .bottom, animated: false)

//
                }
            }
    }
    func bulkChatList() {
        
        isNewDataLoading = true
//        recodeImg.image = UIImage(named: "microphone")
        
        chatVoiceRecTime.isHidden = true
//        messageTextField.text = ""
        let param : [String:Int] = [

            "limit" : 10,
            "offset" : ofsetCount,
            "roomId" : roomId,
            "msgId" : 0

            
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetBulkChatRequest.call_request(param: param,token: token){ [self]
            (res) in
//            print("GetBulkChatRes",res)
            let GetBulkChatRes : GetBulkChatListResponse = Mapper<GetBulkChatListResponse>().map(JSONString: res)!
            
            
            
            if GetBulkChatRes.status == true {
                
              
                    
                    getBulkChatList = GetBulkChatRes.data.reversed()
                getBulkChatList2.append(contentsOf: GetBulkChatRes.data.reversed())
                    
                
                deletedMsgs = GetBulkChatRes.deletedMsgs
                    
//                    getBulkChatList.append(contentsOf: GetBulkChatRes.data.reversed())
               
               
               
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                
                if ofsetCount == 0{
                    scrollToBottom()
                }
                
                else{
//                    scrollToBottom()
                    
                }
             
            }else{
                
            }
            
        }
        
        
    }
    @IBAction func messageSending() {
        
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:a"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        let interval = date.timeIntervalSince1970
        
      
        if contentTypeSend == 1 && contentTypeSend == 2 {
            
        }else{
           
            
            
        }
        
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
        
                var encryptedvalue = ""
        
              do {
                  let key = try PKCS5.PBKDF2(
                      password: password,
                      salt: salt,
                      iterations: 1,
                      keyLength: 32,
                      variant: .sha1
                  ).calculate()
                  let aes = try AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7)
        
                  print("contentTypeSend123444",contentTypeSend)
        
                  if contentTypeSend == 1 {
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(filePathVoiceRecord.utf8))
                      print("filePathVoiceRecord",filePathVoiceRecord)
                      let encryptedData = Data(encryptedBytes)
                      encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
                  }else if contentTypeSend == 2 {
                      
                      chatVoiceRecTime.isHidden = true
//                      audioPlayer.stop()
//                      messageTextField.text = ""
                      print("this ios ", VoiceFilePath)
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(VoiceFilePath.utf8))
                      let encryptedData = Data(encryptedBytes)
                      encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
        
                  }
                  else if contentTypeSend == 3{
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(pdfFilePath.utf8))
                      let encryptedData = Data(encryptedBytes)
                      encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
        
                  }
                  else if contentTypeSend == 4{
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(getVimeoUploadUrl.utf8))
                      let encryptedData = Data(encryptedBytes)
                      encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
        
                  }
                  else if contentTypeSend == 5{
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(pdfFilePath.utf8))
                      let encryptedData = Data(encryptedBytes)
                      encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
        
                  }
                  
                  
                  else{
                      let chatText = messageTextField.text
                      messageTextField.text?.removeAll()
                      print("chatText!",chatText!)
                      let inputData = Data()
                      let encryptedBytes = try aes.encrypt(Array(chatText!.utf8))
                      let encryptedData = Data(encryptedBytes)
                  encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
                      print("encryptrd",encryptedvalue)
        
                    //              getBulkChatList.append(encryptedvalue)
                  }
        
        
        
              }
        
                catch {
                    print("error encryption",error)
                }
        
        
                    let contentArr = GetBulkChatListData()
                    contentArr.chatContent = messageTextField.text
                    getBulkChatList.append(contentArr)
        
                    print("getBulkChatList.append", getBulkChatList.append(contentArr))
        
        
     
        
                    print("encrypted value",encryptedvalue)
        
        
        
                    print("contentTypeSend",contentTypeSend)
        
        
                        let sockeModal = socketObject()
                        sockeModal.room_id = roomId
                        sockeModal.user_name = loginUserName
                        print("contentTypeSend123",contentTypeSend)
        
        
                        sockeModal.local_file = getLocalFile
                        if contentTypeSend == 1 {
                            sockeModal.content = encryptedvalue
                            sockeModal.content_type = "IMAGE"
                        }else if contentTypeSend == 2{
                            sockeModal.content = encryptedvalue
                            sockeModal.content_type = "VOICE"
                        }else if contentTypeSend == 3{
        sockeModal.content = encryptedvalue
        sockeModal.content_type = getContentType
        }else if contentTypeSend == 4{
            sockeModal.content = encryptedvalue
            sockeModal.content_type = "VIDEO"
            }
        else if contentTypeSend == 5{
            sockeModal.content = encryptedvalue
            sockeModal.content_type = "PDF"
            }else{
                            sockeModal.content = encryptedvalue
                            sockeModal.content_type = "TEXT"
                        }
        print("encryptedvalue",encryptedvalue)

                        sockeModal.user_id = userId
                        sockeModal.login_id = login_Id
                        sockeModal.date_time = dateString
                        sockeModal.message_status = "pending"
                        sockeModal.sent = false
                        sockeModal.delivered = false
                        sockeModal.seen = false
                        sockeModal.is_deleted = false
        sockeModal.s_is_birthday = IsBday
        print("s_is_birthday",IsBday)
        
        
//                async (user_id, msg_id,chat_room_ids,group_room_ids,msg)
        
//                        if tapType == 1 {
        
        print("ImageroomId \(roomId)")
                            SocketIOManager.sharedInstance.emitMessage(user_id: userId,room_id: roomId,msg_id: dateString, socket_value: sockeModal)
        
//        audioRecorder.stop()
        KRProgressHUD.dismiss()
        SocketIOManager.socket.on("ack_msg") { [self]dataArray, ack in
            print("ack_user_id \(dataArray[0])")
            print("ack_room_id \(dataArray[1])")
            print("ack_msg_id \(dataArray[2])")
            print("chats_ack_value \(dataArray[3])")
//
            bulkChatList()
            tv.dataSource = self
            tv.delegate = self
            tv.reloadData()
        }
        //
//                        }else{
//                            SocketIOManager.sharedInstance.emitMessageSendGroup(user_id: user_Id,room_id: room_Id,msg_id: dateString, socket_value: sockeModal)
//
//                        }
        
        
                        print("sockeModal123",sockeModal)
        
        
    }
    
    
    
    
    
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-11
                print("keyboardSize.height",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction  func PdfFile(){
        mediaFileView.isHidden = true
        photoArray.removeAll()
        SelectedAssets.removeAll()
        arrSelectedFilePath.removeAll()
        
        
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.item], asCopy: false)
        
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        
        
        
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    @objc public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        
        
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        
        print("urldsss",url)
        
        getLocalFile = url.absoluteString
        let fileurl: URL = url as URL
        let filename = url.lastPathComponent
        let fileextension = url.pathExtension
        print("URL: \(fileurl)", "NAME: \(filename)", "EXTENSION: \(fileextension)")
        contentTypeSend = 5
        urls = fileurl
        getContentType = filename
        print("getContentType",getContentType)
        
        
        let imageData = NSData(contentsOf: url)
        
        
        //        self.uploadFileLabel.text = "number of file selected :" + "1"
        
        do {
            pdfData = try Data(contentsOf: url, options: NSData.ReadingOptions())
            
            uploadPDFFileToAWS(pdfData: pdfData! as Data)
            
            
        } catch {
            print("set PDF filer error : ", error)
        }
        
    }
    
    func uploadPDFFileToAWS(pdfData : Data){
        //        self.showLoading()
        
        KRProgressHUD.show()
        
        
        
        let S3BucketName = "alumnite-chalkpz"
        let CognitoPoolID = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a"
        let Region = AWSRegionType.APSouth1
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:Region,identityPoolId:CognitoPoolID)
        let configuration = AWSServiceConfiguration(region:Region, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        // url for image in the bundle
        
        let currentTimeStamp = NSString.init(format: "%ld",Date() as CVarArg)
        let imageNameWithoutExtension = NSString.init(format: "vc_%@",currentTimeStamp)
        let imageName = NSString.init(format: "%@%@",imageNameWithoutExtension, ".pdf")
        
        // signatureImageName = imageName as String
        
        let ext = imageName as String
        //  let imageURL = Bundle.main.url(forResource: "lock_icon", withExtension: ext)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let  currentDate =   dateFormatter.string(from: Date())
        
        
        let fileName = imageNameWithoutExtension
        let fileType = ".pdf"
        
        let imageURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(ext)
        
        do {
            try pdfData.write(to: imageURL)
        }
        catch {}
        
        print(imageURL)
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()
        uploadRequest?.body = imageURL
        uploadRequest?.key =  ext
        uploadRequest?.bucket = S3BucketName
        // uploadRequest?.contentType = "pdf/" + ext
        uploadRequest?.contentType = "application/pdf"
        // upload
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest!).continueWith { [self] (task) -> AnyObject? in
            
            if let error = task.error {
                print("Upload failed : (\(error))")
                KRProgressHUD.dismiss()
            }
            
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent((uploadRequest?.bucket!)!).appendingPathComponent((uploadRequest?.key!)!)
                if let absoluteString = publicURL?.absoluteString {
                    print("Uploaded to:\(absoluteString)")
                    if contentTypeSend == 5 {
                        contentTypeSend = 5
                    }else{
                        contentTypeSend = 3
                    }
                    pdfFilePath = absoluteString
                    messageSending()
                    //                    awsArry.append(absoluteString)
                    let imageDict = NSMutableDictionary()
                    imageDict["FileName"] = absoluteString
                    self.imageUrlArray.add(imageDict)
                    self.convertedImagesUrlArray = self.imageUrlArray
                    
                    
                    
                    
                    //
                    //
                    
                    
                }
            }
            else {
                //                self.hideLoading()
                KRProgressHUD.dismiss()
                print("Unexpected empty result.")
            }
            return nil
        }
    }
    
    
    
    
    
    @IBAction func  uploadViewVc(){
        
        
        
        mediaFileView.isHidden = true
        
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.mediaTypes = ["public.movie"]
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let url = info[.mediaURL] as? URL {
            // Handle the selected video URL here
            print("oplddd",url)
            
            VimeoURL = url
            getLocalFile = url.absoluteString
//            uploadVideo(fileUrl: VimeoURL)
            let S3BucketName = "alumnite-chalkpz"
            let CognitoPoolID = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a"
            let Region = AWSRegionType.APSouth1
            let videoURL = URL(fileURLWithPath: VimeoURL.absoluteString)
            let bucket = S3BucketName
            let key = CognitoPoolID
//            uploadVideoToS3(videoURL: videoURL, bucket: bucket, key: key)
//            tapUploadVideo()
            uploadVideoVimeoo(videoURL: VimeoURL, accessToken: VimeoAuthorization)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func uploadVideo(fileUrl : URL){

      let newKey = "video/1.mov"

      let uploadRequest = AWSS3TransferManagerUploadRequest()
      uploadRequest?.body = fileUrl as URL
      uploadRequest?.key = newKey
      uploadRequest?.bucket = "alumnite-chalkpz"
      uploadRequest?.acl = AWSS3ObjectCannedACL.publicRead
      uploadRequest?.contentType = "movie/mov"

      uploadRequest?.uploadProgress = { (bytesSent, totalBytesSent, totalBytesExpectedToSend) -> Void in
          DispatchQueue.main.async(execute: {
              let amountUploaded = totalBytesSent // To show the updating data status in label.
              print("amountUploaded",amountUploaded)
          })
      }

      let transferManager = AWSS3TransferManager.default()
      transferManager.upload(uploadRequest!).continueWith(executor: AWSExecutor.mainThread(), block: { (task) in
          if task.error != nil {
              print(task.error.debugDescription)
          } else {
              // Do something with your result.
              print("done")
              print("uploadRequest",uploadRequest)
          }
          return nil
      })

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
//    func uploadVideoToS3(videoURL: URL, bucket: String, key: String) {
//        let transferUtility = AWSS3TransferUtility.default()
//        let expression = AWSS3TransferUtilityUploadExpression()
//
//        print("uploadVideoToS3")
//        transferUtility.uploadFile(videoURL,
//                                   bucket: bucket,
//                                   key: key,
//                                   contentType: "MOV", // Adjust as per your video type
//                                   expression: expression) { (task, error) in
//            if let error = error {
//                print("Upload failed: \(error)")
//            } else {
//                print("Upload completed successfully.")
//            }
//        }
//    }
//
//
//
//    @IBAction func tapUploadVideo() {
//
//        //guard let path = Bundle.main.path(forResource: "Video", ofType: "mov") else { return }
//        print("VimeoURL.absoluteString",VimeoURL.absoluteString)
//        let videoURL = URL(fileURLWithPath: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
//        AWSS3Manager.shared.uploadVideo(videoUrl: videoURL, progress: { [weak self] (progress) in
//
//
//
//            guard let strongSelf = self else { return }
//
//        }) { [weak self] (uploadedFileUrl, error) in
//
//            guard let strongSelf = self else { return }
//            if let finalPath = uploadedFileUrl as? String {
//
//                print("finalPath123!111",finalPath)
//
//
//            } else {
//                print("\(String(describing: error?.localizedDescription))")
//            }
//        }
//
//
//
//
//
//    }
    
    
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
    
    
    func uploadVideoVimeoo(videoURL: URL, accessToken: String) {
        KRProgressHUD.show(withMessage: "Uploading Video....")
        initiateVideoUpload(accessToken: accessToken) { [self] uploadLink in
            guard let uploadLink = uploadLink else {
                KRProgressHUD.dismiss()
                print("Failed to initiate video upload.")
                return
            }
            
            guard let videoData = try? Data(contentsOf: videoURL) else {
                KRProgressHUD.dismiss()
                print("Error: Unable to read video data.")
                return
            }
            
            uploadVideoChunk(videoData: videoData, uploadURL: uploadLink) { success in
                if success {
                    
                    KRProgressHUD.dismiss()
                    print("Video upload successful.",uploadLink)
                    
                    //             uploadfileNameLabel.text = "Video is Selected"
                    
                    print("Video upload successful.")
                } else {
                    KRProgressHUD.dismiss()
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
                    contentTypeSend = 4
                    messageSending()
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
    
    
    
    @IBAction func open_camera(){
        
        mediaFileView.isHidden = true
    //        selectPhotoView.isHidden = true
            
            let camera_controller = CameraViewController
            
           
            { [weak self] image, asset in

                
                
                self!.photoArray.append(image! as UIImage)
                //
                
                
                
                
                self!.getImageURL(images: self!.photoArray)
//                self!.selUploadImg.image = image!
//                self!.browseView.isHidden = true
//                self!.uploadLbl.isHidden = true
//                self!.uploadImg.isHidden = true
              
                self?.dismiss(animated: true, completion: nil)

            }

            present(camera_controller, animated: true, completion: nil)

                
        
//        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
//            picker.allowsEditing = false
//            picker.sourceType = UIImagePickerController.SourceType.camera
//            picker.cameraCaptureMode = .photo
//            picker.modalPresentationStyle = .fullScreen
//            present(picker, animated: true, completion: nil)
//        }
//        else {
//            noCamera()
//        }
        
    }
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera",preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
    }
    
    @objc func dismissKeyboard() {
        
        mediaFileView.isHidden = true
        MediaFileHeight.constant = 0
        
    }
    
    
    
    //    @IBAction func messageTapKeyboard() {
    //        messageTextfield.keyboardType = .webSearch
    //        bottomHeight.constant = 285
    //
    //    }
    //
    
    @IBAction func backVc() {
        
        dismiss(animated: true,completion: nil)
        
    }
    
    
    @IBAction func MediaFileVc() {
        
        mediaFileView.isHidden = false
        MediaFileHeight.constant = 80
        
    }
    
    
    
    @objc func ordersFinishedPlaying( _ myNotification:NSNotification ) {
        
        let selectedTime: CMTime = CMTimeMake(value: Int64(0 * 1000 as Float64), timescale: 1000)
        player?.seek(to: selectedTime)
        
        print("Player finished")
        //        audioImg.image = UIImage(named: " play")
        
        //        audioImg.image = UIImage(named: "play_green")
        
    }
    
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let interval = Int(interval)
        
        let seconds = interval % 60
        
        let minutes = (interval / 60) % 60
        
        let hours = (interval / 3600)
        
        return String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider) {
        
        let seconds : Int64 = Int64(playbackSlider.value)
        
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0 {
            
            player?.play()
            
        }
        
    }
    
    
    
    
    
    @IBAction func OrderplayAudio(gesture : PlayGesture) {
        
        print("play Button")
        
        if player?.rate == 0
            
        {
            player!.play()
            gesture.img.image = UIImage(named: "pause_icon")
            
        } else {
            
            player!.pause()
            
            gesture.img.image = UIImage(named: "play")
            
        }
        
        
    }
    
    
    
    
    
    
    func check_record_permission()
    {
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSession.RecordPermission.granted:
            isAudioRecordingGranted = true
            break
        case AVAudioSession.RecordPermission.denied:
            isAudioRecordingGranted = false
            break
        case AVAudioSession.RecordPermission.undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission({ (allowed) in
                if allowed {
                    self.isAudioRecordingGranted = true
                } else {
                    self.isAudioRecordingGranted = false
                }
            })
            break
        default:
            break
        }
    }
    
    
    
    
    
    
    
    @IBAction  func open_gallery(){
        mediaFileView.isHidden = true
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
                
                mediaFileView.isHidden = true
                self.arrSelectedFilePath.append(PicsLocalPath)
                
                print("pathImg",PicsLocalPath)
                getLocalFile = PicsLocalPath.absoluteString
                self.SelectedAssets.append(assets[i])
                
                
                print("SelectedAssets",SelectedAssets)
            }
            
            self.convertAssetToImages()
            
        })
        
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
                
            }
            
            print("photoArray.count" ,photoArray.count)
            
            //              uploadImage(imageData: photoArray[0])
            
            
            print("photoArray.count" ,photoArray.count)
            
        }
        
        print("complete phto array \(self.photoArray)")
        getImageURL(images: photoArray)
//        uploadImage(imageData: photoArray[0])
        
    }
    
    func getImageURL(images : [UIImage]){
        
        
        self.originalImagesArray = images
        self.totalImageCount = images.count
        if currentImageCount < images.count{
            self.uploadAWS(image: images[currentImageCount])
        }
    }
    
    func uploadAWS(image : UIImage){
        KRProgressHUD.show()
        
        let S3BucketName = "alumnite-chalkpz"
        let CognitoPoolID = "ap-south-1:5358f3d7-ec74-4bf5-8b69-df26a06ebd6a"
        let Region = AWSRegionType.APSouth1
        
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:Region,identityPoolId:CognitoPoolID)
        let configuration = AWSServiceConfiguration(region:Region, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        // url for image in the bundle
        
        let currentTimeStamp = NSString.init(format: "%ld",Date() as CVarArg)
        let imageNameWithoutExtension = NSString.init(format: "vc_%@",currentTimeStamp)
        let imageName = NSString.init(format: "%@%@",imageNameWithoutExtension, ".jpg")
        
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
                   
                    
                    self.contentTypeSend = 1
                    
                   
                    self.filePathVoiceRecord = absoluteString
                    
                    self.messageSending()
                    imageStr.append(absoluteString)
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
//                            contentTypeSend = 1
//                            messageSending()
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
    
    
   

    private func textViewShouldReturn(textView: UITextView!) -> Bool {
        self.view.endEditing(true)
        
        bottomHeight.constant = 5
        
        galleryView.isHidden = false
        CameraView.isHidden = false
        galleryWidth.constant = 50
        cameraWidth.constant = 50
        recodeImg.image = UIImage(named: "microphone")
        print("keyboard worked")
        //         messageTextfield.resignFirstResponder()
        //        {
        ////                       messageTextfield.resignFirstResponder()
        //                       bottomViewConstaints.constant = 300
        //                   }
        //
        //                   else {
        //                       bottomViewConstaints.constant = 300
        //                   }
        return false
        }
    

   
    func  textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           // Update image based on text length
         
        if text == "\n" {
//            recodeImg.image = UIImage(named: "microphone")

            let newText = (textView.text as NSString?)?.replacingCharacters(in: range, with: text) ?? ""
            updateImageBasedOnTextLength(newText.count)
         messageTextField.resignFirstResponder()
            
            return false
        }else {
//            recodeImg.image = UIImage(named: "send-message")
            galleryView.isHidden = true
            CameraView.isHidden = true
            cameraWidth.constant = 0
            galleryWidth.constant = 0
        }
           return true
       }

    
    
  


       // Update image based on text length
       func updateImageBasedOnTextLength(_ count: Int) {
           if  count > 0 {
               
               recodeImg.image = UIImage(named: "send-message")
               
               galleryView.isHidden = true
               CameraView.isHidden = true
               cameraWidth.constant = 0
               galleryWidth.constant = 0
           }else{
               galleryView.isHidden = false
               CameraView.isHidden = false
               galleryWidth.constant = 50
               cameraWidth.constant = 50
               recodeImg.image = UIImage(named: "microphone")
           }
       }
    @IBAction func recordAudio(){
        if(isRecording)
        {
            finishAudioRecording(success: true)
        
            galleryView.isHidden = false
                        contentTypeSend = 2
            isRecording = false
        }
        else
        {
            setup_recorder()
            
                            contentTypeSend = 2
            
            audioRecorder.record()
            meterTimer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:#selector(self.updateAudioMeter(timer:)), userInfo:nil, repeats:true)
            
            chatVoiceRecTime.isHidden = false
            
                            recodeImg.image = UIImage(named: "send-message")
            //                recordTimeLbl.isHidden = false
            CameraView.isHidden = true
            galleryView.isHidden = true
            
            isRecording = true
        }
    }
    
    func setup_recorder()
    {
        if isAudioRecordingGranted
        {
            let session = AVAudioSession.sharedInstance()
            do
            {
                try session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
                try session.setActive(true)
                let settings = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                    AVSampleRateKey: 44100,
                    AVNumberOfChannelsKey: 2,
                    AVEncoderAudioQualityKey:AVAudioQuality.high.rawValue
                ]
                audioRecorder = try AVAudioRecorder(url: getFileUrl(), settings: settings)
                audioRecorder.delegate = self
                audioRecorder.isMeteringEnabled = true
                audioRecorder.prepareToRecord()
            }
            catch let error {
                display_alert(msg_title: "Error", msg_desc: error.localizedDescription, action_title: "OK")
            }
        }
        else
        {
            display_alert(msg_title: "Error", msg_desc: "Don't have access to use your microphone.", action_title: "OK")
        }
    }
    
    
    func display_alert(msg_title : String , msg_desc : String ,action_title : String)
    {
        let ac = UIAlertController(title: msg_title, message: msg_desc, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: action_title, style: .default)
                     {
            (result : UIAlertAction) -> Void in
            _ = self.navigationController?.popViewController(animated: true)
        })
        present(ac, animated: true)
    }
    
    func getDocumentsDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
    {
        if !flag
        {
            finishAudioRecording(success: false)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        //        recodeBtn.isEnabled = true
    }
    
    
    func getFileUrl() -> URL
    {
        let filename = "myRecording.m4a"
        let filePath = getDocumentsDirectory().appendingPathComponent(filename)
        print("filePath!",filePath)
        getLocalFile = filePath.absoluteString
                contentTypeSend = 2
        
        
        
        let audioUrl = URL(fileURLWithPath: filePath.path)
        AWSS3Manager.shared.uploadAudio(audioUrl: audioUrl, progress: { [weak self] (progress) in
            
            
            
            print("audioUrl!",audioUrl)
            guard let strongSelf = self else { return }
            
        }) { [weak self] (uploadedFileUrl, error) in
            
            guard let strongSelf = self else { return }
            if let finalPath = uploadedFileUrl as? String {
                
                print("finalPath123!",finalPath)
            
                self!.VoiceFilePath = filePath.absoluteString
//                                    self!.messageSending()
                
            } else {
                print("\(String(describing: error?.localizedDescription))")
            }
        }
        
        
        
        return filePath
    }
    
    
    
    func finishAudioRecording(success: Bool)
    {
        if success
        {
            audioRecorder.stop()
            audioRecorder = nil
            meterTimer.invalidate()
            
            print("recorded successfully.4543234565434567")
//            messageTextField.text = ""
            messageSending()
        }
        else
        {
            display_alert(msg_title: "Error", msg_desc: "Recording failed.", action_title: "OK")
        }
    }
    
    
    @objc func updateAudioMeter(timer: Timer)
    {
        if audioRecorder.isRecording
        {
            let hr = Int((audioRecorder.currentTime / 60) / 60)
            let min = Int(audioRecorder.currentTime / 60)
            let sec = Int(audioRecorder.currentTime.truncatingRemainder(dividingBy: 60))
            let totalTimeString = String(format: "%02d:%02d:%02d", hr, min, sec)
//                        messageTextField.text = totalTimeString
            chatVoiceRecTime.text = totalTimeString
           
            audioRecorder.updateMeters()
        }
    }
    
    
    
    func formatMinuteSeconds(_ totalSeconds: Int) -> String {
        
        let minutes = Double(totalSeconds) / 60;
        let seconds = totalSeconds % 60;
//                messageTextField.text = String(seconds)
        
        chatVoiceRecTime.text = String(seconds)
        return String(format:"%02d:%02d", minutes, seconds);
    }
    
    
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            if ofsetCount == 0{
                return  getBulkChatList.count
            }else{
                
                
                
                return  getBulkChatList2.count
            }
           
        }else{
            return  getBulkChatList.count

        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifer2) as!
        Profile
        cell.profilePickImg.layer.cornerRadius = 25
        
        cell.profilePickImg.sd_setImage(with: URL(string:  userImg), placeholderImage: UIImage(named: "image 2"))

        cell.nameLbl.text =  userName
        cell.InstuteLbl.text = instituteNameStr
        cell.companyNameLbl.text = cNameStr
        cell.destinationLbl.text = designationStr
        cell.batchLbl.text = batchStr

        
       
        return cell
    }
    
    
    @IBAction func ZommVc(ges : PlayGesture ){
        print("zoom working in webview tap")
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.imgs
        viewController.profileImg = ges.imgs
        viewController.redirectType = ges.gesRedirctType
//        viewController.deleteHide  = 1
        
        
//
//        viewController.redirectType = ges.gesRedirctType
//
//        viewController.collecionId = ges.getCollectionId
//
//        viewController.galleryTitle = ges.galleryTitleLbl
//        viewController.getGalleryPhotos = ges.getPhotos
        print("ges.img",ges.imgs)
       present(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        intArr.removeAll()
        galleryView.isHidden = false
        CameraView.isHidden = false
        galleryWidth.constant = 50
        cameraWidth.constant = 50
        
        if ofsetCount == 0{
            
        
        
        
        
        
        
    
        let bulkChat : GetBulkChatListData = getBulkChatList[indexPath.row]
        if bulkChat.content_type == "TEXT" {
            if userId == bulkChat.user_id {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                
                
                let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                deleteGesture.msgIdInt = bulkChat.msg_id
                deleteGesture.roomId = bulkChat.room_id
//                    deleteGesture.
                cell.senderTextView.addGestureRecognizer(deleteGesture)
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                    cell.selectionStyle = .none
                    
                    intArr.removeAll()

                    
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.senderTextView.addGestureRecognizer(deleteGesture)
                    
                    
                    
                    print("deleteGesture.msgId",deleteGesture.msgId)
                    
                    if bulkChat.seen == true {
                        cell.tickImg.image = UIImage(named: "read")
                        cell.tickImg.tintColor = .green
                        
                    }else   if bulkChat.delivered == true {
                        cell.tickImg.image = UIImage(named: "read")
                        cell.tickImg.tintColor = .gray
                    }else{
                        cell.tickImg.image = UIImage(named: "check-mark")
                        cell.tickImg.tintColor = .black
                    }
                    
                }catch {
                    print("error encryption",error)
                }
                
                
                print("userId bulkChat.user_id",userId,bulkChat.user_id)
                print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                
                cell.senderDateTextLbl.isHidden = false

                cell.senderDateTextLbl.text = bulkChat.date_time
                cell.senderMessageLbl.text = decrypted
                
                print("decrypteddecrypted",decrypted)
                cell.senderTextView.isHidden = false
//                cell.senderWebView.isHidden = true
                
                cell.senderVoiceView.isHidden = true
                cell.ImgPdfVideoView.isHidden = true
                
                
                print("deletedMsgId",deletedMsgId)
                
                
                for i in deletedMsgId {
                    if  i == bulkChat.msg_id {
                        cell.senderDateTextLbl.isHidden = true
                        cell.senderMessageLbl.text = "This message has been deleted"
                    }
                    
                }
                
//                for i in deletedMsgs {
////                    if  i == bulkChat.msg_id {
//                        cell.senderDateTextLbl.isHidden = true
//                        cell.senderMessageLbl.text = "This message has been deleted"
////                    }
//
//                }
                
                if bulkChat.is_delete == true {
                    cell.senderDateTextLbl.isHidden = true
                    cell.senderMessageLbl.text = "This message has been deleted"
                }
                
//                cell.webViewHeight.constant = 0
//                cell.senderVoiceView.isHidden = true
//                cell.senderVideoView.isHidden = true
//                cell.senderImgView.isHidden = true
                
                
                return cell
                
                
                
            }else{
                
                
                
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    let vc  = PlayGesture(target: self, action: #selector(ZommVc))
                    vc.imgs = decrypted
                    
                    vc.gesRedirctType = "chat"
                    
                    cell.ResiverimgPdfVoiceView.addGestureRecognizer(vc)
                    
                  
                    cell.selectionStyle = .none
                    
                }catch {
                    print("error encryption",error)
                }
                
                
                
                print("userId bulkChat.user_id",userId,bulkChat.user_id)
                
                print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                
                
                
                
                
                print("userId bulkChat.user_idElse",decrypted)
                
                cell.ResiverimgPdfVoiceView.isHidden = true
                cell.resiverMessaageView.isHidden = false
                cell.ResivevoicefullView.isHidden = true
                
                cell.receiverDateLbl.text = bulkChat.date_time
                cell.recieverMessageLbl.text = decrypted
                
                for i in deletedMsgs {
                    if  i == bulkChat.msg_id {
                        cell.receiverDateLbl.isHidden = true
                        cell.recieverMessageLbl.text = "This message has been deleted"
                    }
                    
                }
                
                
                return cell
                
                //                }
            }
            
        } else if bulkChat.content_type == "IMAGE" {
            if userId == bulkChat.user_id {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    cell.selectionStyle = .none
                }catch {
                    print("error encryption",error)
                }
                
                
                print("userId bulkChat.user_id",userId,bulkChat.user_id)
                //                    if userId == bulkChat.user_id {
                print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                
                
                let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                deleteGesture.msgIdInt = bulkChat.msg_id
                deleteGesture.roomId = bulkChat.room_id
//                    deleteGesture.
                cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                
                
                cell.senderTextView.isHidden = true
                
                cell.ImgPdfVideoView.isHidden = false
                cell.senderVoiceView.isHidden = true
//
                cell.selectionStyle = .none
            
                cell.ImgPdfVideoView.isUserInteractionEnabled = true
                
              
                
                cell.senderWebView.isUserInteractionEnabled = true
                
                let vc  = PlayGesture(target: self, action: #selector(ZommVc))
                vc.imgs = decrypted
                
                vc.gesRedirctType = "chat"
                cell.senderWebView.isUserInteractionEnabled = true
                cell.senderWebView.addGestureRecognizer(vc)
                
                if bulkChat.seen == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .green
                    
                }else   if bulkChat.delivered == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .gray
                }else{
                    cell.imgTickImg.image = UIImage(named: "check-mark")
                    cell.imgTickImg.tintColor = .black

                }
                
               
                
                
                
                
                
                
                
                
                
//
//          let imageUrl = decrypted
//
//                // HTML content with an image tag and CSS style to resize
//                let htmlString = """
//                <html>
//                    <head>
//                        <style>
//                            img {
//                                max-width: 300px; /* Maximum width of 170px */
//                                max-height: 500px; /* Maximum height of 170px */
//                                width: auto;
//                                height: auto;
//                            }
//                        </style>
//                    </head>
//                    <body>
//                        <img src="\(imageUrl)" />
//                    </body>
//                </html>
//                """
//
//                cell.senderWebView.loadHTMLString(htmlString, baseURL: nil)
            
                
                if decrypted == ""{
                    
                    
                }else{
                    
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.senderWebView.load(requestObj)
                    cell.senderDateAndtimes.text = bulkChat.date_time

                }
//
               
                
                cell.senderDateAndtimes.isHidden = false
                for i in deletedMsgId {
                    if  i == bulkChat.msg_id {
                        cell.senderDateAndtimes.isHidden = false

                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    
                }
                
                
                
                if bulkChat.is_delete == true {
                    cell.senderDateAndtimes.isHidden = false

                    cell.senderWebView.isHidden = true
                    cell.senderDateAndtimes.text = "This message has been deleted"
                }
                return cell
                
                
                
              
                
                
            }else{
                
                
                
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                cell.selectionStyle = .none
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
                
                
              
                
                cell.ResiverimgPdfVoiceView.isHidden = false
                cell.resiverMessaageView.isHidden = true
                cell.ResivevoicefullView.isHidden = true
                
                
                if decrypted == ""{
                    
                    
                    
                }
                
                else{
                    
                    
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.receiverWebView.load(requestObj)
                    cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                    let vc  = PlayGesture(target: self, action: #selector(ZommVc))
                    vc.imgs = decrypted
                    
                    vc.gesRedirctType = "chat"
                    cell.receiverWebView.isUserInteractionEnabled = true
                    cell.receiverWebView.addGestureRecognizer(vc)
                    
                }
                
               
                
                
                
                for i in deletedMsgs {
                    if  i == bulkChat.msg_id {
                        cell.resiverDateAndTimeLbl.isHidden = false
                        cell.receiverWebView.isHidden = true
                        cell.resiverDateAndTimeLbl.text = "This message has been deleted"
                    }
                    
                }
                
                print("userId bulkChat.user_id",userId,bulkChat.user_id)
                
                print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                
                
                
                
                
                print("userId bulkChat.user_idElse",userId,bulkChat.user_id)
                
                
                
                //
                
//                cell.messageView.isHidden = true
//                cell.imgView.isHidden = false
//                cell.audioView.isHidden = true
//                cell.img.sd_setImage(with: URL(string:  decrypted), placeholderImage: UIImage(named: "Avatar"))
//
//
//
//                cell.imgDateLbl.text = bulkChat.date_time
//
//                cell.recieverImgHeight.constant = 200
//
//                cell.overAllViewHeight.constant = 300
//                cell.overAllWidth.constant = 300
//
                
                return cell
                
            }
        }else if bulkChat.content_type == "VOICE" {
            if userId == bulkChat.user_id {
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                cell.selectionStyle = .none
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                deleteGesture.msgIdInt = bulkChat.msg_id
                deleteGesture.roomId = bulkChat.room_id
//                    deleteGesture.
                cell.senderVoiceView.addGestureRecognizer(deleteGesture)
                
                
                cell.ImgPdfVideoView.isHidden = true
                cell.senderTextView.isHidden = true
                cell.senderVoiceView.isHidden = false
                cell.voiceHeight.constant = 70
//                //
                
               
                
                cell.selectionStyle = .none
////                cell.senderOverAllWidth.constant = 350
//
//
//                //                    cell.audioView.isHidden = true
//
//                //
                cell.senderVoiceDateLbl.text = bulkChat.date_time
                
                print("voic345678e",decrypted)
                
                cell.audioFileURL = decrypted
//                let url = URL(string: decrypted)
//                print("filePathUrl",url)
//
//                let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
//
//                player = AVPlayer(playerItem: playerItem)
//                cell.senderSlider.minimumValue = 0
//                let duration : CMTime = playerItem.asset.duration
//                let seconds : Float64 = CMTimeGetSeconds(duration)
//
//
//                let currentDuration : CMTime = playerItem.currentTime()
//
//                let currentSeconds : Float64 = CMTimeGetSeconds(currentDuration)
//                //                recieverLabelCurrentTime.isHidden = true
//
                //                cell.senderLabelCurrentTime.text = self.stringFromTimeInterval(interval: currentSeconds)
                
                
                
                if bulkChat.seen == true {
                    cell.tickImg.image = UIImage(named: "read")
                    cell.tickImg.tintColor = .green
                    
                }else   if bulkChat.delivered == true {
                    cell.tickImg.image = UIImage(named: "read")
                    cell.tickImg.tintColor = .gray
                }else{
                    cell.tickImg.image = UIImage(named: "check-mark")
                    cell.tickImg.tintColor = .black

                }
                
//                cell.senderSlider.maximumValue = Float(seconds)
//                cell.senderSlider.isContinuous = true
//                cell.senderSlider.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
//
//
//
//
//
//
//
//
//
//                NotificationCenter.default.addObserver(self, selector: #selector(self.ordersFinishedPlaying(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
//                //                                    audioImg = cell.img
//
//                player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
//
//                    if self.player!.currentItem?.status == .readyToPlay {
//
//                        let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                        
//                        cell.senderSlider.value = Float ( time );
//                        cell.senderLabelCurrentTime.isHidden = false
//                        cell.senderLabelCurrentTime.text = self.stringFromTimeInterval(interval: time)
//
//                    }
//                    //
//                    let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
//
//                    if playbackLikelyToKeepUp == false{
//                        print("buffering")
//                    }
//
//                    else {
//                        print("Buffering completed")
//                    }
//                }
//
//                let playGesture = PlayGesture(target: self, action: #selector(OrderplayAudio))
//                playGesture.img = cell.senderPlayImage
//                cell.senderPlayView.addGestureRecognizer(playGesture)
//
                
//
                cell.senderSpecficVoiceView.isHidden = false
                
                
                for i in deletedMsgId {
                    if  i == bulkChat.msg_id {
                        cell.senderVoiceView.isHidden = false
                    cell.senderSpecficVoiceView.isHidden = true
                    cell.senderVoiceDateLbl.text = "This message has been deleted"
                    }
                    
                }
                
                
                if bulkChat.is_delete == true {
                    cell.senderVoiceView.isHidden = false
                    cell.senderSpecficVoiceView.isHidden = true
                    cell.senderVoiceDateLbl.text = "This message has been deleted"
                }
                return cell
                
                
                
            }else{
                
                
                
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                cell.selectionStyle = .none
                
                var decrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
                
                cell.ResiverimgPdfVoiceView.isHidden = true
                cell.resiverMessaageView.isHidden = true
                cell.ResivevoicefullView.isHidden = false
                
                cell.audioFileURL = decrypted
                print("voic345678e",decrypted)
                
//
//                let url = URL (string: decrypted)
//                let requestObj = URLRequest(url: url!)
//                cell.receiverWebView.load(requestObj)
//                cell.resiverDateAndTimeLbl.text = bulkChat.date_time
//
//
//                cell.audioView.isHidden = false
//                cell.messageView.isHidden = true
//                cell.imgView.isHidden = true
//                cell.overAllWidth.constant = 350
//                //                    cell.senderVoiceView.isHidden = true
//
//                //
//                cell.audioView.backgroundColor = .lightGray
//
//                cell.receiverDateLbl.text = bulkChat.date_time
//                cell.recieverAudioHeight.constant = 60
////                cell.overAllViewHeight.constant = 80
//
//                let url = URL(string: decrypted)
////                print("filePathUrl",url)
//
//                let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
//
//                player = AVPlayer(playerItem: playerItem)
//                cell.recieverSlider.minimumValue = 0
//                let duration : CMTime = playerItem.asset.duration
//                let seconds : Float64 = CMTimeGetSeconds(duration)
//
//
//                let currentDuration : CMTime = playerItem.currentTime()
//
//                let currentSeconds : Float64 = CMTimeGetSeconds(currentDuration)
//
//                cell.recieverLabelCurrentTime.text = self.stringFromTimeInterval(interval: currentSeconds)
//
//                cell.recieverSlider.maximumValue = Float(seconds)
//                cell.recieverSlider.isContinuous = true
//                cell.recieverSlider.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
//                //
//
//                NotificationCenter.default.addObserver(self, selector: #selector(self.ordersFinishedPlaying(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
//
//
//                player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
//
//                    if self.player!.currentItem?.status == .readyToPlay {
//
//                        let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
//
//                        cell.recieverSlider.value = Float ( time );
//                        cell.recieverLabelCurrentTime.isHidden = false
//                        cell.recieverLabelCurrentTime.text = self.stringFromTimeInterval(interval: time)
//
//                    }
//
//                    let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
//
//                    if playbackLikelyToKeepUp == false{
//                        print("buffering")
//                    }
//
//                    else {
//                        print("Buffering completed")
//                    }
//                }
                
                
//                let playGesture = PlayGesture(target: self, action: #selector(OrderplayAudio))
//                playGesture.img = cell.recieverPlayImage
//                cell.recieverPlayView.addGestureRecognizer(playGesture)
//
                return cell
                
            }
        }else if bulkChat.content_type == "VIDEO" {
            if userId == bulkChat.user_id {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                
                
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                cell.selectionStyle = .none
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
//                cell.messageCondetStackView.isHidden = true
//                cell.senderWebView.isHidden = false
                
                
                if bulkChat.seen == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .green
                    
                }else   if bulkChat.delivered == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .gray
                }else{
                    cell.imgTickImg.image = UIImage(named: "check-mark")
                    cell.imgTickImg.tintColor = .black

                }
                
                
                
                
               
                cell.senderTextView.isHidden = true
                cell.senderVoiceView.isHidden = true
                cell.ImgPdfVideoView.isHidden = false
//                cell.webViewHeight.constant = 170
//                cell.webViewHeight.constant = 179
                
                
//                cell.senderTextView.isHidden = true
//                cell.senderVoiceView.isHidden = true
//                cell.senderVideoView.isHidden = false
////                cell.senderImgView.isHidden = true
////                cell.senderPdfView.isHidden = true
//                print("Videodecrypted",decrypted)
                
                if decrypted == ""{
                    
                    
                }
                else{
                    
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.senderWebView.load(requestObj)
                    
                }
               
                cell.senderDateAndtimes.text = bulkChat.date_time
                
                cell.senderDateAndtimes.isHidden = false
                
                cell.selectionStyle = .none
                cell.ImgPdfVideoView.isUserInteractionEnabled = true

                let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                deleteGesture.msgIdInt = bulkChat.msg_id
                deleteGesture.roomId = bulkChat.room_id
                cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                
                cell.senderWebView.isUserInteractionEnabled = false

                
                for i in deletedMsgId {
                    if  i == bulkChat.msg_id {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    
                }
                
                
                
                if bulkChat.is_delete == true {
                    cell.senderWebView.isHidden = true
                    cell.senderDateAndtimes.text = "This message has been deleted"
                }
                
//
                return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
            
            let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
            let salt: [UInt8] = Array("120495030296".utf8)
            let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
            
            
            cell.selectionStyle = .none
            var decrypted = ""
            var demoImgdecrypted = ""
            
            do {
                
                let key = try PKCS5.PBKDF2(
                    password: password,
                    salt: salt,
                    iterations: 1,
                    keyLength: 32,
                    variant: .sha1
                ).calculate()
                
                let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                
                
                
            }catch {
                print("error encryption",error)
            }
            
            
            cell.ResiverimgPdfVoiceView.isHidden = false
            cell.resiverMessaageView.isHidden = true
            cell.ResivevoicefullView.isHidden = true
            
            
            print(" decrypteddecrypteddecrypteddecrypteddecrypteddecrypteddecrypted",decrypted)
            
            let url = URL (string: decrypted)
            let requestObj = URLRequest(url: url!)
            cell.receiverWebView.load(requestObj)
            cell.resiverDateAndTimeLbl.text = bulkChat.date_time
            
           
            
            
            return cell
        }
        
        }else if bulkChat.content_type == "PDF" {
            print("bulkChat.content_type",bulkChat.content_type)
            if userId == bulkChat.user_id {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                
                cell.selectionStyle = .none
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
                if bulkChat.seen == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .green
                    
                }else   if bulkChat.delivered == true {
                    cell.imgTickImg.image = UIImage(named: "read")
                    cell.imgTickImg.tintColor = .gray
                }else{
                    cell.imgTickImg.image = UIImage(named: "check-mark")
                    cell.imgTickImg.tintColor = .black

                }
                cell.senderTextView.isHidden = true
                
                cell.ImgPdfVideoView.isHidden = false
             
                cell.senderVoiceView.isHidden = true
                
                cell.ImagePdfVideoHeight.constant  = 150
//                cell.messageCondetStackView.isHidden = true
//                cell.senderWebView.isHidden = false
//                cell.webViewHeight.constant = 179
//
//                cell.senderTextView.isHidden = true
//                cell.senderVoiceView.isHidden = true
//                cell.senderVideoView.isHidden = false
////                cell.senderImgView.isHidden = true
////                cell.senderPdfView.isHidden = true
                print("pdffffffffff",decrypted)
                let url = URL (string: decrypted)
                let requestObj = URLRequest(url: url!)
                cell.senderWebView.load(requestObj)
                
                
                cell.selectionStyle = .none
                
                cell.ImgPdfVideoView.isUserInteractionEnabled = true

                let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                deleteGesture.msgIdInt = bulkChat.msg_id
                deleteGesture.roomId = bulkChat.room_id
                cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                
                
                cell.senderDateAndtimes.text = bulkChat.date_time
                
                cell.senderWebView.isHidden = false
                for i in deletedMsgId {
                    if  i == bulkChat.msg_id {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    
                }
                
                
                
                if bulkChat.is_delete == true {
                    cell.senderWebView.isHidden = true
                    cell.senderDateAndtimes.text = "This message has been deleted"
                }
                
                
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                cell.selectionStyle = .none
                
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
                print("ebulkChat.chatContent",bulkChat.chatContent)
                
                cell.ResiverimgPdfVoiceView.isHidden = false
                cell.resiverMessaageView.isHidden = true
                cell.ResivevoicefullView.isHidden = true
                
                cell.ImagePdfVideoHeight.constant  = 150
                let url = URL (string: decrypted)
                let requestObj = URLRequest(url: url!)
                cell.receiverWebView.load(requestObj)
                cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                
                
                return cell
            }
        }
    
            else{
                if userId == bulkChat.user_id {
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    //                cell.senderVoiceView.isHidden = true
                    //                cell.senderImgView.isHidden = true
                    cell.senderTextView.isHidden = true
                    //                cell.senderPdfView.isHidden = true
                    //                cell.senderVideoView.isHidden = false
                    
                    
                    cell.selectionStyle = .none
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    if bulkChat.seen == true {
                        cell.tickImg.image = UIImage(named: "read")
                        cell.tickImg.tintColor = .green
                        
                    }else   if bulkChat.delivered == true {
                        cell.tickImg.image = UIImage(named: "read")
                        cell.tickImg.tintColor = .gray
                    }else{
                        cell.tickImg.image = UIImage(named: "check-mark")
                        cell.tickImg.tintColor = .black
                    }
                    cell.senderTextView.isHidden = true
                    
                    cell.ImgPdfVideoView.isHidden = false
                    cell.senderVoiceView.isHidden = true
                    
                    
                    cell.selectionStyle = .none
                    cell.ImagePdfVideoHeight.constant  = 150
                    
                    //                cell.messageCondetStackView.isHidden = true
                    //                cell.senderWebView.isHidden = false
                    //                cell.webViewHeight.constant = 179
                    //
                    //                cell.senderTextView.isHidden = true
                    //                cell.senderVoiceView.isHidden = true
                    //                cell.senderVideoView.isHidden = false
                    ////                cell.senderImgView.isHidden = true
                    ////                cell.senderPdfView.isHidden = true
                    
                    if decrypted == ""{
                        
                        
                        
                    }else{
                        
                        
                        
                        print("pdffffffffff",decrypted)
                        let url = URL (string: decrypted)
                        let requestObj = URLRequest(url: url!)
                        cell.senderWebView.load(requestObj)
                        
                        cell.selectionStyle = .none
                        cell.senderDateAndtimes.text = bulkChat.date_time
                    }
                    
                    cell.ImgPdfVideoView.isUserInteractionEnabled = true

                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                    
                    
                    
                    cell.senderWebView.isHidden = false
                    for i in deletedMsgId {
                        if  i == bulkChat.msg_id {
                            cell.senderWebView.isHidden = true
                            cell.senderDateAndtimes.text = "This message has been deleted"
                        }
                        
                    }
                    
                    
                    
                    if bulkChat.is_delete == true {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                    
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    
                    cell.selectionStyle = .none
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.ResiverimgPdfVoiceView.addGestureRecognizer(deleteGesture)
                    
                    
                    cell.ResiverimgPdfVoiceView.isHidden = false
                    cell.resiverMessaageView.isHidden = true
                    cell.ResivevoicefullView.isHidden = true
                    
                    cell.ImagePdfVideoHeight.constant  = 150
                    
                    
                    if decrypted == ""{
                        
                        
                        
                    }
                    else{
                        let url = URL (string: decrypted)
                        let requestObj = URLRequest(url: url!)
                        cell.receiverWebView.load(requestObj)
                        
                    }
                   
                    cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                    
                    
                    return cell
                }
                
            }
        }
        
        
        
        
        
        
        
        else{
            
            let bulkChat : GetBulkChatListData = getBulkChatList2[indexPath.row]
            if bulkChat.content_type == "TEXT" {
                if userId == bulkChat.user_id {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    cell.selectionStyle = .none
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
//                    cell.selectionStyle = .none
                    
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
//                    deleteGesture.
                    cell.senderTextView.addGestureRecognizer(deleteGesture)
                    
                    
                    
                    
                    print("userId bulkChat.user_id",userId,bulkChat.user_id)
                    print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                    
                    
                    cell.senderDateTextLbl.text = bulkChat.date_time
                    cell.senderMessageLbl.text = decrypted
                    
                    print("decrypteddecrypted",decrypted)
                    cell.senderTextView.isHidden = false
    //                cell.senderWebView.isHidden = true
                    
                    cell.senderVoiceView.isHidden = true
                    cell.ImgPdfVideoView.isHidden = true
                    
                    
    //                cell.webViewHeight.constant = 0
    //                cell.senderVoiceView.isHidden = true
    //                cell.senderVideoView.isHidden = true
    //                cell.senderImgView.isHidden = true
                    
                    
                    return cell
                    
                    
                    
                }else{
                    
                    
                    
                    
                    
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    cell.selectionStyle = .none
                    
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    
                    print("userId bulkChat.user_id",userId,bulkChat.user_id)
                    
                    print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                    
                    
                    
                    
                    
                    print("userId bulkChat.user_idElse",decrypted)
                    
                    cell.ResiverimgPdfVoiceView.isHidden = true
                    cell.resiverMessaageView.isHidden = false
                    cell.ResivevoicefullView.isHidden = true
                    
                    cell.receiverDateLbl.text = bulkChat.date_time
                    cell.recieverMessageLbl.text = decrypted
                    
                    
                    
                    for i in deletedMsgs {
                        if  i == bulkChat.msg_id {
                            cell.receiverDateLbl.isHidden = true
                            cell.recieverMessageLbl.text = "This message has been deleted"
                        }
                        
                    }
                    
                    
                    
                    return cell
                    
                    //                }
                }
                
            } else if bulkChat.content_type == "IMAGE" {
                if userId == bulkChat.user_id {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    cell.selectionStyle = .none
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    print("userId bulkChat.user_id",userId,bulkChat.user_id)
                    //                    if userId == bulkChat.user_id {
                    print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                    
                    
                    cell.senderTextView.isHidden = true
                    
                    cell.ImgPdfVideoView.isHidden = false
                    cell.senderVoiceView.isHidden = true
    //
                    cell.ImagePdfVideoHeight.constant = 160
                    
                    
//                    let vc = ImageZoomViewController(nibName: nil, bundle: )
//                    let vc
    //
    //          let imageUrl = decrypted
    //
    //                // HTML content with an image tag and CSS style to resize
    //                let htmlString = """
    //                <html>
    //                    <head>
    //                        <style>
    //                            img {
    //                                max-width: 300px; /* Maximum width of 170px */
    //                                max-height: 500px; /* Maximum height of 170px */
    //                                width: auto;
    //                                height: auto;
    //                            }
    //                        </style>
    //                    </head>
    //                    <body>
    //                        <img src="\(imageUrl)" />
    //                    </body>
    //                </html>
    //                """
    //
    //                cell.senderWebView.loadHTMLString(htmlString, baseURL: nil)
                
                    
                    if decrypted == ""{
                        
                        
                    }else{
                        
                        let url = URL (string: decrypted)
                        let requestObj = URLRequest(url: url!)
                        cell.senderWebView.load(requestObj)
                        cell.senderDateAndtimes.text = bulkChat.date_time
                        let vc  = PlayGesture(target: self, action: #selector(ZommVc))
                        vc.imgs = decrypted
                        
                        vc.gesRedirctType = "chat"
                        cell.senderWebView.isUserInteractionEnabled = true
                        cell.senderWebView.addGestureRecognizer(vc)

                    }
    //
                   
                    cell.senderDateAndtimes.isHidden = false
                    
                    for i in deletedMsgId {
                        if  i == bulkChat.msg_id {
                            cell.senderWebView.isHidden = true
                            cell.senderDateAndtimes.text = "This message has been deleted"
                            
                        }
                        
                    }
                    
                    
//                    for i in deletedMsgs {
////                        if  i == bulkChat.msg_id {
//                            cell.senderWebView.isHidden = true
//                            cell.senderDateAndtimes.text = "This message has been deleted"
////                        }
//
//                    }
//
                    cell.selectionStyle = .none
                    
                    if bulkChat.is_delete == true {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    
                    
                    
                    
                    
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.imageAndPdfView.addGestureRecognizer(deleteGesture)
                    
                    
                    
                    return cell
                    
                    
                    
                }else{
                    
                    
                    
                    
                    
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    cell.selectionStyle = .none
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    
                    
                    
                    cell.ResiverimgPdfVoiceView.isHidden = false
                    cell.resiverMessaageView.isHidden = true
                    cell.ResivevoicefullView.isHidden = true
                    
                    
                    if decrypted == ""{
                        
                        
                        
                    }
                    
                    else{
                        
                        
                        let url = URL (string: decrypted)
                        let requestObj = URLRequest(url: url!)
                        cell.receiverWebView.load(requestObj)
                        cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                        let vc  = PlayGesture(target: self, action: #selector(ZommVc))
                        vc.imgs = decrypted
                        cell.receiverWebView.isUserInteractionEnabled = true
                        vc.gesRedirctType = "chat"
                        cell.receiverWebView.isUserInteractionEnabled = true
                        cell.receiverWebView.addGestureRecognizer(vc)
                    }
                    
                   
                    
                    
                    print("userId bulkChat.user_id",userId,bulkChat.user_id)
                    
                    print("userId bulkChat.user_idInside",userId,bulkChat.user_id)
                    
                    
                    
                    
                    
                    print("userId bulkChat.user_idElse",userId,bulkChat.user_id)
                    
                    
                    
                    //
                    
    //                cell.messageView.isHidden = true
    //                cell.imgView.isHidden = false
    //                cell.audioView.isHidden = true
    //                cell.img.sd_setImage(with: URL(string:  decrypted), placeholderImage: UIImage(named: "Avatar"))
    //
    //
    //
    //                cell.imgDateLbl.text = bulkChat.date_time
    //
    //                cell.recieverImgHeight.constant = 200
    //
    //                cell.overAllViewHeight.constant = 300
    //                cell.overAllWidth.constant = 300
    //
                    
                    return cell
                    
                }
            }else if bulkChat.content_type == "VOICE" {
                if userId == bulkChat.user_id {
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    
                    cell.selectionStyle = .none
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    cell.ImgPdfVideoView.isHidden = true
                    cell.senderTextView.isHidden = true
                    cell.senderVoiceView.isHidden = false
    //                //
    ////                cell.senderOverAllWidth.constant = 350
    //
    //
    //                //                    cell.audioView.isHidden = true
    //
    //                //
                    cell.senderVoiceDateLbl.text = bulkChat.date_time
                    
                    print("voice",decrypted)
                    cell.audioFileURL = decrypted
                    
                    cell.senderSpecficVoiceView.isHidden = false
                    
                    for i in deletedMsgId {
                        if  i == bulkChat.msg_id {
                            cell.senderVoiceView.isHidden = false
                        cell.senderSpecficVoiceView.isHidden = true
                        cell.senderVoiceDateLbl.text = "This message has been deleted"
                        }
                        
                    }
                    
                    if bulkChat.is_delete == true {
                            cell.senderVoiceView.isHidden = false
                        cell.senderSpecficVoiceView.isHidden = true
                        cell.senderVoiceDateLbl.text = "This message has been deleted"
                    }
                    
//                    let url = URL(string: decrypted)
//                    print("filePathUrl",url)
//
//                                    cell.selectionStyle = .none
//                    let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
//
//                    player = AVPlayer(playerItem: playerItem)
//                    cell.senderSlider.minimumValue = 0
//                    let duration : CMTime = playerItem.asset.duration
//                    let seconds : Float64 = CMTimeGetSeconds(duration)
//
//
//                    let currentDuration : CMTime = playerItem.currentTime()
//
//                    let currentSeconds : Float64 = CMTimeGetSeconds(currentDuration)
//                    //                recieverLabelCurrentTime.isHidden = true
//
//                    //                cell.senderLabelCurrentTime.text = self.stringFromTimeInterval(interval: currentSeconds)
//
//                    cell.senderSlider.maximumValue = Float(seconds)
//                    cell.senderSlider.isContinuous = true
//                    cell.senderSlider.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
//
//
//                    NotificationCenter.default.addObserver(self, selector: #selector(self.ordersFinishedPlaying(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
//                    //                                    audioImg = cell.img
                    
//                    player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
//
//                        if self.player!.currentItem?.status == .readyToPlay {
//
//                            let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
//
//                            cell.senderSlider.value = Float ( time );
//                            cell.senderLabelCurrentTime.isHidden = false
//                            cell.senderLabelCurrentTime.text = self.stringFromTimeInterval(interval: time)
//
//                        }
//                        //
//                        let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
//
//                        if playbackLikelyToKeepUp == false{
//                            print("buffering")
//                        }
//
//                        else {
//                            print("Buffering completed")
//                        }
//                    }
//
//                    let playGesture = PlayGesture(target: self, action: #selector(OrderplayAudio))
//                    playGesture.img = cell.senderPlayImage
//                    cell.senderPlayView.addGestureRecognizer(playGesture)
//
//
    //
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
    //                    deleteGesture.
                    cell.senderVoiceView.addGestureRecognizer(deleteGesture)
                    
                    
                    return cell
                    
                    
                    
                }else{
                    
                    
                    
                    
                    
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    cell.selectionStyle = .none
                    
                    var decrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    cell.ResiverimgPdfVoiceView.isHidden = true
                    cell.resiverMessaageView.isHidden = true
                    cell.ResivevoicefullView.isHidden = false
                    
                    
                    cell.audioFileURL = decrypted
    //
    //                let url = URL (string: decrypted)
    //                let requestObj = URLRequest(url: url!)
    //                cell.receiverWebView.load(requestObj)
    //                cell.resiverDateAndTimeLbl.text = bulkChat.date_time
    //
    //
    //                cell.audioView.isHidden = false
    //                cell.messageView.isHidden = true
    //                cell.imgView.isHidden = true
    //                cell.overAllWidth.constant = 350
    //                //                    cell.senderVoiceView.isHidden = true
    //
    //                //
    //                cell.audioView.backgroundColor = .lightGray
    //
    //                cell.receiverDateLbl.text = bulkChat.date_time
    //                cell.recieverAudioHeight.constant = 60
    ////                cell.overAllViewHeight.constant = 80
    //
    //                let url = URL(string: decrypted)
    ////                print("filePathUrl",url)
    //
    //                let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
    //
    //                player = AVPlayer(playerItem: playerItem)
    //                cell.recieverSlider.minimumValue = 0
    //                let duration : CMTime = playerItem.asset.duration
    //                let seconds : Float64 = CMTimeGetSeconds(duration)
    //
    //
    //                let currentDuration : CMTime = playerItem.currentTime()
    //
    //                let currentSeconds : Float64 = CMTimeGetSeconds(currentDuration)
    //
    //                cell.recieverLabelCurrentTime.text = self.stringFromTimeInterval(interval: currentSeconds)
    //
    //                cell.recieverSlider.maximumValue = Float(seconds)
    //                cell.recieverSlider.isContinuous = true
    //                cell.recieverSlider.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
    //                //
    //
    //                NotificationCenter.default.addObserver(self, selector: #selector(self.ordersFinishedPlaying(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    //
    //
    //                player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
    //
    //                    if self.player!.currentItem?.status == .readyToPlay {
    //
    //                        let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
    //
    //                        cell.recieverSlider.value = Float ( time );
    //                        cell.recieverLabelCurrentTime.isHidden = false
    //                        cell.recieverLabelCurrentTime.text = self.stringFromTimeInterval(interval: time)
    //
    //                    }
    //
    //                    let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
    //
    //                    if playbackLikelyToKeepUp == false{
    //                        print("buffering")
    //                    }
    //
    //                    else {
    //                        print("Buffering completed")
    //                    }
    //                }
                    
                    
    //                let playGesture = PlayGesture(target: self, action: #selector(OrderplayAudio))
    //                playGesture.img = cell.recieverPlayImage
    //                cell.recieverPlayView.addGestureRecognizer(playGesture)
    //
                    return cell
                    
                }
            }else if bulkChat.content_type == "VIDEO" {
                if userId == bulkChat.user_id {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    
                    cell.selectionStyle = .none
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
    //                cell.messageCondetStackView.isHidden = true
    //                cell.senderWebView.isHidden = false
                    
                    cell.ImgPdfVideoView.isUserInteractionEnabled = true

                    
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                    
                    
                    cell.senderTextView.isHidden = true
                    cell.senderVoiceView.isHidden = true
                    cell.ImgPdfVideoView.isHidden = false
    //                cell.webViewHeight.constant = 170
    //                cell.webViewHeight.constant = 179
                    
                    
    //                cell.senderTextView.isHidden = true
    //                cell.senderVoiceView.isHidden = true
    //                cell.senderVideoView.isHidden = false
    ////                cell.senderImgView.isHidden = true
    ////                cell.senderPdfView.isHidden = true
    //                print("Videodecrypted",decrypted)
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.senderWebView.load(requestObj)
                    cell.senderDateAndtimes.text = bulkChat.date_time
    //
                    
                    cell.senderWebView.isHidden = false
                    
                                    cell.selectionStyle = .none
                    
                    for i in deletedMsgId {
                        if  i == bulkChat.msg_id {
                            cell.senderWebView.isHidden = true
                            cell.senderDateAndtimes.text = "This message has been deleted"
                        }
                        
                    }
                    
                    
                    
                    if bulkChat.is_delete == true {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    return cell
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                
                let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                let salt: [UInt8] = Array("120495030296".utf8)
                let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                
                
                cell.selectionStyle = .none
                var decrypted = ""
                var demoImgdecrypted = ""
                
                do {
                    
                    let key = try PKCS5.PBKDF2(
                        password: password,
                        salt: salt,
                        iterations: 1,
                        keyLength: 32,
                        variant: .sha1
                    ).calculate()
                    
                    let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                    decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                    
                    
                    
                }catch {
                    print("error encryption",error)
                }
                
                
                cell.ResiverimgPdfVoiceView.isHidden = false
                cell.resiverMessaageView.isHidden = true
                cell.ResivevoicefullView.isHidden = true
                
                
                print(" decrypteddecrypteddecrypteddecrypteddecrypteddecrypteddecrypted",decrypted)
                
                let url = URL (string: decrypted)
                let requestObj = URLRequest(url: url!)
                cell.receiverWebView.load(requestObj)
                cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                
               
                
                
                return cell
            }
            
            }else if bulkChat.content_type == "PDF" {
                if userId == bulkChat.user_id {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                    
                    
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        cell.selectionStyle = .none
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    cell.senderTextView.isHidden = true
                    
                    cell.ImgPdfVideoView.isHidden = false
                 
                   
    //                cell.messageCondetStackView.isHidden = true
    //                cell.senderWebView.isHidden = false
    //                cell.webViewHeight.constant = 179
    //
    //                cell.senderTextView.isHidden = true
    //                cell.senderVoiceView.isHidden = true
    //                cell.senderVideoView.isHidden = false
    ////                cell.senderImgView.isHidden = true
    ////                cell.senderPdfView.isHidden = true
                    print("pdffffffffff",decrypted)
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.senderWebView.load(requestObj)
                    
                    
                    cell.senderDateAndtimes.text = bulkChat.date_time
                    cell.selectionStyle = .none
                    
                    
                    cell.ImgPdfVideoView.isUserInteractionEnabled = true
                    let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                    deleteGesture.msgIdInt = bulkChat.msg_id
                    deleteGesture.roomId = bulkChat.room_id
                    cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                    
                    cell.senderWebView.isUserInteractionEnabled = true
                    cell.senderWebView.isHidden = false
                    
                                    cell.selectionStyle = .none
                    for i in deletedMsgId {
                        if  i == bulkChat.msg_id {
                            cell.senderWebView.isHidden = true
                            cell.senderDateAndtimes.text = "This message has been deleted"
                        }
                        
                    }
                    
                    
                    
                    if bulkChat.is_delete == true {
                        cell.senderWebView.isHidden = true
                        cell.senderDateAndtimes.text = "This message has been deleted"
                    }
                    return cell
                    
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                    
                    let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                    let salt: [UInt8] = Array("120495030296".utf8)
                    let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                    
                    cell.selectionStyle = .none
                    
                    var decrypted = ""
                    var demoImgdecrypted = ""
                    
                    do {
                        
                        let key = try PKCS5.PBKDF2(
                            password: password,
                            salt: salt,
                            iterations: 1,
                            keyLength: 32,
                            variant: .sha1
                        ).calculate()
                        
                        let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                        decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                        
                        
                        
                    }catch {
                        print("error encryption",error)
                    }
                    
                    
                    
                    cell.ResiverimgPdfVoiceView.isHidden = false
                    cell.resiverMessaageView.isHidden = true
                    cell.ResivevoicefullView.isHidden = true
                    
                    cell.ImagePdfVideoHeight.constant  = 150
                    let url = URL (string: decrypted)
                    let requestObj = URLRequest(url: url!)
                    cell.receiverWebView.load(requestObj)
                    cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                    
                    
                    return cell
                }
            }
        
                else{
                    if userId == bulkChat.user_id {
                        
                        
                        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
                        
                        
                        //                cell.senderVoiceView.isHidden = true
                        //                cell.senderImgView.isHidden = true
                        cell.senderTextView.isHidden = true
                        //                cell.senderPdfView.isHidden = true
                        //                cell.senderVideoView.isHidden = false
                        
                        
                        
                        let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                        let salt: [UInt8] = Array("120495030296".utf8)
                        let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                        
                        cell.selectionStyle = .none
                        
                        var decrypted = ""
                        var demoImgdecrypted = ""
                        
                        do {
                            
                            let key = try PKCS5.PBKDF2(
                                password: password,
                                salt: salt,
                                iterations: 1,
                                keyLength: 32,
                                variant: .sha1
                            ).calculate()
                            
                            let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\r\n", with: "")
                            decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                            
                            
                            
                        }catch {
                            print("error encryption",error)
                        }
                        
                        
                        
                                        cell.selectionStyle = .none

                        cell.senderTextView.isHidden = true
                        
                        cell.ImgPdfVideoView.isHidden = false
                        cell.senderVoiceView.isHidden = true
                        cell.ImagePdfVideoHeight.constant  = 150
                        //                cell.messageCondetStackView.isHidden = true
                        //                cell.senderWebView.isHidden = false
                        //                cell.webViewHeight.constant = 179
                        //
                        //                cell.senderTextView.isHidden = true
                        //                cell.senderVoiceView.isHidden = true
                        //                cell.senderVideoView.isHidden = false
                        ////                cell.senderImgView.isHidden = true
                        ////                cell.senderPdfView.isHidden = true
                        
                        if decrypted == ""{
                            
                            
                            
                        }else{
                            
                            
                            
                            print("pdffffffffff",decrypted)
                            let url = URL (string: decrypted)
                            let requestObj = URLRequest(url: url!)
                            cell.senderWebView.load(requestObj)
                            
                            
                            cell.senderDateAndtimes.text = bulkChat.date_time
                        }
                        
                        
                        cell.ImgPdfVideoView.isUserInteractionEnabled = true

                        
                        let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
                        deleteGesture.msgIdInt = bulkChat.msg_id
                        deleteGesture.roomId = bulkChat.room_id
                        cell.ImgPdfVideoView.addGestureRecognizer(deleteGesture)
                        
                        cell.senderWebView.isUserInteractionEnabled = false
                        cell.senderWebView.isHidden = false
                        for i in deletedMsgId {
                            if  i == bulkChat.msg_id {
                                cell.senderWebView.isHidden = true
                                cell.senderDateAndtimes.text = "This message has been deleted"
                            }
                            
                        }
                        
                        
                        
                        if bulkChat.is_delete == true {
                            cell.senderWebView.isHidden = true
                            cell.senderDateAndtimes.text = "This message has been deleted"
                        }
                        
                        return cell
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatReceiverTableViewCell
                        
                        
                        
                        let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
                        let salt: [UInt8] = Array("120495030296".utf8)
                        let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
                        
                        cell.selectionStyle = .none
                        
                        var decrypted = ""
                        var demoImgdecrypted = ""
                        
                        do {
                            
                            let key = try PKCS5.PBKDF2(
                                password: password,
                                salt: salt,
                                iterations: 1,
                                keyLength: 32,
                                variant: .sha1
                            ).calculate()
                            
                            let newvalue = bulkChat.chatContent.replacingOccurrences(of: "\n", with: "")
                            decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
                            
                            
                            
                        }catch {
                            print("error encryption",error)
                        }
                        
                        
                        
                        cell.ResiverimgPdfVoiceView.isHidden = false
                        cell.resiverMessaageView.isHidden = true
                        cell.ResivevoicefullView.isHidden = true
                        cell.ImagePdfVideoHeight.constant = 150
                        
                        let url = URL (string: decrypted)
                        let requestObj = URLRequest(url: url!)
                        cell.receiverWebView.load(requestObj)
                        cell.resiverDateAndTimeLbl.text = bulkChat.date_time
                        
                        
                        return cell
                    }
                    
                }
        }
        
//        if indexPath.row == 0 {
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
//            
//            let bulkChat : GetBulkChatListData = getBulkChatList[indexPath.row]
//            
//            deleteView.isHidden = false
//            cell.selectionStyle = .none
//            print("didSelectbulkChat.content_type",bulkChat.content_type)
//            print("didSelectbulkChat.msg_id",bulkChat.msg_id)
//        }
//        else{
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdReceiver, for: indexPath) as! ChatSenderTableViewCell
//            
//            let bulkChat : GetBulkChatListData = getBulkChatList[indexPath.row]
//            cell.selectionStyle = .none
//            deleteView.isHidden = false
//            let deleteGest = chatDeleteMsgGesture(target: self, action: #selector(chatDelete))
////            deleteGest.msgId = String(bulkChat.msg_id)
//            deleteGest.roomId = bulkChat.room_id
//            deleteView.addGestureRecognizer(deleteGest)
//            
//            print("didSelectbulkChat.content_type",bulkChat.content_type)
//            print("didSelectbulkChat.msg_id",bulkChat.msg_id)
//            
//            
//        }
        
    }
    
    
    
    @IBAction func chatDeleteVisible(ges : chatDeleteMsgGesture) {
      
        deleteView.isHidden = false
        print("intArrintArrEm",intArr)
        let deleteGest = chatDeleteMsgGesture(target: self, action: #selector(chatDelete))
       
        
        
        print("ges.msgIdInt111",ges.msgIdInt)
        intArr.append(ges.msgIdInt)
        print("intArrintArr",intArr)
        deleteGest.msgId = intArr
//        print("ges.msgIdInt",deleteGest.msgId)
        deleteGest.roomId = ges.roomId
        deleteView.addGestureRecognizer(deleteGest)
        
        print("chatDeleteVisibledeleteGesture",deleteGest.msgId)

    }
 
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdSender, for: indexPath) as! ChatSenderTableViewCell
//
//        let bulkChat : GetBulkChatListData = getBulkChatList[indexPath.row]
//        var intArr : [Int] = []
//
//        intArr.append(getBulkChatList[indexPath.row].msg_id)
//        intArr.append(55)
//        print("ges.msgIdInt11111111",intArr)
//
//
////        let deleteGesture = chatDeleteMsgGesture(target: self, action: #selector(chatDeleteVisible))
////        deleteGesture.msgIdInt = bulkChat.msg_id
////        deleteGesture.roomId = bulkChat.room_id
////        cell.senderTextView.addGestureRecognizer(deleteGesture)
////
////
//
//    }

//       func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//            return UITableView.automaticDimension
//           }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            if ofsetCount == 0 {
                let bulkChat : GetBulkChatListData = getBulkChatList[indexPath.row]
                
                
                if indexPath.row == 0 {
                    if bulkChat.content_type == "VIDEO" {
                        
                        return 220
                    }
                    
                    
                    else if bulkChat.content_type == "IMAGE"{
                        
                        
                        return 220
                    }
                    
                    else if bulkChat.content_type == "TEXT"{
                        
                        
                     print("pdfffffffff")
                        
                        return UITableView.automaticDimension
                       
                        
                    }
                    
                    else if bulkChat.content_type == "VOICE"{
                        
                        return 100
                    }
                    
                    else{
                        return 185
                    }
                    
                }else {
                    
                    if bulkChat.content_type == "VIDEO" {
                        
                        return 220
                    }
                    
                    
                    else if bulkChat.content_type == "IMAGE"{
                        
                        
                        return 220
                    }
                    
                    else if bulkChat.content_type == "TEXT"{
                        
                        
                     print("pdfffffffff")
                        
                        return UITableView.automaticDimension
                       
                        
                    }
                    
                    else if bulkChat.content_type == "VOICE"{
                        
                        return 70
                    }
                    
                    else{
                        return 185
                    }
                    
                }
            }
            
            else{
                
                let bulkChat : GetBulkChatListData = getBulkChatList2[indexPath.row]
                if indexPath.row == 0 {
                    if bulkChat.content_type == "VIDEO" {
                        
                        return 220
                    }
                    
                    
                    else if bulkChat.content_type == "IMAGE"{
                        
                        
                        return 220
                    }
                    
                    else if bulkChat.content_type == "TEXT"{
                        
                        
                     print("pdfffffffff")
                        
                        return UITableView.automaticDimension
                       
                        
                    }
                    
                    else if bulkChat.content_type == "VOICE"{
                        
                        return 100
                    }
                    
                    else{
                        return 185
                    }
                    
                }else {
                    
                    if bulkChat.content_type == "VIDEO" {
                        
                        return 220
                    }
                    
                    
                    else if bulkChat.content_type == "IMAGE"{
                        
                        
                        return 220
                    }
                    
                    else if bulkChat.content_type == "TEXT"{
                        
                        
                     print("pdfffffffff")
                        
                        return UITableView.automaticDimension
                       
                        
                    }
                    
                    else if bulkChat.content_type == "VOICE"{
                        
                        return 100
                    }
                    
                    else{
                        return 185
                    }
                    
                }
            }
        }
    
    
    @IBAction func dismissVc() {
        dismiss(animated: true)
    }
    
    
    
    
    @IBAction func chatDelete( ges : chatDeleteMsgGesture) {
        
        
        var refreshAlert = UIAlertController(title: "Delete message", message: "", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "DELETE MESSAGE", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("token",token)
            
          
                
                
                if Constant.DefaultsKeys.TokenExpire == 401{
                    
                    
                    let alert = UIAlertController(title: "Alert", message: "TokenExpired" , preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }else{
                    print("ges.msgIddelete",ges.msgId.count)
                    print("ges.intArr",intArr)
                    let array = intArr
                    let stringRepresentation = "[\(array.map { String($0) }.joined(separator: ", "))]"
                    print(stringRepresentation) //
                    let chatDeleteModal = ChatDelleteMsgModal()
                    chatDeleteModal.msgId = stringRepresentation
                    chatDeleteModal.roomId = ges.roomId
                    chatDeleteModal.chatType = "private"
                    
                    
                    var  chatDeleteModalStr = chatDeleteModal.toJSONString()
                    print("chatDeleteModal",chatDeleteModal.toJSON())
                    ChatDeleteMsgRequest.call_request(param: chatDeleteModalStr!, token: token!) {
                        
                        [self] (res) in
                        
                        let chatDeleteRes : ChatDelleteMsgResponse = Mapper<ChatDelleteMsgResponse>().map(JSONString: res)!
                        
                     
                        
                        
                        if chatDeleteRes.status == true {
                            
                            
                            deletedMsgId = ges.msgId
                            print("DeletedeletedMsgId",deletedMsgId)
                            
                            var chat_type = "private"
                            var room_id =  ges.roomId
                            
//                            mSocket.emit(ChatUtil.delete_msg, user_id, chat_type, room_id, ges.msgIdInt);

                            SocketIOManager.socket.emit("delete_msg",user_id, chat_type, room_id!,stringRepresentation)
                            
                            SocketIOManager.socket.on("ack_delete_msg") {[self]  dataArray, ack in
                                
                                
                                deleteView.isHidden = true
                                
                                
                                bulkChatList()
                                 tv.reloadData()
                                 tv.delegate =  self
                                 tv.dataSource = self
                            }
                            
                            
                       
                            
                            
                        }else{
                            let alert = UIAlertController(title: "Alert", message: chatDeleteRes.message, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                }
        
        
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            
            
            
            
        
        
        
        
        
        
        
    }
   
    
    func uploadImage(imageData : UIImage){
        print("upload aws")
        
            AWSS3Manager.shared.uploadImage(image: imageData, progress: {[weak self] ( uploadProgress) in
                
                guard let strongSelf = self else { return }
                
            }) {[weak self] (uploadedFileUrl, error) in
                
                guard let strongSelf = self else { return }
                if let finalPath = uploadedFileUrl as? String { // 3
                    print("Uploaded aws file path",finalPath)
                    
                    self!.contentTypeSend = 1
                    
                   
                    self!.filePathVoiceRecord = finalPath
                    
                    self!.messageSending()
                    let userDefault = UserDefaults.standard
                    
                } else {
                    print("\(String(describing: error?.localizedDescription))") // 4
                }
            }
        
        
        
        
    }
    
    
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//
//        if ofsetCount == 0{
//            let lastElement = getBulkChatList.count - 1
//            if indexPath.section == lastElement {
//                print(getBulkChatList.count)
//                if(chatCount >= getBulkChatList.count ){
//                    if(!isNewDataLoading){
//                        self.bulkChatList()
//                    }
//                }
//
//            }
//        }
//
//        else{
//
//            let lastElement = getBulkChatList2.count - 1
//            if indexPath.section == lastElement {
//                print(getBulkChatList2.count)
//                if(chatCount >= getBulkChatList2.count ){
//                    if(!isNewDataLoading){
//                        self.bulkChatList()
//                    }
//                }
//
//            }
//
//
//        }
//       }
    
    
    
    
    

    
    
    
    
}



class PlayGesture : UITapGestureRecognizer {
    
    
    var img : UIImageView!
    var imgUrl : String!
    var chatMsgId : String!
    
    var imgs : String!
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
    var alumniContributeMedia : [GetContributeAlumniReferenceMedia] = []
}

class chatDeleteMsgGesture : UITapGestureRecognizer {
    
    var msgIdInt : Int!
    var msgId : [Int] = []
    var roomId : Int!
}

//TEXT

//    print("cell.senderMessageHeight.constant",cell.senderMessageHeight.constant)
//                cell.chatView.isHidden = true
//                cell.recieverVoiceHeight.constant = 0
//                cell.chtTextHeight.constant = 0
//                cell.recieverImgViewHeight.constant = 0

//                cell.senderMessageView.backgroundColor = UIColor(named: "AppColor")
