//
//  ImageChangeImageViewController.swift
//  VsAlumni
//
//  Created by admin on 14/02/24.
//

import UIKit

class ImageChangeImageViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var collectionImgView: UIView!
    
    
    @IBOutlet weak var imgViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var cvHeight: NSLayoutConstraint!
    
    @IBOutlet weak var specificImgShowView: UIView!
    @IBOutlet weak var mulImgHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var alertTitileLbl: UILabel!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var alertShowingView: UIViewX!
    
    @IBOutlet weak var overAllVmgShowView: UIView!
    
    @IBOutlet weak var alertImg: UIImageView!
    @IBOutlet weak var alertOkView: UIView!
    
    
    @IBOutlet weak var overAllViewHeight: NSLayoutConstraint!
    
  
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []

    var photoArray = [UIImage]()
    
    var gifImage : String!
    var EventRedirect : String!
    var alertShowType : Int! = 0
    var messageResponse : String!
    var editType : Int! = 0

    
    var menuType : String!
    
    var call_back: (([String]) -> Void)?

//        var graph_type: String!
    
    var getSelectedImg : [String] = []
    var rowId = "ImageChangeCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cvHeightgetSelectedImg",getSelectedImg.count)
      
        
        
//        if getSelectedImg.count > 2 {
//            cvHeight.constant = CGFloat(getSelectedImg.count * 95)
//            viewHeight.constant = CGFloat(getSelectedImg.count * 110)
//            print("getSelectedImg1111",getSelectedImg)
//        
//        }else{
            
            cvHeight.constant = CGFloat(getSelectedImg.count * 65)
            viewHeight.constant = CGFloat(getSelectedImg.count * 80)
//        }
        print("viewHeightconstant",viewHeight.constant)
        print("OnlycvHeightconstant",cvHeight.constant)
        cv.dataSource  = self
        cv.delegate = self
        cv.register(UINib(nibName: rowId, bundle: nil), forCellWithReuseIdentifier: rowId)
      
      
        
        print("EventRedirect",EventRedirect)
        print("alertShowType",alertShowType)
        print("editType",editType)
        let defaults =  UserDefaults.standard
        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
        print("TokenExp",TokenExp)
        if TokenExp == "401" {
            var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                print("Handle Ok logic here")
               
                
                UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
                
                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                self.present(viewController, animated: true)
                
            
                                                 }))
            
            
            
            present(refreshAlert, animated: true, completion: nil)
            
          
        }
        specificImgShowView.isHidden = true
        overAllVmgShowView.isHidden = true
        alertShowingView.isHidden = true
        overAllViewHeight.constant = 0
        if alertShowType == 1 {
            
            alertShowingView.isHidden = false
            overAllVmgShowView.isHidden = true
            specificImgShowView.isHidden = true
            alertTitileLbl.text = messageResponse
            cvHeight.constant = 0
            viewHeight.constant = 0
            
            collectionImgView.isHidden = true
            cv.isHidden = true
          
//            self.alertImg.image = UIImage(named: gifImage)
            
            
            let gifURL = UIImage.gif(name: gifImage)
                      // Use SDWebImage to load and display the GIF image
            alertImg.image = gifURL
//            (name: gifImage)
            img1.isHidden =  true
            img2.isHidden =  true
            img3.isHidden =  true
            img4.isHidden =  true
            
            
      
        }else{
//            
//            collectionImgView.isHidden = true
//            cv.isHidden = true
            alertShowingView.isHidden = true
            overAllVmgShowView.isHidden = false
            specificImgShowView.isHidden = true

            img1.isHidden =  true
            img2.isHidden =  true
            img3.isHidden =  true
            img4.isHidden =  true
            
            img1.layer.cornerRadius = 20
            img2.layer.cornerRadius = 20
            
            img3.layer.cornerRadius = 20
            img4.layer.cornerRadius = 20
            
        }
      
        
