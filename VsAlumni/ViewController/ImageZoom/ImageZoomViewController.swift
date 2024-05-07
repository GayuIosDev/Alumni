//
//  ImageZoomViewController.swift
//  VsAlumni
//
//  Created by admin on 01/02/24.
//

import UIKit
import ObjectMapper
import SDWebImage


class ImageZoomViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var imgPrvLbl: UILabel!
    
    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var imgZoom: UIImageView!
    
    var pinch_gesture = UIPinchGestureRecognizer()
    var getImg : String!
    
    var getAlumniMedia : [getAlumniEventReferenceMedia] = []
    
    
    var deleteHide : Int = 0
    
    var redirectType : String!
    var getEventAlumni : Int!
    var getEventInst : Int!
    var getMediaInstitute : [getInstituteEventReferenceMedia] = []
    var contributeMedia : [GetContributeReferenceMedia] = []
    var alumniContributeMedia : [GetContributeAlumniReferenceMedia] = []

    var profileImg : String!
    var selectedImg : String!
    var getGalleryPhotos : [GetGalleryPhotos] = []
    var selectImg : UIImage!
    var collecionId : Int = 0
    var contributeTitle : String!
    var eventTitle : String!
    var galleryTitle : String!
    var photoArray = [UIImage]()
    let rowId = "ImgZoomCollectionViewCell"
    var token : String!
    var memberType : Int!
    var stringss : [String] = []
    var deleteIDForGallary : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("redirectType",redirectType)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
            let cancelGesture = UITapGestureRecognizer(target: self, action: #selector(cancelVc))
            backView.addGestureRecognizer(cancelGesture)
//        }
//        print("getEventAlumni",getEventAlumni)
//        print("getEventInst",getEventInst)
//        print("collecionId",collecionId)
//        
        cv.dataSource = self
        cv.delegate = self
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        
      
        
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        
      
        
        
//        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
//        print("TokenExp",TokenExp)
//        if TokenExp == "401" {
//            var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)
//            
//            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
//                print("Handle Ok logic here")
//                print("tokenn",token)
//                
//                
//                UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
//                
//                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
//                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
//                self.present(viewController, animated: true)
//                
//                
//            }))
//            
//            
//            
//            present(refreshAlert, animated: true, completion: nil)
//            
//        }
//        
        
     
        if deleteHide == 1 {
            deleteView.isHidden = false
        }else{
            deleteView.isHidden = true
            
        }
        
        cv.register(UINib(nibName: rowId, bundle: nil), forCellWithReuseIdentifier: rowId)
        
        
        
        
    }
    
    @IBAction func cancelVc(){
        
        print("back")
        
        dismiss(animated: true)
    }
    
    @IBAction func zoom_img( _ sender : UIPinchGestureRecognizer){
            print("img gesture")
      
        
        print("img gesture")
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
        
          }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("getEventAlumninumberOfItemsInSection",getEventAlumni)
        print("getEventInstnumberOfItemsInSection",getEventInst)
        if redirectType == "Alumni"  {
            print("stringss.stringss",stringss.count)
            return stringss.count
        }else if redirectType == "Contribute" {
            
            print("contributeMediacontributeMedia",stringss)
            
          
            
            if memberType == 1 || memberType == 2 {
                //        getEventInstituteList()
                //            getContributrList()
                return stringss.count
                //                  contributeView.isHidden = false
            }else{
                return stringss.count
                //                  getContributrList()
                //                  getEventAlumniList()
            }
            
          
        } else if redirectType == "Profile" {
            return 1
        }  else if redirectType == "Gallery" {
            return stringss.count
        }else if redirectType == "Selected Images"{
            print(" return photoArray.count", photoArray.count)
            return photoArray.count
        }    else if redirectType == "chat"{
            return 1
        }
        else  {
            print("stringss.countstringss.countstringss.countstringss.countstringss.count",stringss.count)
            
            return stringss.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId , for: indexPath) as! ImgZoomCollectionViewCell
        print("getEventAlumniCell",getEventAlumni)
        print("getEventInstCell",getEventInst)
        
        cell.img.isUserInteractionEnabled = true
        
        if redirectType == "Alumni" {
            let getMedia  = stringss[indexPath.row]
            print("getMedia.url",getMedia)
            
            let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
            cell.img.addGestureRecognizer(pinch_gesture)
            
            
            
            
            
//            let zoomableImageView = ZoomableImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//            view.addSubview(zoomableImageView)
//            
//            // Load an image
//            if let image = UIImage(named: getMedia.url) {
//                zoomableImageView.setImage(image)
//            }
            
            
            
            imgPrvLbl.text = eventTitle
            
            
            let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 1200), scaleMode: .aspectFit)
            
            cell.img.sd_setImage(with: URL(string: getMedia),  placeholderImage: nil, context: [.imageTransformer: transformer])
            cell.img.isUserInteractionEnabled = true
            
        }  else if redirectType == "Contribute" {
            
            
            
            if memberType == 1 || memberType == 2 {
                let getMedia = stringss[indexPath.row]
                print("getMedia.url",stringss)
                
                let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                    cell.img.addGestureRecognizer(pinch_gesture)
                
                
                
                
    //            let zoomableImageView = ZoomableImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    //            view.addSubview(zoomableImageView)
                
                // Load an image
    //            if let image = UIImage(named: getMedia.url) {
    //                zoomableImageView.setImage(image)
    //            }
                
                imgPrvLbl.text = contributeTitle
                
                //
                
                let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 900), scaleMode: .aspectFit)
                
                //
                cell.img.sd_setImage(with: URL(string: getMedia),  placeholderImage: nil, context: [.imageTransformer: transformer])
                cell.img.isUserInteractionEnabled = true
                
            }else{
                let getMedia = stringss[indexPath.row]
                print("getMedia.url",getMedia)
                
                let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                    cell.img.addGestureRecognizer(pinch_gesture)
                
                
                
                
    //            let zoomableImageView = ZoomableImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    //            view.addSubview(zoomableImageView)
                
                // Load an image
    //            if let image = UIImage(named: getMedia.url) {
    //                zoomableImageView.setImage(image)
    //            }
                
                imgPrvLbl.text = contributeTitle
                
                //
                
                let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 900), scaleMode: .aspectFit)
                
                //
                cell.img.sd_setImage(with: URL(string: getMedia),  placeholderImage: nil, context: [.imageTransformer: transformer])
                cell.img.isUserInteractionEnabled = true
                
            }
            
            
           
        }  else if redirectType == "Gallery" {
            
            if memberType == 1 || memberType == 2{
                
                
                deleteView.isHidden = false
            }
            else{
                
                deleteView.isHidden = true
            }
            
            let getMedia  = stringss[indexPath.row]
//            print("getMedia.url",getMedia.url)
            let getDelete  = deleteIDForGallary[indexPath.row]
            
            let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                cell.img.addGestureRecognizer(pinch_gesture)
            imgPrvLbl.text = galleryTitle
            
            
            let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 700), scaleMode: .aspectFit)
            
            print("getMediaGallery",getMedia)
            cell.img.sd_setImage(with: URL(string: getMedia),  placeholderImage: nil, context: [.imageTransformer: transformer])
            //
            let deleteGesture = GalleryDeleteGes(target: self, action: #selector(deleteVc))
            deleteGesture.colleId = getDelete
            deleteGesture.DeleteId = getDelete
            deleteGesture.imgUrl = getMedia
            print("getMedia.id",getDelete)
            deleteView.addGestureRecognizer(deleteGesture)
            
            cell.img.isUserInteractionEnabled = true
        } else if redirectType == "Profile"{
            
            let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                cell.img.addGestureRecognizer(pinch_gesture)
            imgPrvLbl.text = "Profile"
            
            let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 500), scaleMode: .aspectFit)
            
            cell.img.sd_setImage(with: URL(string: profileImg),  placeholderImage: nil, context: [.imageTransformer: transformer])
            cell.img.isUserInteractionEnabled = true
            
        }else if redirectType == "Selected Images"{
            
            
            print("imageeeeeeeee")
            let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                cell.img.addGestureRecognizer(pinch_gesture)
            imgPrvLbl.text = "Selected Images"
            
//            let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 700), scaleMode: .aspectFit)
            print("selectImg",selectImg)
            cell.img.image = photoArray[indexPath.row]
            
            
//
          
            
            
            
//
            
            
            cell.img.isUserInteractionEnabled = true
        }
        
        else if redirectType == "chat"{
            
            let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                cell.img.addGestureRecognizer(pinch_gesture)
            imgPrvLbl.text = "Selected Images"
            
            let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 700), scaleMode: .aspectFit)
            print("selectImg",profileImg)
