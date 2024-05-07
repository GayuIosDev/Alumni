//
//  HomePAgeContribureCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper

class HomePAgeContribureCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var contributeView: UIView!
    
    var token : String!
    
    var contributeData : [GetInstituteContributeResponseData] = []
    var contributeAlumniData : [GetAlumniSupportRequestReesponseData] = []
    var bulletPoints : [GetContributeBulletPoints] = []
    var contributeMedia : [GetContributeReferenceMedia] = []
    var alumniContributeMedia : [GetContributeAlumniReferenceMedia] = []
    var mainVc : UIViewController!
    var memberType : Int!
    var stringss : [String] = []
    var imageUrls : String!
    let rowId = "GetContributeListCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        
        contributeView.isHidden = true
        
        cv.dataSource = self
        cv.delegate = self
        
        cv.register(UINib(nibName: rowId, bundle: nil), forCellWithReuseIdentifier: rowId)
        
        
        
        if memberType == 1 || memberType == 2 {
            //        getEventInstituteList()
            //            getContributrList()
            //                  contributeView.isHidden = false
        }else{
            contributeView.isHidden = true
            //                  getContributrList()
            //                  getEventAlumniList()
        }
        
        getContributrList()
        // Initialization code
    }
    
    
    @IBAction func getContributrList() {
        
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": 0
            
        ]
        
        print("token",token)
        getContributeRequest.call_request(param: param, token: token){ [self]
            (res) in
            
            let contributeModalRes : GetInstituteContributeResponse = Mapper<GetInstituteContributeResponse>().map(JSONString: res)!
            
            if contributeModalRes.status == true {
                
                contributeData = contributeModalRes.data
                
                //                AlumniGalleryData = contributeModalRes.data
                //                for i in AlumniGalleryModalRes.data {
                //                    dropdownLbl.text = i.institute_name
                //
                //                    dropDownInstiId = i.institute_id
                //                }
                //                instituteId = dropDownInstiId
                //                getInstituteGalleryList()
                
                cv.isHidden = false
                cv.dataSource = self
                cv.delegate = self
                cv.reloadData()
                
                //            }else{
                //                let alert = UIAlertController(title: "Alert", message: contributeModalRes.message, preferredStyle: UIAlertController.Style.alert)
                //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                //                self.main.present(alert, animated: true, completion: nil)
            }
            
            
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if memberType == 1 || memberType == 2 {
            return contributeData.count
        }else{
            return contributeAlumniData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        
        if memberType == 1 || memberType == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId , for: indexPath) as! GetContributeListCollectionViewCell
//            cell.insLbHeight.constant = 0
            cell.alumniInstNameLbl.isHidden = true
            let contribute : GetInstituteContributeResponseData = contributeData[indexPath.item]
            cell.descLbl.text = contribute.description
            cell.titleLbl.text = contribute.title
            cell.activeFromLbl.text =  "Active From :" + contribute.activeFrom
            cell.activeToLbl.text =  "Active To :" + contribute.activeTo
            cell.bulletPoints = contribute.bulletPoints
            print("contribute.bulletPoints",contribute.bulletPoints)
            
            
            
            
            
            contributeMedia = contribute.reference_media
            print("contribute.celldof",contributeMedia)
            
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
            
            
//            let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
//            moreDetails.fundNeeded = contribute.noRequired
//            moreDetails.fundReceived = contribute.noReceived
//            moreDetails.noPending = contribute.noPending
//            moreDetails.requestId = contribute.id
//            cell.moreDetailView.addGestureRecognizer(moreDetails)
            
            
            if contribute.isAmount == true {
                
                cell.moreDetailView.isHidden = false
                let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                moreDetails.fundNeeded = contribute.noRequired
                moreDetails.fundReceived = contribute.noReceived
                moreDetails.noPending = contribute.noPending
                moreDetails.requestId = contribute.id
//                moreDetails.instId = contribute.instituteId
                moreDetails.getInstituteName = contribute.instituteName
                moreDetails.getTitleLbl = contribute.title
                moreDetails.isAmountCheck = "Amount"
                cell.moreDetailView.addGestureRecognizer(moreDetails)
                
            }else{
                cell.moreDetailView.isHidden = false
                let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                moreDetails.fundNeeded = contribute.noRequired
                moreDetails.fundReceived = contribute.noReceived
                moreDetails.noPending = contribute.noPending
                moreDetails.requestId = contribute.id
                moreDetails.getInstituteName = contribute.instituteName
                moreDetails.getTitleLbl = contribute.title
//                moreDetails.instId = contribute.instituteId
                moreDetails.isAmountCheck = "Volunteer"
                cell.moreDetailView.addGestureRecognizer(moreDetails)
                
            }
            
            
            contributeMedia = contribute.reference_media
            print("contribute.noRequired",contribute.noRequired)
            print("contribute.noReceived",contribute.noReceived)
            print("contribute.noPending",contribute.noPending)
            //        for i in contributeMedia {
            
            
            cell.noRecordView.isHidden = true
            cell.noRexordImg.isHidden = true
            
            print("bulletPoints.noPending",bulletPoints.count)
            
            if contributeMedia.count == 0  {
//                && bulletPoints.count == 0 {
                cell.noMediaImg.isHidden = false
//                cell.noRecordView.isHidden = false
//                cell.noMediaImg.image = UIImage.gif(name: "Money Donation")
                let gifURL = UIImage.gif(name: "Money Donation")
                          // Use SDWebImage to load and display the GIF image
//                cell.noMediaImg.image = gifURL Hide....
                cell.tvHeight.constant = 200
            }else{
                cell.noMediaImg.isHidden = true
            }
            
            if contributeMedia.count == 1 {
                
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = true
                cell.img3.isHidden = true
                cell.img4.isHidden = true
                
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest.getInstType = 3
                           zoomGest.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[0].url
               //            print("contribute.reference_media",contcontributeMedia[0].urlribute.reference_media.count)
                           zoomGest.contributeMedia = contribute.reference_media
                           zoomGest.contributeTitleLbl = contribute.title
               
                           cell.img2View.addGestureRecognizer(zoomGest)
               
                        
                cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                
            }
            else if contributeMedia.count == 2 {
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = false
                cell.img3.isHidden = true
                cell.img4.isHidden = true
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest.getInstType = 3
                           zoomGest.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[0].url
               //            print("contribute.reference_media",contcontributeMedia[0].urlribute.reference_media.count)
                           zoomGest.contributeMedia = contribute.reference_media
                           zoomGest.contributeTitleLbl = contribute.title
               
                           cell.img2View.addGestureRecognizer(zoomGest)
               
                           let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest1.getInstType = 3
                           zoomGest1.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[1].url
               
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest1.contributeMedia = contribute.reference_media
                           zoomGest1.contributeTitleLbl = contribute.title
               
                           cell.img1View.addGestureRecognizer(zoomGest1)
                cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            else if contributeMedia.count == 3 {
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = false
                cell.img3.isHidden = false
                cell.img4.isHidden = true
                
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest.getInstType = 3
                           zoomGest.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[0].url
               //            print("contribute.reference_media",contcontributeMedia[0].urlribute.reference_media.count)
                           zoomGest.contributeMedia = contribute.reference_media
                           zoomGest.contributeTitleLbl = contribute.title
               
                           cell.img2View.addGestureRecognizer(zoomGest)
               
                           let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest1.getInstType = 3
                           zoomGest1.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[1].url
               
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest1.contributeMedia = contribute.reference_media
                           zoomGest1.contributeTitleLbl = contribute.title
               
                           cell.img1View.addGestureRecognizer(zoomGest1)
               
                           let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest3.getInstType = 3
                           zoomGest3.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[2].url
               
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest3.contributeMedia = contribute.reference_media
                           zoomGest3.contributeTitleLbl = contribute.title
               
                           cell.img3View.addGestureRecognizer(zoomGest3)
                           
                cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            else if contributeMedia.count == 4 {
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = false
                cell.img3.isHidden = false
                cell.img4.isHidden = false
                
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest.getInstType = 3
                           zoomGest.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[0].url
               //            print("contribute.reference_media",contcontributeMedia[0].urlribute.reference_media.count)
                           zoomGest.contributeMedia = contribute.reference_media
                           zoomGest.contributeTitleLbl = contribute.title
               
                           cell.img2View.addGestureRecognizer(zoomGest)
               
                           let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest1.getInstType = 3
                           zoomGest1.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[1].url
               
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest1.contributeMedia = contribute.reference_media
                           zoomGest1.contributeTitleLbl = contribute.title
               
                           cell.img1View.addGestureRecognizer(zoomGest1)
               
                           let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest3.getInstType = 3
                           zoomGest3.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[2].url
               
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest3.contributeMedia = contribute.reference_media
                           zoomGest3.contributeTitleLbl = contribute.title
               
                           cell.img3View.addGestureRecognizer(zoomGest3)
                           
                           let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
                           zoomGest4.getInstType = 3
                           zoomGest4.gesRedirctType = "Contribute"
                           zoomGest.img =  contributeMedia[3].url
               //            print("contribute.reference_media",contribute.reference_media.count)
                           zoomGest4.contributeTitleLbl = contribute.title
                           zoomGest4.contributeMedia = contribute.reference_media
                           cell.img4View.addGestureRecognizer(zoomGest4)
                           
                
                cell.img2View.addGestureRecognizer(zoomGest)
                cell.img1.sd_setImage(with: URL(string:  contributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  contributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img3.sd_setImage(with: URL(string:  contributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img4.sd_setImage(with: URL(string:  contributeMedia[3].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            //        }
            
            
            
            
//            let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//            zoomGest.getInstType = 3
//            zoomGest.gesRedirctType = "Contribute"
//            zoomGest.img =  contributeMedia[0].url
////            print("contribute.reference_media",contcontributeMedia[0].urlribute.reference_media.count)
//            zoomGest.contributeMedia = contribute.reference_media
//            zoomGest.contributeTitleLbl = contribute.title
//            
//            cell.view1.addGestureRecognizer(zoomGest)
//            
//            let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
//            zoomGest1.getInstType = 3
//            zoomGest1.gesRedirctType = "Contribute"
//            zoomGest.img =  contributeMedia[0].url
//            
////            print("contribute.reference_media",contribute.reference_media.count)
//            zoomGest1.contributeMedia = contribute.reference_media
//            zoomGest1.contributeTitleLbl = contribute.title
//            
//            cell.img1View.addGestureRecognizer(zoomGest1)
//            
//            let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
//            zoomGest3.getInstType = 3
//            zoomGest3.gesRedirctType = "Contribute"
//            zoomGest.img =  contributeMedia[0].url
//            
////            print("contribute.reference_media",contribute.reference_media.count)
//            zoomGest3.contributeMedia = contribute.reference_media
//            zoomGest3.contributeTitleLbl = contribute.title
//            
//            cell.img3View.addGestureRecognizer(zoomGest3)
            
//            let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
//            zoomGest4.getInstType = 3
//            zoomGest4.gesRedirctType = "Contribute"
//            zoomGest.img =  contributeMedia[0].url
////            print("contribute.reference_media",contribute.reference_media.count)
//            zoomGest4.contributeTitleLbl = contribute.title
//            zoomGest4.contributeMedia = contribute.reference_media
//            cell.img4View.addGestureRecognizer(zoomGest4)
            
            if memberType == 1 || memberType == 2 {
                //
                cell.viewDelete.isHidden = false
                cell.viewDeleteHeight.constant = 30
            }else{
                cell.viewDelete.isHidden = true
                cell.viewDeleteHeight.constant = 0

                //                  getEventAlumniList()
            }
            
            
            let deleteGes = ContributeDeleteGesture(target: self, action: #selector(deleteClick))
            deleteGes.deleteId = contribute.id
            cell.viewDelete.addGestureRecognizer(deleteGes)
            
            
            return cell
        }else{
            
            
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId , for: indexPath) as! GetContributeListCollectionViewCell
            
            cell.viewDelete.isHidden = true
            cell.viewDeleteHeight.constant = 0
            
            let contribute : GetAlumniSupportRequestReesponseData = contributeAlumniData[indexPath.item]
            cell.descLbl.text = contribute.description
            cell.titleLbl.text = contribute.title
            cell.activeFromLbl.text =  "Active From :" + contribute.activeFrom
            cell.activeToLbl.text =  "Active To :" + contribute.activeTo
            cell.bulletPoints = contribute.bulletPoints
//            print("contribute.bulletPoints",contribute.bulletPoints)
            
            alumniContributeMedia = contribute.referenceMedia
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
                moreDetails.isAmountCheck = "Amount"
                moreDetails.getInstituteName = contribute.instituteName
                moreDetails.getTitleLbl = contribute.title
                cell.moreDetailView.addGestureRecognizer(moreDetails)
                
            }else{
                cell.moreDetailView.isHidden = false
                let moreDetails = ContributeDeleteGesture(target: self, action: #selector(moreDetailVc))
                moreDetails.fundNeeded = contribute.noRequired
                moreDetails.fundReceived = contribute.noReceived
                moreDetails.noPending = contribute.noPending
                moreDetails.getInstituteName = contribute.instituteName
                moreDetails.getTitleLbl = contribute.title
                moreDetails.requestId = contribute.id
                moreDetails.instId = contribute.instituteId
                moreDetails.isAmountCheck = "Volunteer"
                cell.moreDetailView.addGestureRecognizer(moreDetails)
                
            }
            
            
           
            
           

            if alumniContributeMedia.count == 0{
                cell.noMediaImg.isHidden = false
//                let gifURL = UIImage.gif(name: "Charity Hands")
//                          // Use SDWebImage to load and display the GIF image
//                cell.noMediaImg.image = gifURL Hide
//                
                //                cell.noRecordView.isHidden = false
//                cell.noMediaImg.image = UIImage.gif(name: "Charity Hands")
//                cell.noRecordView.isHidden = false
//                cell.noRexordImg.image = UIImage.gif(name: "Charity Hands")
                cell.tvHeight.constant = 200
            }else{
                cell.noMediaImg.isHidden = true
            }
            
            
            //        if contributeMedia.count <= 1 {
            
            
            
            if alumniContributeMedia.count == 1 {
                
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = true
                cell.img3.isHidden = true
                cell.img4.isHidden = true
                
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                zoomGest.getInstType = 3
                zoomGest.gesRedirctType = "Contribute"
                zoomGest.img =  alumniContributeMedia[0].url
                
    //            print("contribute.reference_media",contribute.reference_media.count)
                zoomGest.alumniContributeMedia = contribute.referenceMedia
                zoomGest.contributeTitleLbl = contribute.title
                
                cell.img2View.addGestureRecognizer(zoomGest)
                
            
                cell.img1.sd_setImage(with: URL(string:  alumniContributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                
            }
            else if alumniContributeMedia.count == 2 {
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = false
                cell.img3.isHidden = true
                cell.img4.isHidden = true
                
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
           
                cell.img1.sd_setImage(with: URL(string:  alumniContributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  alumniContributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            else if alumniContributeMedia.count == 3 {
                
                cell.tvHeight.constant = 100
                cell.img1.isHidden = false
                cell.imgLstVie.isHidden = false
                
                cell.img2View.isHidden = false
                cell.img2.isHidden = false
                cell.img3.isHidden = false
                cell.img4.isHidden = true
                
                
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
                cell.img1.sd_setImage(with: URL(string:  alumniContributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  alumniContributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img3.sd_setImage(with: URL(string:  alumniContributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            else if alumniContributeMedia.count == 4 {
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
                let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))
                zoomGest1.getInstType = 3
                zoomGest1.gesRedirctType = "Contribute"
                zoomGest1.img =  alumniContributeMedia[0].url
                
    //            print("contribute.reference_media",contribute.reference_media.count)
                zoomGest1.alumniContributeMedia = contribute.referenceMedia
                zoomGest1.contributeTitleLbl = contribute.title
                
                cell.img1View.addGestureRecognizer(zoomGest1)
                
//
                
                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
                zoomGest.getInstType = 3
                zoomGest.gesRedirctType = "Contribute"
                zoomGest.img =  alumniContributeMedia[1].url
                
    //            print("contribute.reference_media",contribute.reference_media.count)
                zoomGest.alumniContributeMedia = contribute.referenceMedia
                zoomGest.contributeTitleLbl = contribute.title
                
                cell.img2View.addGestureRecognizer(zoomGest)
                
//
                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
                zoomGest3.getInstType = 3
                zoomGest3.gesRedirctType = "Contribute"
                zoomGest3.img =  alumniContributeMedia[2].url

                
    //            print("contribute.reference_media",contribute.reference_media.count)
                zoomGest3.alumniContributeMedia = contribute.referenceMedia
                zoomGest3.contributeTitleLbl = contribute.title
                
                cell.img3View.addGestureRecognizer(zoomGest3)
                
                let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
                zoomGest4.getInstType = 3
                zoomGest4.gesRedirctType = "Contribute"
                zoomGest4.img =  alumniContributeMedia[3].url

    //            print("contribute.reference_media",contribute.reference_media.count)
                zoomGest4.contributeTitleLbl = contribute.title
                zoomGest4.alumniContributeMedia = contribute.referenceMedia
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
                cell.img1.sd_setImage(with: URL(string:  alumniContributeMedia[0].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img2.sd_setImage(with: URL(string:  alumniContributeMedia[1].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img3.sd_setImage(with: URL(string:  alumniContributeMedia[2].url!), placeholderImage: UIImage(named: "Avatar"))
                cell.img4.sd_setImage(with: URL(string:  alumniContributeMedia[3].url!), placeholderImage: UIImage(named: "Avatar"))
                
                //            }
            }
            //        }
            
            
           
            if memberType == 1 || memberType == 2 {
                //
                cell.viewDelete.isHidden = false
            }else{
                cell.viewDelete.isHidden = true
                //                  getEventAlumniList()
            }
            
            
            let deleteGes = ContributeDeleteGesture(target: self, action: #selector(deleteClick))
            deleteGes.deleteId = contribute.id
            cell.viewDelete.addGestureRecognizer(deleteGes)
            
            return cell
        }
        
    }
    
    
    
    
    
    
    @IBAction func moreDetailVc(ges : ContributeDeleteGesture) {
        print("gesgesgetTitleLbl")
        print("ges.getTitleLbl",ges.getTitleLbl)
        print("ges.getInstituteName",ges.getInstituteName)
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
        self.mainVc.present(viewController, animated: true)
    }
    
    
    
    @IBAction func zoomVc(ges : getImgGesture) {
//        print("imgzomm")
        
        print("gesttgdveb",ges.img)
//        stringss.removeAll()
        
        print("stringssstringcontributeMediass",contributeMedia)
        print("alumniContributeMediaalumniContributeMedia",alumniContributeMedia)
        
        if memberType == 1 || memberType == 2 {
                    for i in contributeMedia{
                        
                        stringss.append(i.url)
                    }
                    
                }else{
                    for i in alumniContributeMedia{
                        
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
//        print("ges.getalumniType",ges.getalumniType)
//        print("ges.getInstType",ges.getInstType)

        
        print("stringssstringss",stringss)
        viewController.redirectType = ges.gesRedirctType
        
//        viewController.getEventInst = ges.alumniType
        viewController.stringss = stringss
//        viewController.contributeMedia = ges.contributeMedia
        viewController.contributeTitle = ges.contributeTitleLbl
//        print("ges.img",ges.img)
        self.mainVc.present(viewController, animated: true)
    }
    
    
    @IBAction func deleteClick(ges : ContributeDeleteGesture) {
//        print("ges.deleteId",ges.deleteId)
        
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
//            print("Handle Ok logic here")
//            print("tokenn",token)
//            print("ges.deleteId",ges.deleteId)
            
            let deleteModal = DeleteContributeModal()
            deleteModal.support_request_id = ges.deleteId
            
            
            var  deleteModalStr = deleteModal.toJSONString()
//            print("deleteModal",deleteModal.toJSON())
//            print("createEventModalStr",deleteModalStr)
//            print("token",token)
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
                    self.mainVc.present(alert, animated: true, completion: nil)
                }
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
        }))
        self.mainVc.present(refreshAlert, animated: true, completion: nil)

        //      main.present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if memberType == 1 || memberType == 2 {
            if contributeData.count == 1 {
                return CGSize(width: 420 / 2 + 190 , height: 680)
//            }else{
                
            }else{
                return CGSize(width: 420 / 2 + 100 , height: 680)
            }
        }else{
            
            if contributeAlumniData.count == 1 {
                return CGSize(width: 420 / 2 + 190 , height: 680)
//            }else{
                
            }else{
                return CGSize(width: 420 / 2 + 100 , height: 680)
            }
        }
      
        return CGSize(width:  420 / 2 + 100 , height: 680)

        
    }
    

}


class ContributeDeleteGesture : UITapGestureRecognizer {
    var deleteId : Int!
    var fromDate : String!
    var toDate : String!
    var desc : String!
    var title : String!
    var venue : String!
    var nameheading : String!
    var eventId : Int!
    
    var fundNeeded : Int!
    var fundReceived : Int!
    var noPending : Int!
    var requestId : Int!
    var instId : Int!
    var isAmountCheck : String!
    var getTitleLbl : String!
    var getInstituteName : String!
}