//        if editType == 1 {
//            if getMediaInstitute.count == 1 {
//                self.img1.sd_setImage(with: URL(string:  getMediaInstitute[0].url!), placeholderImage: UIImage(named: "image 2"))
//                
//                //                img1.image = getMediaInstitute[0].url
//                mulImgHeight.constant = 80
//                overAllViewHeight.constant = 260
//                //            var imgUrl = photoArray[0]
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                img1.isHidden =  false
//                img2.isHidden =  true
//                img3.isHidden =  true
//                img4.isHidden =  true
//            }else if getMediaInstitute.count == 2 {
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                
//                //                img1.image = getMediaInstitute[0].url
//                //                img2.image = getMediaInstitute[1].url
//                //
//                
//                self.img1.sd_setImage(with: URL(string:  getMediaInstitute[0].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img2.sd_setImage(with: URL(string:  getMediaInstitute[1].url!), placeholderImage: UIImage(named: "image 2"))
//                
//                mulImgHeight.constant = 150
//                overAllViewHeight.constant = 260
//                
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  true
//                img4.isHidden =  true
//            }else if getMediaInstitute.count == 3 {
//                //                img1.image = photoArray[0]
//                //                img2.image = photoArray[1]
//                //                img3.image = photoArray[2]
//                //
//                
//                
//                
//                self.img1.sd_setImage(with: URL(string:  getMediaInstitute[0].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img2.sd_setImage(with: URL(string:  getMediaInstitute[1].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img3.sd_setImage(with: URL(string:  getMediaInstitute[2].url!), placeholderImage: UIImage(named: "image 2"))
//                
//                
//                mulImgHeight.constant = 240
//                overAllViewHeight.constant = 420
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest3.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest3.gesRedirctType = "Selected Images"
//                zoomGest3.eventTitleLbl = "Selected Images"
//                img3.isUserInteractionEnabled = true
//                
//                img3.addGestureRecognizer(zoomGest3)
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  false
//                img4.isHidden =  true
//            }else if getMediaInstitute.count == 4 {
//                mulImgHeight.constant = 310
//                overAllViewHeight.constant = 420
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest3.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest3.gesRedirctType = "Selected Images"
//                zoomGest3.eventTitleLbl = "Selected Images"
//                img3.isUserInteractionEnabled = true
//                
//                img3.addGestureRecognizer(zoomGest3)
//                
//                let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest4.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest4.gesRedirctType = "Selected Images"
//                zoomGest4.eventTitleLbl = "Selected Images"
//                img4.isUserInteractionEnabled = true
//                
//                img4.addGestureRecognizer(zoomGest4)
//                
//                //                img1.image = photoArray[0]
//                //                img2.image = photoArray[1]
//                //                img3.image = photoArray[2]
//                //                img4.image =  photoArray[3]
//                //
//                
//                
//                
//                self.img1.sd_setImage(with: URL(string:  getMediaInstitute[0].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img2.sd_setImage(with: URL(string:  getMediaInstitute[1].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img3.sd_setImage(with: URL(string:  getMediaInstitute[2].url!), placeholderImage: UIImage(named: "image 2"))
//                self.img4.sd_setImage(with: URL(string:  getMediaInstitute[3].url!), placeholderImage: UIImage(named: "image 2"))
//                
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  false
//                
//                img4.isHidden =  false
//            }
//        }else {
            
            
            
            
            
            
            
