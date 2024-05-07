//
//  HomePageSchoolGalleryCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//
 
import UIKit
import ObjectMapper
import DropDown


class HomePageSchoolGalleryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var countView: UIViewX!
    
    
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    @IBOutlet weak var img1height: NSLayoutConstraint!
    
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var deleteView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var Image2TopConstains: NSLayoutConstraint!
    @IBOutlet weak var img3TopConstains: NSLayoutConstraint!
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var tv: UITableView!
    
    var token : String!
    var memberType : Int!
    
    var alumniArrId : [Int] = []
    var instituteId : Int! = 0
    var dropDownInstiId  : Int!
    
    var main : UIViewController!
    
    
    let rowId = "GetPhotosTvTableViewCell"
    var instGalleryData : [GalleryGetInstituteListData] = []
    var getPhotos : [GetGalleryPhotos] = []
    
    var drop_down = DropDown()
    var alumniArr : [String] = []
    var AlumniGalleryData : [GalleryGetAlumniInstituteData] = []
    //    var getPhotosAlumni : [GetGalleryPhotos] = []
    var ImageUrls : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
     print("HomePageSchoolGalleryCollectionViewCell")
        
    }
    
    
    
    
    
    
    

}

