//
//  HomePageEventCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper


class HomePageEventCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var addViewHeight: NSLayoutConstraint!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var gifImg: UIImageView!
    
    
    @IBOutlet weak var deleteView: UIViewX!
    @IBOutlet weak var Edit: UIViewX!
    @IBOutlet weak var addView: UIViewX!
    
    
    @IBOutlet weak var cv: UICollectionView!
    
    var token : String!
    var memberType : Int!
    
    var getInstituteData : [GetInstituteEventDetailData] = []
    var getAlumniData : [GetAlumniEventDetailData] = []
    var getMedia : [getInstituteEventReferenceMedia] = []
    var getAlumniMedia : [getAlumniEventReferenceMedia] = []
    
    let rowId = "EventListShowingCollectionViewCell"
    var mainVc : UIViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("HomePageEventCollectionViewCell")

        cv.dataSource = self
        cv.delegate = self
//        addView.isHidden = true

        alertView.isHidden = true
                gifImg.isHidden = true
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        print("tokentoken",token)

        print("EventMemberType",memberType)
        if memberType == 1 || memberType == 2 {
//        getEventInstituteList()
//                  addView.isHidden = false
//            addViewHeight.constant = 50
              }else{
//                  addView.isHidden = true
//                  addViewHeight.constant = 0

              }
        
        
        
        
        
        
       
        
        cv.register(UINib(nibName: rowId, bundle: nil), forCellWithReuseIdentifier: rowId)
      
        
        
        
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

                getInstituteData = instituteEventResponse.data
                //                getAlumniData = alumniNetworkResponse.data
                //
                
                alertView.isHidden = true
                        gifImg.isHidden = true
                
                cv.dataSource = self
                cv.delegate = self
                cv.reloadData()
                //                tv.dataSource = self
                //                tv.delegate = self
                //
                //                tv.reloadData()
                //
                
            }else{
                
                
                alertView.isHidden = false
                        gifImg.isHidden = false
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImg.image = gifURL
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
                getAlumniData = alumniEventResponse.data
                //                getAlumniData = alumniNetworkResponse.data
                //
                
                cv.dataSource = self
                cv.delegate = self
                cv.reloadData()
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView.frame.size.height11",collectionView.frame.size.height )
        return CGSize(width:  400 / 2 + 80 , height: 800)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("heloooooo",getInstituteData.count)
        if memberType == 1 || memberType == 2 {
            return getInstituteData.count
              }else{
                  return getAlumniData.count
              }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId, for: indexPath) as! EventListShowingCollectionViewCell
        

        if memberType == 1 || memberType == 2 {
            let instEventList : GetInstituteEventDetailData = getInstituteData[indexPath.row]

            cell.passGetInstituteData = getInstituteData
            cell.namePassStr = instEventList.name
            cell.titlePassStr = instEventList.title
            cell.fromPassStr = instEventList.fromTime

            cell.toPassStr = instEventList.toTime

            cell.venuePassStr = instEventList.venue
            cell.descPassStr = instEventList.description
            cell.getMediaInstitute = instEventList.media
            cell.main_vc = mainVc
        }else{
            let alumniEventList : GetAlumniEventDetailData = getAlumniData[indexPath.row]

            cell.passGetAlumniData = getAlumniData
            cell.namePassStr = alumniEventList.name
            cell.titlePassStr = alumniEventList.title
            cell.fromPassStr = alumniEventList.fromTime

            cell.toPassStr = alumniEventList.toTime

            cell.descPassStr = alumniEventList.description
            cell.getAlumniMedia = alumniEventList.media
            cell.main_vc = mainVc
            cell.venuePassStr = alumniEventList.venue


        }
           return cell
    }
    
    
    
    
   
    
}
    
    
   
