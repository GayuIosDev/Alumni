//
//  EventListShowingCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 19/01/24.
//

import UIKit
import WebKit
import SDWebImage
import ObjectMapper
import SwiftGifOrigin

class EventListShowingCollectionViewCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var eventListRightSwipe: UIImageView!
    
    @IBOutlet weak var eventListSwipeGif: UIImageView!
    
    
    @IBOutlet weak var othersBdayRedirectView: UIViewX!
    @IBOutlet weak var otherBdayTitle: UILabel!
    
    @IBOutlet weak var othersBdayView: UIView!
    
    
    @IBOutlet weak var editImg: UIImageView!
    
    @IBOutlet weak var deleteEditHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    
    @IBOutlet weak var deleteImg: UIImageView!
    
    
    @IBOutlet weak var mapPin: UIImageView!
    
    @IBOutlet weak var detailDesc: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var deleteView: UIViewX!
    @IBOutlet weak var editView: UIViewX!
    
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var headingLbl: UILabel!
    
    @IBOutlet weak var toDateLbl: UILabel!
    
    @IBOutlet weak var fromDateLbl: UILabel!
    @IBOutlet weak var venueLbl: UILabel!
    @IBOutlet weak var bdayDescLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var yourBdayView: UIView!
    
    
    @IBOutlet weak var web_view: WKWebView!
    
    @IBOutlet weak var imgCountView: UIViewX!
    @IBOutlet weak var imgCountLbl: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    
    
    @IBOutlet weak var img3: UIImageView!
    
    var memberType : Int!

    
    
    var main_vc : UIViewController!
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []
    var bdayGetMedia : [bdayReferenceMedia] = []
    var getAlumniMedia : [getAlumniEventReferenceMedia] = []

    var passGetInstituteData : [GetInstituteEventDetailData] = []
    var passGetAlumniData : [GetAlumniEventDetailData] = []

    var namePassStr : String!
    var titlePassStr : String!
    var fromPassStr : String!
    var toPassStr : String!
    var descPassStr : String!
    var venuePassStr : String!
    var passType : String!
    var passProfile : String!
    var passUserId : Int!
    var passUserName : String!
    
    
    var getEventsType : String!
    var passInstId : Int!
    var passEventId : Int!
    var passheading : String!

    var token : String!
    let rowIdd = "EventListShowTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("getEventsType11111",getEventsType)
        print("getEventsType11111passType",passType)
        let defaults =  UserDefaults.standard
       memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
//        self.mapPin.image = UIImage.gif(name: "location_pin")

        let gifURL = UIImage.gif(name: "location_pin")
                  // Use SDWebImage to load and display the GIF image
//        self.mapPin.image = gifURL
        
       
        tv.dataSource = self
        tv.delegate = self
        
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        
        tv.register(UINib(nibName: rowIdd, bundle: nil), forCellReuseIdentifier:  rowIdd)
//        tv.e
//        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)

        
//        cv.dataSource = self
//        cv.delegate = self
//        
//        cv.register(UINib(nibName: rowIdd, bundle: nil), forCellWithReuseIdentifier: rowIdd)
////        tv.e
//        yourBdayView.isHidden  = true
//        web_view.isHidden = true
//        imgView.layer.cornerRadius = 10
        
        print("getMediaInstitute.count",getMediaInstitute.count)
        
