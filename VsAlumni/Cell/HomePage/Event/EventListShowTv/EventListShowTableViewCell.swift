//
//  EventListShowTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 20/02/24.
//

import UIKit
import WebKit
class EventListShowTableViewCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var bdayViewTopp: NSLayoutConstraint!
    
    @IBOutlet weak var titleTop: NSLayoutConstraint!
    @IBOutlet weak var bdayProfileShowImg: UIImageView!
    @IBOutlet weak var bdayViewTop: NSLayoutConstraint!
    @IBOutlet weak var venuHeight: NSLayoutConstraint!
    @IBOutlet weak var titleDiscShowView: UIView!
    @IBOutlet weak var venueShowView: UIViewX!
    
    @IBOutlet weak var person1View: UIViewX!
    
    @IBOutlet weak var person1Img: UIImageView!
    
    @IBOutlet weak var person2Img: UIImageView!
    
    @IBOutlet weak var wishChatView: UIView!
    
    @IBOutlet weak var person2View: UIViewX!
    
    
    @IBOutlet weak var bdayGifImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var editDeleteViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var bdayGifImg: UIImageView!
    
    @IBOutlet weak var editView: UIViewX!
    @IBOutlet weak var deleteView: UIViewX!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var venueLbl: UILabel!
    
    @IBOutlet weak var fromTimeLbl: UILabel!
    @IBOutlet weak var bdayTitleLbl: UILabel!
    
    @IBOutlet weak var mapPin: UIImageView!
    
    @IBOutlet weak var to_timeLbl: UILabel!
    
    
    @IBOutlet weak var bdayView: UIView!
    
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []
    
    var getAlumniMedia : [getAlumniEventReferenceMedia] = []
    var memberType : Int!
    var main_vc : UIViewController!
    var getEventTitleText : String!

    let rowId =  "EventListShowingTableViewCell"
    
    var profileType : String = "Others_BDay"
    var profileImg : String!
    var stringss : [String] = []
    var TypeOtherBdayStr : String!
    var BirthDayTypeStr : String!
    
    var getEventsType : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        bdayProfileShowImg.layer.cornerRadius = 30
        
        print("typetype11",profileType)
        print("getEventsTypegetEventsType1111",Constant.DefaultsKeys.getEventsType)
        print("getEventsType",getEventsType)
        Constant.DefaultsKeys.getEventsType = getEventsType
       
        person1Img.layer.cornerRadius = 30
        person2Img.layer.cornerRadius = 30
        print("EventListShowTableViewCell")
//        self.mapPin.image = UIImage.gif(name: "location_pin")
        let gifURL = UIImage.gif(name: "location_pin")
                  // Use SDWebImage to load and display the GIF image
        mapPin.image = gifURL
        let defaults =  UserDefaults.standard
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        
        print("EventListShowTableViewCellmemberType",memberType)
        if memberType == 1 || memberType == 2 {
            wishChatView.isHidden = true
        }else{
            wishChatView.isHidden = false
        }
        
        
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
      
        
        tv.dataSource = self
        tv.delegate = self
        tv.register(UINib(nibName: rowId, bundle: nil), forCellReuseIdentifier: rowId)