//            cell.img.image =  UIImage(named: profileImg)
            cell.img.sd_setImage(with: URL(string:  profileImg),  placeholderImage: nil, context: [.imageTransformer: transformer])
            cell.img.isUserInteractionEnabled = true
        }
        
        else{
            if redirectType == "Institute"{
                let getMedia = stringss[indexPath.row]
                print("123456",getMedia)
                let pinch_gesture = UIPinchGestureRecognizer(target: self, action: #selector(zoom_img))
                    cell.img.addGestureRecognizer(pinch_gesture)
                imgPrvLbl.text = eventTitle
                
                let transformer = SDImageResizingTransformer(size: CGSize(width: 400, height: 500), scaleMode: .aspectFit)
                cell.img.sd_setImage(with: URL(string: getMedia),  placeholderImage: nil, context: [.imageTransformer: transformer])
                
                cell.img.isUserInteractionEnabled = true
                
            }
        }
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height )
    }
    
    
    
    @IBAction func deleteVc(ges : GalleryDeleteGes) {
        
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this image?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
            print("tokenn",token)
            print("getcollecionId",collecionId)
            
            
            let deleteModal = DeleteImageGalleryModal()
            deleteModal.image_id = ges.colleId
            
            var deleteModalStr = deleteModal.toJSONString()
            print("deleteModal",deleteModal.toJSON())
            DeleteImageGalleryRequest.call_request(param: deleteModalStr!, token: token) {
                
                [self] (res) in
                
                let deleteRes : DeleteImageGalleryResponse = Mapper<DeleteImageGalleryResponse>().map(JSONString: res)!
                
                
                if deleteRes.status == true {
                    
                    
                    
                    if let index = stringss.firstIndex(of: ges.imgUrl) {
                                                                stringss.remove(at: index)
                                        
                                        
                                                            }
                    //
                                        
                                        
                                        
                                        
                                        if let indexs = deleteIDForGallary.firstIndex(of: ges.DeleteId){
                                            
                                            deleteIDForGallary.remove(at: indexs)
                                            
                                        
                                        }
                                        
                                        redirectType = "Gallery"
                                        
                                        cv.delegate = self
                                        cv.dataSource = self
                                        cv.reloadData()
                    
                    
                    
                }else{
                    //
                   
                }
                
                
                
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
}



class GalleryDeleteGes : UITapGestureRecognizer {
    var colleId : Int!
    var DeleteId : Int!
    var imgUrl : String!
}
