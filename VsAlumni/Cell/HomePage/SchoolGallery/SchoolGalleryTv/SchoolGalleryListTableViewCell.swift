//
//  SchoolGalleryListTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 20/01/24.
//

import UIKit
import SDWebImage
import ObjectMapper


class SchoolGalleryListTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
 
    

    @IBOutlet weak var cv: UICollectionView!
    
    @IBOutlet weak var deleteView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    var getPhotos : [GetGalleryPhotos] = []

    var getphotoImage : [GalleryGetInstituteListData] = []
    let rowId = "GalleryAlumniSideListCollectionViewCell"
    var token : String!
    var memberType : Int!
    var main : UIViewController!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        cv.dataSource = self
        cv.delegate = self
        
      
        cv.register(UINib(nibName: rowId, bundle: nil), forCellWithReuseIdentifier: rowId)
//        imgView.layer.cornerRadius = 30
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowId, for: indexPath) as! GalleryAlumniSideListCollectionViewCell
        
        
        
        
        let instPhoto : GetGalleryPhotos = getPhotos[indexPath.row]
        
        let zoomGest1 = getImgGesture(target: self, action: #selector(zoomVc))

        zoomGest1.galleryTitleLbl = titleLbl.text

        zoomGest1.getCollectionId = instPhoto.id

        
        print("zoomGest1.galleryTitleLbl",zoomGest1.galleryTitleLbl)
        zoomGest1.gesRedirctType = "Gallery"
        
        zoomGest1.getPhotos = getPhotos
        cell.view1.addGestureRecognizer(zoomGest1)
        
        
        let zoomGest2 = getImgGesture(target: self, action: #selector(zoomVc))
//
        zoomGest2.getCollectionId = instPhoto.id

        zoomGest2.galleryTitleLbl = titleLbl.text

        zoomGest2.gesRedirctType = "Gallery"
        print("zoomGest2.galleryTitleLbl",zoomGest2.galleryTitleLbl)

        zoomGest2.getPhotos = getPhotos
        cell.view2.addGestureRecognizer(zoomGest2)
        
        let zoomGest3 = getImgGesture(target: self, action: #selector(zoomVc))
        zoomGest3.getCollectionId = instPhoto.id

        zoomGest3.gesRedirctType = "Gallery"
        zoomGest3.galleryTitleLbl = titleLbl.text
        print("zoomGest3.galleryTitleLbl",zoomGest3.galleryTitleLbl)

        zoomGest3.getPhotos = getPhotos
        cell.view3.addGestureRecognizer(zoomGest3)
        
        print("getPhotos.count",getPhotos.count)
        if getPhotos.count == 1 {
            print("getPhotos.1count")
            cell.img1.sd_setImage(with: URL(string:  getPhotos[0].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.countShowView.isHidden = true

            cell.img1.isHidden = false
            
            
            cell.view1Bottom.constant = 150

            cell.img1.layer.cornerRadius = 70
            cell.imgView.isHidden = true
            cell.img4.isHidden = true

            cell.img2.isHidden = true
        } else if getPhotos.count == 2 {
            print("getPhotos.2count")
            cell.img2.isHidden = false
            cell.imgView.isHidden = false
            cell.img2.layer.cornerRadius = 20

            cell.imgView.layer.cornerRadius = 70

           

            cell.view2Bottom.constant = 150
            cell.view3Bottom.constant  = 150

            cell.img2.sd_setImage(with: URL(string:  getPhotos[0].url!), placeholderImage: UIImage(named: "sample_black_screen"))
                cell.imgView.sd_setImage(with: URL(string:  getPhotos[1].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.img1.isHidden = true
            cell.countShowView.isHidden = true    
            cell.img4.isHidden = true

            cell.view1Height.constant = 0
            cell.view4Height.constant = 0

        }else if getPhotos.count == 3{
            print("getPhotos.3count")
            cell.imgView.sd_setImage(with: URL(string:  getPhotos[0].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.img1.sd_setImage(with: URL(string:  getPhotos[1].url!), placeholderImage: UIImage(named: "sample_black_screen"))
                cell.img2.sd_setImage(with: URL(string:  getPhotos[2].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.imgView.layer.cornerRadius = 70
            cell.img1.layer.cornerRadius = 20
            cell.img2.layer.cornerRadius = 50
            cell.countShowView.isHidden = true

            
            cell.view2Bottom.constant = -15
            cell.view3Bottom.constant  = 5
            cell.view1Bottom.constant  = 150

         
            cell.img1.isHidden = false
            cell.img4.isHidden = true

            cell.imgView.isHidden = false

            cell.img2.isHidden = false
            
        }else if getPhotos.count == 4 || getPhotos.count > 4 {
            print("getPhotos.3count")
            cell.imgView.sd_setImage(with: URL(string:  getPhotos[0].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.img1.sd_setImage(with: URL(string:  getPhotos[1].url!), placeholderImage: UIImage(named: "sample_black_screen"))
                cell.img2.sd_setImage(with: URL(string:  getPhotos[2].url!), placeholderImage: UIImage(named: "sample_black_screen"))
            
            cell.img4.sd_setImage(with: URL(string:  getPhotos[3].url!), placeholderImage: UIImage(named: "sample_black_screen"))
        
            cell.countShowView.isHidden = false
            var countList : Int!
            countList =  getPhotos.count - 4
            
            if countList == 0 {
                cell.countShowView.isHidden = true
                cell.countLbl.isHidden = true
            }else{
                cell.countShowView.isHidden = false
                cell.countLbl.isHidden = false
                cell.countLbl.text = String(countList)

            }
            
            cell.view2Bottom.constant = -15
            cell.view3Bottom.constant  = 5
            cell.view1Bottom.constant  = 150
            cell.view4Bottom.constant  = -85
          
            
            
            
            
            cell.imgView.layer.cornerRadius = 70
            cell.img1.layer.cornerRadius = 20
            cell.img2.layer.cornerRadius = 50
            cell.img4.layer.cornerRadius = 30


            cell.img1.isHidden = false
            cell.imgView.isHidden = false

            cell.img2.isHidden = false
            cell.img4.isHidden = false

        }
//
        
      
return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if getPhotos.count == 1 {
            return CGSize(width: 500, height: collectionView.frame.size.height)
            
        } else   if getPhotos.count == 2 {
            return CGSize(width: 500, height: collectionView.frame.size.height + 50)
        } else   if getPhotos.count == 3 {
            return CGSize(width: 500 , height: collectionView.frame.size.height + 30)
        }
        else   if getPhotos.count > 4 ||  getPhotos.count == 4{
            return CGSize(width: 500, height: collectionView.frame.size.height + 500)
        }else {
            return CGSize(width: 500, height: collectionView.frame.size.height + 300)
        }
        
    }
    @IBAction func zoomVc(ges : getImgGesture) {
        print("imgzomm")
        let storyboard = UIStoryboard(name: "ImageZoomStoryboard", bundle: nil)
               let viewController = storyboard.instantiateInitialViewController() as! ImageZoomViewController
        viewController.getImg = ges.img
        viewController.deleteHide  = 1

       
        
        viewController.redirectType = ges.gesRedirctType
        
        viewController.collecionId = ges.getCollectionId
        
        viewController.galleryTitle = ges.galleryTitleLbl
        viewController.getGalleryPhotos = ges.getPhotos
        print("ges.img",ges.img)
        self.main.present(viewController, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        var getId   : GetGalleryPhotos = getPhotos[indexPath.item]
        print("CollectiongetId",getId.id)

        
    }
    
  
}
