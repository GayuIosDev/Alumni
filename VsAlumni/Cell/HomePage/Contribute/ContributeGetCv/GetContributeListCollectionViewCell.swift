//
//  GetContributeListCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import UIKit

class GetContributeListCollectionViewCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var noMediaImg: UIImageView!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var img2View: UIViewX!
    @IBOutlet weak var insLbHeight: NSLayoutConstraint!
    
    @IBOutlet weak var viewDeleteHeight: NSLayoutConstraint!
    @IBOutlet weak var moreDetailView: UIViewX!
    
    
    @IBOutlet weak var alumniInstNameLbl: UILabel!
    
    @IBOutlet weak var img4View: UIView!
    
    @IBOutlet weak var img3View: UIView!
    
    @IBOutlet weak var img1View: UIView!
    
    
    @IBOutlet weak var viewDelete: UIView!
    
    @IBOutlet weak var imgLstVie: UIView!
    
    @IBOutlet weak var activeFromLbl: UILabel!
    
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var noRecordView: UIView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var activeToLbl: UILabel!
    
    @IBOutlet weak var contributeImgTvHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    
   
    
    let rowId = "ContributeBulletTableViewCell"
    
    
    
    @IBOutlet weak var noRexordImg: UIImageView!
    var bulletPoints : [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        img1.contentMode = .scaleAspectFill
        img1.clipsToBounds = true
        
        img2.contentMode = .scaleAspectFill
        img2.clipsToBounds = true
        
        img3.contentMode = .scaleAspectFill
        img3.clipsToBounds = true
        
        img4.contentMode = .scaleAspectFill
        img4.clipsToBounds = true
        
        
        img1.layer.cornerRadius = 20
        img2.layer.cornerRadius = 20
        img3.layer.cornerRadius = 20
        img4.layer.cornerRadius = 20
        
        
        img1.isHidden = true
        img2.isHidden = true
        img3.isHidden = true
        img4.isHidden = true
        
        
        
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        
//        img1.layer.borderColor = UIColor .red .cgColor

//        tv.isHidden = true
        moreDetailView.isHidden = true
        print("bulletPoints.count",bulletPoints.count)
//        if bulletPoints.count > 0 {
//            tv.isHidden = false
            tv.dataSource = self
            tv.delegate   = self
////           
////            
//        }else {
//            tv.isHidden = true
//        }

        imgLstVie.isHidden = true
        
        noRecordView.isHidden = true
        tv.register(UINib(nibName: rowId, bundle: nil), forCellReuseIdentifier: rowId)
        print("bulletPoints123",bulletPoints)
        // Initialization code
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("11bulletPoints.count",bulletPoints.count)

        return bulletPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! ContributeBulletTableViewCell
        cell.selectionStyle = .none
        cell.bulletPoint.text = bulletPoints[indexPath.row]
        cell.img.image = UIImage(named: "check-mark")
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}