//        let birthdayWishesGesture = UITapGestureRecognizer(target: self, action: #selector(birthdayWishesVc))
//        imgCountView.addGestureRecognizer(birthdayWishesGesture)
        
       
       
    }
    
    
    
    @IBAction func birthdayWishesVc() {

        
        let storyboard = UIStoryboard(name: "YourBirthdayWishesListStoryboard", bundle: nil)
               let viewController = storyboard.instantiateInitialViewController() as! YourBirthdayWishesListViewController
        viewController.getMediaInstituteRef = bdayGetMedia
        self.main_vc.present(viewController, animated: true)
        
//            }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if memberType == 1 || memberType == 2 {
            return 1
              }else{
                  return 1
              }
        
        
       
    }
    
    @IBAction func chatRedirect( ges : ChatRedirctGesture) {
        
        let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
        viewController.bdayRedirect = "Event"
        viewController.user_id  = ges.redirectId
        viewController.selectedUserId  = ges.redirectId
        viewController.userName = ges.redirectName
        viewController.userImg = ges.redirectProfile
        viewController.chatWishType = 1
        viewController.instituteNameStr = ges.instituteName
        viewController.userImg = ges.userImg

//        viewController.instituteNameStr = ges.batch
//        viewController.cNameStr = ges.batch
//        viewController.batchStr = ges.batch

        
//        viewController.designationStr = ges.redirectName
        
        print("ges.redirectId",ges.redirectId)
        print("ges.redirectName",ges.redirectName)
        print("ges.redirectProfile",ges.redirectProfile)

        viewController.IsBday = true
        
        

        self.main_vc.present(viewController, animated: true)
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdd, for: indexPath) as! EventListShowTableViewCell
       
        cell.selectionStyle = .none
        print("cellForRowAt",memberType)
        
        if memberType == 1 || memberType == 2 {
        
        
        let instEventList : GetInstituteEventDetailData = passGetInstituteData[indexPath.row]
                   cell.venueLbl.text = instEventList.venue

            cell.descriptionLbl.text = descPassStr
            cell.main_vc = main_vc
                   cell.titleLbl.text = titlePassStr
                   cell.fromTimeLbl.text = fromPassStr
                   cell.to_timeLbl.text = toPassStr
            cell.nameLbl.text = namePassStr
            cell.getEventTitleText = titlePassStr
            cell.venueLbl.text = venuePassStr
        
            
            
            cell.bdayGifImg.isHidden = true
            cell.person2View.isHidden = true
            cell.deleteView.isHidden = true
            cell.editView.isHidden  = true
            
            cell.getMediaInstitute = getMediaInstitute

//            cell.profileType = "Others_BDay"
print("instEventList.typeinstEventList.type",instEventList.type)
            print("instEventListpassTypetype", passType)
                   if passType == "Others_BDay" {
                       cell.deleteView.isHidden = true
                       cell.editView.isHidden  = true
                       cell.bdayView.isHidden = false
                       cell.bdayTitleLbl.text = titlePassStr
                       
                       cell.bdayGifImg.isHidden = false
//
                       let gifURL = UIImage.gif(name: "Balloons Happy Birthday with confetti")
                                 // Use SDWebImage to load and display the GIF image
//                       cell.bdayGifImg.image = gifURL
                       
                       cell.person1View.isHidden = false
                       cell.venuHeight.constant  = 0

                       cell.venueShowView.isHidden = true
                       cell.titleDiscShowView.isHidden  = true
                       cell.profileType = "Others_BDay"
                       cell.profileImg = passProfile
                       cell.wishChatView.isHidden = true
                       
                       cell.person1Img.sd_setImage(with: URL(string:  passProfile!), placeholderImage: UIImage(named: "image 2"))

                   }else if passType == "Yours_BDay_Chat"{
                       cell.bdayView.isHidden = true
                       cell.venueShowView.isHidden = true
                       cell.venuHeight.constant  = 0
                       cell.bdayTitleLbl.isHidden = true
                       cell.wishChatView.isHidden = true
                       cell.deleteView.isHidden = true
                       cell.editView.isHidden  = true
                       
                       cell.bdayGifImg.isHidden = true
                   }
                       else if passType == "Yours_BDay"{
                           cell.bdayView.isHidden = true
                           cell.venueShowView.isHidden = true
                           cell.venuHeight.constant  = 0
                           cell.bdayTitleLbl.isHidden = true
                           cell.wishChatView.isHidden = true
                           cell.deleteView.isHidden = true
                           cell.editView.isHidden  = true
                          
                           cell.bdayGifImg.isHidden = true

                       
                   }else{
                       cell.bdayView.isHidden = true
                       cell.bdayTitleLbl.isHidden = true
                       cell.wishChatView.isHidden = true
                       cell.bdayGifImg.isHidden = true
                       cell.wishChatView.isHidden = true
                       cell.deleteView.isHidden = false
                       cell.editView.isHidden  = false
                       cell.venueShowView.isHidden = false
                       cell.titleDiscShowView.isHidden  = false
                       cell.venuHeight.constant  = 50

                   }

            
            
            cell.editDeleteViewHeight.constant = 40
       
            
             print("EventListgetMediaInstitute",getMediaInstitute)

//            cell.getMediaInstitute = getMediaInstitute
                   
                   
                   let editGes = DeleteGesture(target: self, action: #selector(editClick))
                   editGes.deleteId = passInstId
                   editGes.venue = venuePassStr
                   editGes.fromDate = fromPassStr
                   editGes.title = titlePassStr
                   editGes.toDate = toPassStr
                   editGes.nameheading = namePassStr
                   editGes.desc = descPassStr
                   editGes.eventId = passEventId
            editGes.getMediaInstitute = getMediaInstitute


                   cell.editView.addGestureRecognizer(editGes)
                   
                   
                   let deleteGes = DeleteGesture(target: self, action: #selector(deleteClick))
                   deleteGes.deleteId = passInstId
                   cell.deleteView.addGestureRecognizer(deleteGes)
                   
        }else{
            
            
            cell.profileImg = passProfile
            
            let alumniEventList : GetAlumniEventDetailData = passGetAlumniData[indexPath.row]
            
            cell.venueLbl.text = venuePassStr
            
            cell.getEventsType = alumniEventList.type
            Constant.DefaultsKeys.getEventsType = alumniEventList.type
            
            print("alumniEventListtype11",alumniEventList.type)
            cell.descriptionLbl.text = descPassStr
            cell.main_vc = main_vc
            cell.titleLbl.text = titlePassStr
            cell.fromTimeLbl.text = fromPassStr
            cell.to_timeLbl.text = toPassStr
            cell.nameLbl.text = namePassStr
            cell.getEventTitleText = titlePassStr
            
          
            
            
            print("cell.getAlumniMedia",getAlumniMedia)

            cell.deleteView.isHidden = true
            cell.editView.isHidden  = true
            
            

            
            
            
            
            
            print("passType",passType)
            
            
            if passType == "Event"{
                cell.bdayView.isHidden = true
                                            cell.bdayTitleLbl.isHidden = true
                                            cell.wishChatView.isHidden = true
                                            cell.bdayGifImg.isHidden = true
                cell.venueShowView.isHidden = false
                cell.titleDiscShowView.isHidden  = false
                cell.venuHeight.constant  = 50
                cell.bdayProfileShowImg.isHidden = true
                cell.getAlumniMedia = getAlumniMedia
//                cell.deleteView.isHidden = false
//                cell.editView.isHidden  = false
        } else if passType == "Others_BDay" {
            
            
            bdayGetMedia = alumniEventList.mediaBdayChat
            cell.bdayViewTopp.constant = -120
            cell.TypeOtherBdayStr = passType
            cell.BirthDayTypeStr = passProfile
                             cell.bdayView.isHidden = false
                             cell.bdayTitleLbl.text = titlePassStr
                            cell.bdayGifImg.isHidden = false
            cell.bdayProfileShowImg.isHidden = false
            cell.bdayProfileShowImg.sd_setImage(with: URL(string:  passProfile), placeholderImage: UIImage(named: "image 2"))

                             cell.wishChatView.isHidden = false
            
            print("cellTypeGest",cell.profileType)
//
            let gifURL = UIImage.gif(name: "Balloons Happy Birthday with confetti")
                      // Use SDWebImage to load and display the GIF image
//            cell.bdayGifImg.image = gifURL
            
            
            if alumniEventList.mediaBdayChat.count == 1 {
                
                
                cell.person1View.isHidden = false
                cell.person1Img.isHidden = false
              
                cell.person1Img.sd_setImage(with: URL(string: alumniEventList.mediaBdayChat[0].sender_profile ), placeholderImage: UIImage(named: "image 2"))
            
                //
                cell.person2View.isHidden = true
                
                
                
                let person1Gesture = ChatRedirctGesture(target: self, action: #selector(chatRedirect))
                person1Gesture.redirectId = alumniEventList.mediaBdayChat[0].sender_id
                person1Gesture.redirectName = alumniEventList.mediaBdayChat[0].sender_name
                person1Gesture.redirectProfile = alumniEventList.mediaBdayChat[0].sender_profile
                cell.person1View.addGestureRecognizer(person1Gesture)
                
            }else if alumniEventList.mediaBdayChat.count == 2 {
                
                
                cell.person1View.isHidden = false
                cell.person1Img.isHidden = false
                
                
                
                cell.person1Img.sd_setImage(with: URL(string:  alumniEventList.mediaBdayChat[0].sender_profile), placeholderImage: UIImage(named: "image 2"))
                //
                cell.person2View.isHidden = false
                
                cell.person2Img.sd_setImage(with: URL(string:  alumniEventList.mediaBdayChat[1].sender_profile), placeholderImage: UIImage(named: "image 2"))
                //
                cell.person2Img.isHidden = false
                
                let person2Gesture = ChatRedirctGesture(target: self, action: #selector(chatRedirect))
                person2Gesture.redirectId = alumniEventList.mediaBdayChat[1].sender_id
                person2Gesture.redirectName = alumniEventList.mediaBdayChat[1].sender_name
                person2Gesture.redirectProfile = alumniEventList.mediaBdayChat[1].sender_profile
                cell.person2View.addGestureRecognizer(person2Gesture)
                
                let person1Gesture = ChatRedirctGesture(target: self, action: #selector(chatRedirect))
                person1Gesture.redirectId = alumniEventList.mediaBdayChat[0].sender_id
                person1Gesture.redirectName = alumniEventList.mediaBdayChat[0].sender_name
                person1Gesture.redirectProfile = alumniEventList.mediaBdayChat[0].sender_profile
                cell.person1View.addGestureRecognizer(person1Gesture)
                
                
              
                
            }else{
                cell.person2View.isHidden = true
                cell.person2Img.isHidden = true
                cell.person1View.isHidden = true
                cell.person1Img.isHidden = true
            }
            cell.deleteView.isHidden = true
            cell.editView.isHidden  = true
           
            cell.titleDiscShowView.isHidden  = true
            cell.venuHeight.constant  = 0
            cell.venueShowView.isHidden = true

                         }else if passType == "Yours_BDay"{
                             cell.bdayViewTopp.constant = -120
                             cell.bdayProfileShowImg.isHidden = true
                             cell.bdayProfileShowImg.sd_setImage(with: URL(string:  passProfile), placeholderImage: UIImage(named: "image 2"))
                             cell.bdayGifImg.isHidden = true
                             cell.venuHeight.constant  = 0
                             cell.venueShowView.isHidden = true
//                              cell.bdayGifImg.image = UIImage.gif(name: "Invitation")
                             let gifURL = UIImage.gif(name: "Balloons Happy Birthday with confetti")
                                       // Use SDWebImage to load and display the GIF image
//                             cell.bdayGifImg.image = gifURL
                             
      //                       cell.bdayGifImgHeight.constant = 0
                             
                             cell.titleTop.constant = -240
                             
                             cell.person1View.isHidden = false
                             cell.person1Img.isHidden = false
                             cell.person1Img.sd_setImage(with: URL(string:  passProfile), placeholderImage: UIImage(named: "image 2"))

                             cell.person2View.isHidden = true
                             cell.deleteView.isHidden = true
                             cell.editView.isHidden  = true
                             cell.bdayView.isHidden = true
                                                         cell.bdayTitleLbl.isHidden = true
                                                         cell.wishChatView.isHidden = true
                                                      

//                         }else{
//                             cell.bdayView.isHidden = true
//                             cell.bdayTitleLbl.isHidden = true
//                             cell.wishChatView.isHidden = true
//                             cell.bdayGifImg.isHidden = true
                         }else if passType == "Yours_BDay_Chat"{
                             
                          
                             bdayGetMedia = alumniEventList.mediaBdayChat
                             cell.bdayViewTopp.constant = -120
                             cell.TypeOtherBdayStr = passType
                             cell.BirthDayTypeStr = passProfile
                                              cell.bdayView.isHidden = false
                                              cell.bdayTitleLbl.text = titlePassStr
                                             cell.bdayGifImg.isHidden = false
                             cell.bdayProfileShowImg.isHidden = false
                             cell.bdayProfileShowImg.sd_setImage(with: URL(string:  passProfile), placeholderImage: UIImage(named: "image 2"))

                                              cell.wishChatView.isHidden = true
                             
                             print("cellTypeGest",cell.profileType)
                 //
                             let gifURL = UIImage.gif(name: "Balloons Happy Birthday with confetti")
                                       // Use SDWebImage to load and display the GIF image
//                             cell.bdayGifImg.image = gifURL
                             
                             print("cellTypeGestalumniEventListmediaBdayChatcount",alumniEventList.mediaBdayChat.count)
                             if alumniEventList.mediaBdayChat.count == 1 {
                                 
                                 
                                 cell.person1View.isHidden = false
                                 cell.person1Img.isHidden = false
                               
                                 cell.person1Img.sd_setImage(with: URL(string: alumniEventList.mediaBdayChat[0].sender_profile ), placeholderImage: UIImage(named: "image 2"))
                             
                                 //
                                 cell.person2View.isHidden = true
                                 
                                 
                                
                                 
                                 let person1Gesture = UITapGestureRecognizer(target: self, action: #selector(birthdayWishesVc))
                                 cell.person1View.addGestureRecognizer(person1Gesture)
                                 
                                 
                             }else if alumniEventList.mediaBdayChat.count == 2 {
                                 
                                 
                                 cell.person1View.isHidden = false
                                 cell.person1Img.isHidden = false
                                 
                                 cell.person1Img.sd_setImage(with: URL(string:  alumniEventList.mediaBdayChat[0].sender_profile), placeholderImage: UIImage(named: "image 2"))
                                 //
                                 cell.person2View.isHidden = false
                                 cell.person2Img.isHidden = false
                                 cell.person2Img.sd_setImage(with: URL(string:  alumniEventList.mediaBdayChat[1].sender_profile), placeholderImage: UIImage(named: "image 2"))
                                 //
                                
                                 
                                 
                                 let person2Gesture = UITapGestureRecognizer(target: self, action: #selector(birthdayWishesVc))
                                 cell.person2View.addGestureRecognizer(person2Gesture)
                                 
                                 let person1Gesture = UITapGestureRecognizer(target: self, action: #selector(birthdayWishesVc))
                                 cell.person1View.addGestureRecognizer(person1Gesture)
                                 
                             }else{
                                 cell.person2View.isHidden = true
                                 cell.person2Img.isHidden = true
                                 cell.person1View.isHidden = true
                                 cell.person1Img.isHidden = true
                             }
                             cell.deleteView.isHidden = true
                             cell.editView.isHidden  = true
                            
                             cell.titleDiscShowView.isHidden  = true
                             cell.venuHeight.constant  = 0
                             cell.venueShowView.isHidden = true

                         }
             //
                         
                         print("alumniEventListalumniEventList.type",alumniEventList.type)

                         
                         print("alumniEventList.desc",alumniEventList.description)

                         print("alumniEventList.type",alumniEventList.type)
                         print("alumniEventList.type",alumniEventList.type)
                         
                         print("alumniEventList.type",alumniEventList.type)
//
                     
                         
            
          
                         
              
       //
       //                  }
                         
                         cell.editDeleteViewHeight.constant = 0
                         cell.editView.isHidden = true
                         cell.deleteView.isHidden = true
       //
//                         cell.editImg.isHidden = true
//                         cell.deleteImg.isHidden = true
                         
                         
       //                  let editGes = DeleteGesture(target: self, action: #selector(editClick))
       //                  editGes.deleteId = alumniEventList.id
       //                  editGes.venue = alumniEventList.venue
       //                  editGes.fromDate = alumniEventList.fromTime
       //                  editGes.title = alumniEventList.title
       //                  editGes.toDate = alumniEventList.toTime
       //                  editGes.nameheading = alumniEventList.name
       //                  editGes.desc = alumniEventList.description
       //                  cell.editView.addGestureRecognizer(editGes)
       //
       //
       //                  let deleteGes = DeleteGesture(target: self, action: #selector(deleteClick))
       //                  deleteGes.deleteId = alumniEventList.id
       //                  cell.deleteView.addGestureRecognizer(deleteGes)
       //
                     }
       //
        
        let chatGes = ChatRedirctGesture(target: self, action: #selector(chatRedirect))
        chatGes.redirectId = passUserId
        chatGes.redirectName = passUserName
        chatGes.redirectProfile = passProfile
        cell.wishChatView.addGestureRecognizer(chatGes)
        
             
               return cell





    }
    
    
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView){
            let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
            verticalIndicator.backgroundColor = UIColor.green

            let horizontalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 2)] as! UIImageView)
            horizontalIndicator.backgroundColor = UIColor.blue
       }

    
    @IBAction func editClick(ges : DeleteGesture) {
        
        
        
//        @IBAction func createEvent() {
            let storyboard = UIStoryboard(name: "EventsWishesAppearedStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! EventsWishesAppearedViewController
        
        print(" ges.deleteId", ges.deleteId)
        print(" ges..venue", ges.venue)
        viewController.getDeleteId = ges.deleteId
        viewController.getVenue = ges.venue
        viewController.getFromDate = ges.fromDate
        viewController.getToDate = ges.toDate
        viewController.getTitle = ges.title
        viewController.getNameheading = ges.nameheading
        viewController.getDesc = ges.desc
        viewController.editType = 1
        viewController.editId =  ges.eventId
        viewController.getMediaInstitute = ges.getMediaInstitute

        self.main_vc.present(viewController, animated: true)
            
            
    //        let storyboard = UIStoryboard(name: "RequestAssistStoryboard", bundle: nil)
    //        let viewController = storyboard.instantiateInitialViewController() as! RequestAssistViewController
    //        self.present(viewController, animated: true)
            
           
    //            }
//        }

        
        
        
    }
    
    
    @IBAction func deleteClick(ges : DeleteGesture) {
        print("ges.deleteId",ges.deleteId)
        
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("ges.deleteId",ges.deleteId)
            
            let deleteModal = DeleteEventDetailModal()
            deleteModal.event_id = ges.deleteId
            
            
            var  deleteModalStr = deleteModal.toJSONString()
            print("deleteModal",deleteModal.toJSON())
            print("createEventModalStr",deleteModalStr)
            print("token",token)
            EventDeleteRequest.call_request(param: deleteModalStr!,token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteEventDetailResponse = Mapper<DeleteEventDetailResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    getEventInstituteList()
                    
//                    let alert = UIAlertController(title: "Success", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
//                    mainVc.present(alert, animated: true, completion: nil)
//                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
//
                        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                        let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                        
                    main_vc.present(viewController, animated: true)
//
//                    }))
                    tv.dataSource = self
                    tv.delegate = self
                    tv.reloadData()
                    print("creaveEventRes",deleteRes.message)
                    
                    
                }else{
                    let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.main_vc.present(alert, animated: true, completion: nil)
                }
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        self.main_vc.present(refreshAlert, animated: true, completion: nil)

        //      main.present(refreshAlert, animated: true, completion: nil)
        
        
    }
    

    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
    
    @IBAction  func getEventInstituteList () {
        
        
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": 0
            
        ]
        
        
        
        print("token",token)
        print("param",param)
        
        GetEventInstituteListRequest.call_request(param: param,token: token){ [self]
            (res) in
            
//            res.
            let instituteEventResponse : GetInstituteEventDetailResponse = Mapper<GetInstituteEventDetailResponse>().map(JSONString: res)!
            
            if instituteEventResponse.status == true {
                print("error \(instituteEventResponse.status)")

                passGetInstituteData = instituteEventResponse.data
                //                getAlumniData = alumniNetworkResponse.data
                //
                
//                alertView.isHidden = true
//                        gifImg.isHidden = true
                
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                //                tv.dataSource = self
                //                tv.delegate = self
                //
                //                tv.reloadData()
                //
                
            }else{
                
                
//                alertView.isHidden = false
//                        gifImg.isHidden = false
//                self.gifImg.image = UIImage.gif(name: "no_data_found")

                
                //                let alert = UIAlertController(title: "Alert", message: instituteEventResponse.message, preferredStyle: UIAlertController.Style.alert)
                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                //                self.main.present(alert, animated: true, completion: nil)
                
                //
                
            }
            
            
        }
    }
    
    
    
    
    @IBAction  func getEventAlumniList () {
        
        
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": 0
            
        ]
        
        
        
        print("token",token)
        print("param",param)
        
        GetEventAlumniListRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let alumniEventResponse : GetAlumniEventDetailResponse = Mapper<GetAlumniEventDetailResponse>().map(JSONString: res)!
            
            if alumniEventResponse.status == true {
                passGetAlumniData = alumniEventResponse.data
                //                getAlumniData = alumniNetworkResponse.data
                //
                
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                //                tv.dataSource = self
                //                tv.delegate = self
                //
                //                tv.reloadData()
                //
                
            }else{
                
                //                let alert = UIAlertController(title: "Alert", message: instituteEventResponse.message, preferredStyle: UIAlertController.Style.alert)
                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                //                self.main.present(alert, animated: true, completion: nil)
                
                //
                
            }
            
            
        }
    }
    

}

class DeleteGesture : UITapGestureRecognizer {
    var deleteId : Int!
    var fromDate : String!
    var toDate : String!
    var desc : String!
    var title : String!
    var venue : String!
    var nameheading : String!
    var eventId : Int!
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []

}

class getImgGesture  : UITapGestureRecognizer {
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
    var alumniContributeMedia : [GetContributeAlumniReferenceMedia] = []

    
}

class ChatRedirctGesture : UITapGestureRecognizer {
    var redirect : String!
    var redirectName : String!
    var redirectDesignation : String!
    var redirectProfile : String!
    var redirectId : Int!
    
    var companyName : String!
    var userImg : String!

    var instituteName : String!
    var batch : String!
    
}