//            if photoArray.count == 1 {
//                img1.image = photoArray[0]
//                mulImgHeight.constant = 80
//                overAllViewHeight.constant = 260
//                //            var imgUrl = photoArray[0]
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                img1.isHidden =  false
//                img2.isHidden =  true
//                img3.isHidden =  true
//                img4.isHidden =  true
//            }else if photoArray.count == 2 {
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                
//                img1.image = photoArray[0]
//                img2.image = photoArray[1]
//                mulImgHeight.constant = 150
//                overAllViewHeight.constant = 260
//                
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  true
//                img4.isHidden =  true
//            }else if photoArray.count == 3 {
//                img1.image = photoArray[0]
//                img2.image = photoArray[1]
//                img3.image = photoArray[2]
//                mulImgHeight.constant = 240
//                overAllViewHeight.constant = 420
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest3.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest3.gesRedirctType = "Selected Images"
//                zoomGest3.eventTitleLbl = "Selected Images"
//                img3.isUserInteractionEnabled = true
//                
//                img3.addGestureRecognizer(zoomGest3)
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  false
//                img4.isHidden =  true
//            }else if photoArray.count == 4 {
//                mulImgHeight.constant = 310
//                overAllViewHeight.constant = 420
//                
//                let zoomGest = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest.gesRedirctType = "Selected Images"
//                zoomGest.eventTitleLbl = "Selected Images"
//                img1.isUserInteractionEnabled = true
//                
//                img1.addGestureRecognizer(zoomGest)
//                let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest2.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest2.gesRedirctType = "Selected Images"
//                zoomGest2.eventTitleLbl = "Selected Images"
//                img2.isUserInteractionEnabled = true
//                
//                img2.addGestureRecognizer(zoomGest2)
//                
//                
//                let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest3.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest3.gesRedirctType = "Selected Images"
//                zoomGest3.eventTitleLbl = "Selected Images"
//                img3.isUserInteractionEnabled = true
//                
//                img3.addGestureRecognizer(zoomGest3)
//                
//                let zoomGest4 = getImgGesture(target: self, action: #selector(zoomVc))
//                zoomGest4.photoArray = photoArray
//                //            zoomGest.getalumniType = 1
//                zoomGest4.gesRedirctType = "Selected Images"
//                zoomGest4.eventTitleLbl = "Selected Images"
//                img4.isUserInteractionEnabled = true
//                
//                img4.addGestureRecognizer(zoomGest4)
//                
//                img1.image = photoArray[0]
//                img2.image = photoArray[1]
//                img3.image = photoArray[2]
//                img4.image =  photoArray[3]
//                
//                img1.isHidden =  false
//                img2.isHidden =  false
//                img3.isHidden =  false
//                
//                img4.isHidden =  false
//            }
//            
//        }
//            
            
            
            
            
        let okGest = UITapGestureRecognizer(target: self, action: #selector(okClick))
        alertOkView.addGestureRecognizer(okGest)
        
        
        
        
    }
    

   
    @IBAction func dismissVc(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
    
    
    
    @IBAction func okClick () {
        
        print("EventRedirect",EventRedirect)
        
        if EventRedirect == "EVENTS" {
            
            let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                  let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                  self.present(viewController, animated: true)
        } else if EventRedirect == "CHANGE DETAILS" {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

        }
        
        else{
        
            
            print("EventRedirect211",EventRedirect)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        //        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
        //        let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
        //        self.present(viewController, animated: true)
            }
        
    }
    
    
    @IBAction func zoomVc(ges : getImgGesture) {
        print("imgzomm")
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
               let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
//        viewController.getImg = ges.img
//        viewController.selectImg = ges.selectedImgs
        
        print("ges.gesRedirctTypeges.gesRedirctType",ges.gesRedirctType)
        viewController.photoArray = photoArray
        viewController.redirectType = ges.gesRedirctType
        viewController.eventTitle = ges.eventTitleLbl
        print("ges.getalumniType",ges.getalumniType)
        print("ges.getInstType",ges.getInstType)


        viewController.getMediaInstitute = ges.zoomInstituteMedia

        viewController.getAlumniMedia = ges.zoomAlumniMedia
        print("ges.img",ges.img)
        present(viewController, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("photoArray1234567.count",getSelectedImg.count)
        if EventRedirect == "EVENTS" {
            return   Constant.DefaultsKeys.getSelectedImg.count
        }else{
            return   Constant.DefaultsKeys.galleryGetSelectedImg.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId, for: indexPath) as! ImageChangeCollectionViewCell
        
        call_back?(getSelectedImg)
       
        if EventRedirect == "EVENTS" {
            
            imgViewTop.constant = 100
            
//            if getSelectedImg.count > 2 {
//                cvHeight.constant = CGFloat(getSelectedImg.count * 115)
//                viewHeight.constant = CGFloat(getSelectedImg.count * 110)
//                print("getSelectedImg23456789",getSelectedImg)
//            
//            }else {
            
            cvHeight.constant = CGFloat(getSelectedImg.count * 65)
            viewHeight.constant = CGFloat(getSelectedImg.count * 80)
            print("getSelectedImg1111",getSelectedImg)
//        }
            //        cal
            
            //        var getImg : String = getSelectedImg[indexPath.row] as! String
            //        cell.img.image = UIImage(named: "file:///Users/admin/Library/Developer/CoreSimulator/Devices/7E5E3C47-06D2-47AF-A910-829CFBAED135/data/Containers/Data/Application/1CF21619-00F2-42C3-BA9A-A8ABEC05CDE3/tmp/IMG_0001.JPG")
            
            
            cell.img.sd_setImage(with: URL(string: Constant.DefaultsKeys.getSelectedImg[indexPath.row] ), placeholderImage: UIImage(named: "image 2"))
            
            
        }else{
            
            imgViewTop.constant = 100
//            if getSelectedImg.count < 2 {
//                cvHeight.constant = CGFloat(getSelectedImg.count * 75)
//                viewHeight.constant = CGFloat(getSelectedImg.count * 90)
//                print("getSelectedImg1111",getSelectedImg)
//            
//            }else {
            
            if getSelectedImg.count == 1 {
                
                cvHeight.constant = CGFloat(getSelectedImg.count * 130)
                viewHeight.constant = CGFloat(getSelectedImg.count * 105)
                
            }else{
                
                cvHeight.constant = CGFloat(getSelectedImg.count * 65)
                viewHeight.constant = CGFloat(getSelectedImg.count * 80)
                
            }
             
//            }
            cell.img.sd_setImage(with: URL(string: Constant.DefaultsKeys.galleryGetSelectedImg[indexPath.row] ), placeholderImage: UIImage(named: "image 2"))
        }
        let deleteGes = CollectionGesture(target: self, action: #selector(deletedImg))
        deleteGes.deleteId = indexPath.row
        print("indexPath.row",indexPath.row)
        cell.deleteView.addGestureRecognizer(deleteGes)
        
        
        return cell
    }
    
    
    @IBAction func deletedImg(ges: CollectionGesture) {
        print("ges.deleteId",ges.deleteId)
       
            
        print("beforegetSelectedImg",getSelectedImg)
        getSelectedImg.remove(at: ges.deleteId)
        if EventRedirect == "EVENTS" {
            Constant.DefaultsKeys.getSelectedImg = getSelectedImg
        }else{
            Constant.DefaultsKeys.galleryGetSelectedImg = getSelectedImg
        }
        cv.dataSource = self
        cv.delegate = self
        cv.reloadData()
        print("aftergetSelectedImg",getSelectedImg)
        
//        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionView.frame.width",collectionView.frame.width)
        print("collectionView.frame.width/2",collectionView.frame.width / 2)
        print("collectionView.frame.height",collectionView.frame.height)
        return CGSize(width: 155, height: 100)
    }
    
    
    
    
    @IBAction func closeAction(_ sender: UIButton) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
}



class CollectionGesture : UITapGestureRecognizer {
    var deleteId : Int!
}