//        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)

        
        deleteView.isHidden = true
        editView.isHidden  = true
      
        
        print("BirthDayTypeStr",BirthDayTypeStr)
        
        print("TypeOtherBdayStrTypeOtherBdayStr",TypeOtherBdayStr)
        
    }
    
    
   
    
    func scrollViewDidScroll(scrollView: UIScrollView){
            let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
            verticalIndicator.backgroundColor = UIColor.green

            let horizontalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 2)] as! UIImageView)
            horizontalIndicator.backgroundColor = UIColor.blue
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("12numberOfRowsInSection",getMediaInstitute.count)
        print("getAlumniMediagetAlumniMedia",getAlumniMedia.count)

        if memberType == 1 || memberType == 2 {
            return getMediaInstitute.count
        }else{
//            if Constant.DefaultsKeys.getEventsType == "Yours_BDay" {
//                return 1
//            }else if Constant.DefaultsKeys.getEventsType == "Others_BDay" {
//                return 1
//            }else{
                return getAlumniMedia.count
//            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! EventListShowingTableViewCell
        print("typetype1",profileType)
//
        cell.selectionStyle = .none
        print("w3w3e3getMediaInstitute",getMediaInstitute.count)
        if memberType == 1 || memberType == 2 {
            let getMedia : getInstituteEventReferenceMedia = getMediaInstitute[indexPath.row]

            print("typetype",profileType)
            
//
            print("w3w3e3getMediaInstitute",getMediaInstitute.count)
//
            
                   
                   if getMedia.type == "image" {
                       
                       
                       cell.webKitt.isHidden = true
                       cell.imgList.isHidden = false
                       cell.imgList.isUserInteractionEnabled = true
          
                       
                       cell.imgList.sd_setImage(with: URL(string:  getMedia.url!), placeholderImage: UIImage(named: "sample_black_screen"))
                       let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                       zoomGest.getInstType = 1

                       zoomGest.gesRedirctType = "Institute"
                           zoomGest.img = getMedia.url
                       zoomGest.zoomInstituteMedia = getMediaInstitute
                       zoomGest.eventTitleLbl = getEventTitleText

                       cell.imgViewTap.addGestureRecognizer(zoomGest)
                   }else if getMedia.type == "video"{
                       cell.imgList.isHidden = true
                       cell.webKitt.isHidden = false
     
                       let myURL = URL(string: "https://player.vimeo.com/video/813089863?title=0&amp;byline=0&amp;portrait=0&amp;speed=0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=177030")
                       let myRequest = URLRequest(url: myURL!)
                       cell.webKitt.load(myRequest)
                   }else{
                       cell.webKitt.isHidden = true
                       cell.imgList.isHidden = false
                       cell.imgList.image = UIImage(named: "unsplash")

                   }
            
            
         
            
            
            
            
            
        }else{
          
print("TypeConstantDefaultsKeysgetEventsType",Constant.DefaultsKeys.getEventsType)
            print("Constant.DefaultsKeys.getEventsProfile)",Constant.DefaultsKeys.getEventsProfile)
            if Constant.DefaultsKeys.getEventsType == "Yours_BDay_Chat" {
////                if TypeOtherBdayStr == "Others_BDay" {
//                    
//                print("INSIDEEE")
//                    //
//                    
//                cell.imgList.sd_setImage(with: URL(string:  Constant.DefaultsKeys.getEventsProfile), placeholderImage: UIImage(named: "image 2"))
//                    
//                    
////                    
////                }else if TypeOtherBdayStr == "Yours_BDay"{
////                    
////                    cell.imgList.sd_setImage(with: URL(string:  BirthDayTypeStr), placeholderImage: UIImage(named: "image 2"))
////                    
////                    
////                }
//                
//                cell.webKitt.isHidden = true
//                cell.imgList.isHidden = false
////                cell.imgList.image = UIImage(named: "unsplash")
//                
            }else  if Constant.DefaultsKeys.getEventsType == "Others_BDay" {
//                //                if TypeOtherBdayStr == "Others_BDay" {
                                    
                                print("INSIDEEE")
//                                    //
//                                    
//                                cell.imgList.sd_setImage(with: URL(string:  Constant.DefaultsKeys.getEventsProfile), placeholderImage: UIImage(named: "image 2"))
//                                    
//                                    
//                //
//                //                }else if TypeOtherBdayStr == "Yours_BDay"{
//                //
//                //                    cell.imgList.sd_setImage(with: URL(string:  BirthDayTypeStr), placeholderImage: UIImage(named: "image 2"))
//                //
//                //
//                //                }
//                                
//                                cell.webKitt.isHidden = true
//                                cell.imgList.isHidden = false
//                //                cell.imgList.image = UIImage(named: "unsplash")
//                                
                            }else{
                let getMedia : getAlumniEventReferenceMedia = getAlumniMedia[indexPath.row]
                
                
     
                print("typetype",profileType)
                print("getEventsTypegetEventsType",getEventsType)
                print("EventMediacount",getAlumniMedia.count)
                if getMedia.type == "image" {
                    
                    cell.imgList.isUserInteractionEnabled = true
                    
                    cell.webKitt.isHidden = true
                    cell.imgList.isHidden = false
                    
                    cell.imgList.sd_setImage(with: URL(string:  getMedia.url!), placeholderImage: UIImage(named: "sample_black_screen"))
                    
                    let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                    zoomGest.img = getMedia.url
                    zoomGest.getalumniType = 1
                    zoomGest.gesRedirctType = "Alumni"
                    zoomGest.eventTitleLbl = getEventTitleText
                    
                    zoomGest.zoomAlumniMedia = getAlumniMedia
                    cell.imgViewTap.addGestureRecognizer(zoomGest)
                    
                }else if getMedia.type == "video"{
                    cell.imgList.isHidden = true
                    cell.webKitt.isHidden = false
                    
                    
                    
                    let myURL = URL(string: "https://player.vimeo.com/video/813089863?title=0&amp;byline=0&amp;portrait=0&amp;speed=0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=177030")
                    let myRequest = URLRequest(url: myURL!)
                    cell.webKitt.load(myRequest)
                }else{
                    
                   
                    //
                    
                    
                    
                    
                 
                    
                }
            }
        }
               
               return cell




    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("memberType",memberType)

        if memberType == 1 || memberType == 2 {
            if getMediaInstitute.count < 1 {
                print("getMediaInstitute222",getMediaInstitute.count)

//                return UITableView.automaticDimension
                return 250
            }else{
                return 330
            }
           
        }else{
            print("getAlumniMedia1111111",getAlumniMedia.count)

            if getAlumniMedia.count < 1 {

                return 250
            }else{
                return 330
            }
           
        }
        return 150
       
    }
    
    @IBAction func zoomVc(ges : getImgGesture) {
        
        print("imgzommssssssssssss",ges.img)
        
        stringss.removeAll()
        
        if memberType == 1 || memberType == 2 {
            for i in getMediaInstitute{
                
                stringss.append(i.url)
            }
            
        }else{
            for i in getAlumniMedia{
                
                stringss.append(i.url)
            }
            
        }
            
            if let index = stringss.firstIndex(of: ges.img) {
                stringss.remove(at: index)
                stringss.insert(ges.img, at: 0)
            }
        
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
               let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.img
        viewController.redirectType = ges.gesRedirctType
        viewController.eventTitle = ges.eventTitleLbl
        print("ges.getalumniType",ges.getalumniType)
        print("ges.getInstType",ges.getInstType)

        viewController.stringss = stringss
        viewController.getMediaInstitute = ges.zoomInstituteMedia

        viewController.getAlumniMedia = ges.zoomAlumniMedia
        print("ges.img",ges.img)
        self.main_vc.present(viewController, animated: true)
    }
    
    
}


