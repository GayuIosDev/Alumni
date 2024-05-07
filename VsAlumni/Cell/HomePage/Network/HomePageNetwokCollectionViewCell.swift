//
//  HomePageNetwokCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper



class HomePageNetwokCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var noRecordsView: UIView!
    
    @IBOutlet weak var specficSearchView: UIView!
    
    @IBOutlet weak var noRecordsLbl: UILabel!
    
    @IBOutlet weak var viewCancel: UIView!
    
    @IBOutlet weak var searchBarVieww: UIView!
    
    @IBOutlet weak var professionLbl: UILabel!
    @IBOutlet weak var passedYrLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameView: UIViewX!
    
    
    @IBOutlet weak var professionView: UIViewX!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var passedYearView: UIViewX!
    
    
    @IBOutlet weak var filterViewHeight: NSLayoutConstraint!
    @IBOutlet weak var filterView: UIView!
    
    
    @IBOutlet weak var filterImgView: UIView!
    
    
    @IBOutlet weak var search_bar: UISearchBar!
    
    
    @IBOutlet weak var tv: UITableView!
    
    let rowIdentifier = "NetworkListTableViewCell"
    
    
    @IBOutlet weak var searchViewHeight: NSLayoutConstraint!
    
    var getAlumniData : [NetworkAlumniData] = []
    var getInstituteData : [NetworkInstituteData] = []
    var clone_list : [NetworkInstituteData] = []
    var alumni_clone_list : [NetworkAlumniData] = []
    
    var main : UIViewController!
    var token : String!
    var memberType : Int!
    
    var searchType : String! = "Name"
    
    var filterdTerms = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        print("HomePageNetwokCollectionViewCell11")
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        
        
        
       
        var TokenExp =   defaults.string(forKey: Constant.DefaultsKeys.tokenStatusCode)
        print("TokenExp",TokenExp)
        if TokenExp == "401" {
            var refreshAlert = UIAlertController(title: "Alert", message: "Token Expired", preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
                print("Handle Ok logic here")
                print("tokenn",token)
                print("token",token)
                
                
                UserDefaults.standard.removeObject(forKey: Constant.DefaultsKeys.token)
                
                let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
                self.main.present(viewController, animated: true)
                
            
                                                 }))
            
            
            
            main.present(refreshAlert, animated: true, completion: nil)
            
        }
        
        filterViewHeight.constant = 0
        searchViewHeight.constant = 0

        
        filterView.isHidden = true
        searchBarVieww.isHidden = true
        
        print("memberType",memberType)
//        if memberType == 1 ||  memberType == 2 {
//            getNetworkInstituteList()
//        }else {
//            getNetworkAlumniList()
//        }
        
        
        tv.dataSource = self
        tv.delegate = self
        
//        search_bar.isHidden = true
        searchTextField.delegate = self
//        
        noRecordsView.isHidden = true
//        noRecordsLbl.isHidden = true
        let filterGes = UITapGestureRecognizer(target: self, action: #selector(filterVc))
        filterImgView.addGestureRecognizer(filterGes)
        
        
        let specficSearcGes = UITapGestureRecognizer(target: self, action: #selector(searchFilter))
        
        specficSearchView.addGestureRecognizer(specficSearcGes)
        
        
        tv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)
        
        
        
        
        let nameGesture  = UITapGestureRecognizer(target: self, action: #selector(nameClick))
        nameView.addGestureRecognizer(nameGesture)
        
        let passedyrGesture  = UITapGestureRecognizer(target: self, action: #selector(passedYrClick))
        passedYearView.addGestureRecognizer(passedyrGesture)
        
        let professionGesture  = UITapGestureRecognizer(target: self, action: #selector(professionClick))
        professionView.addGestureRecognizer(professionGesture)
        
        
        viewCancel.isHidden = false
        
        let searchCancelGest = UITapGestureRecognizer(target: self, action: #selector(searchClearList))
        viewCancel.addGestureRecognizer(searchCancelGest)
    }
    
    @IBAction func ProfileIamgeVc(ges : ProfileImageVc){
            
        print("profileclick")
            
            let vc = ShowProfilVcViewController(nibName: nil, bundle: nil)
            vc.NameLabel = ges.TitleLbl
            vc.imageUrls = ges.ImageUrl
            vc.modalPresentationStyle = .formSheet
            main.present(vc, animated: true)
            
            
        }
    
    
    @IBAction func searchClearList() {
        if memberType == 1 || memberType == 2 {
            getNetworkInstituteList()
            
            searchTextField.text = ""
            noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true

            gifImage.isHidden = true
            self.tv.reloadData()
        }else{
            getNetworkAlumniList()
//            search_bar.resignFirstResponder()
            searchTextField.text = ""
            noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true

            gifImage.isHidden = true
            self.tv.reloadData()
        }
    }
    
    @IBAction func searchFilter() {
        SpecificSearch(searchText: searchTextField.text!)
    }
    
    
    
    @IBAction func nameClick() {
        nameView.backgroundColor = .black
        nameLbl.textColor = .white
        
        
        searchType = "Name"
        passedYearView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        professionView.backgroundColor = .white
        professionLbl.textColor = .black
        
        if memberType == 1 ||  memberType == 2 {
            getNetworkInstituteList()
        }else {
            getNetworkAlumniList()
        }
    }
    
    
   
    @IBAction func passedYrClick() {
        passedYearView.backgroundColor = .black
        passedYrLbl.textColor = .white
        
        nameView.backgroundColor = .white
        nameLbl.textColor = .black
        searchType = "Batch"
        professionView.backgroundColor = .white
        professionLbl.textColor = .black
        if memberType == 1 ||  memberType == 2 {
            getNetworkInstituteList()
        }else {
            getNetworkAlumniList()
        }
        
    }
    
    @IBAction func professionClick() {
        professionView.backgroundColor = .black
        professionLbl.textColor = .white
        searchType = "Designation"
        passedYearView.backgroundColor = .white
        passedYrLbl.textColor = .black
        
        nameView.backgroundColor = .white
        nameLbl.textColor = .black
        if memberType == 1 ||  memberType == 2 {
            getNetworkInstituteList()
        }else {
            getNetworkAlumniList()
        }
        
    }
    
    
    @IBAction func filterVc() {
        filterViewHeight.constant = 50
        searchViewHeight.constant = 50
//        search_bar.isHidden = false
        filterView.isHidden = false
        searchBarVieww.isHidden = false
print("working")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if memberType == 1 || memberType == 2 {
            return  getInstituteData.count
        }else{
            
            return getAlumniData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! NetworkListTableViewCell
        
        if memberType == 1 || memberType == 2 {
            
            let getInstitute : NetworkInstituteData = getInstituteData [indexPath.row]
            cell.nameLbl.text = getInstitute.name
            cell.designationLbl.text = getInstitute.designation
            cell.batchLbl.text = getInstitute.batch
            cell.profileImg.sd_setImage(with: URL(string:  getInstitute.profilePicture!), placeholderImage: UIImage(named: "Avatar"))
//            cell.profileImg.applyRoundedCorners(cornerRadii: CGSize(width: 20, height: 20))
            
            
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.profileImg.frame
            rectShape.position = cell.profileImg.center
            rectShape.path = UIBezierPath(roundedRect: cell.profileImg.bounds, byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: 15, height: 25)).cgPath

            cell.profileImg.layer.backgroundColor = UIColor.green.cgColor
            //Here I'm masking the textView's layer with rectShape layer
            cell.profileImg.layer.mask = rectShape
            
            
            print("imageIntract2222",cell.profileImg.isUserInteractionEnabled)
            
            let imagClick = ProfileImageVc(target: self, action:#selector(ProfileIamgeVc))
                        imagClick.ImageUrl = getInstitute.profilePicture
                        imagClick.TitleLbl = getInstitute.name
                        cell.profileImg.addGestureRecognizer(imagClick)
        }else{
            
            let getAlumni : NetworkAlumniData = getAlumniData [indexPath.row]
            cell.nameLbl.text = getAlumni.name
            cell.designationLbl.text = getAlumni.designation
            cell.batchLbl.text = getAlumni.batch
            cell.profileImg.sd_setImage(with: URL(string:  getAlumni.profilePicture!), placeholderImage: UIImage(named: "Avatar"))
//            cell.profileImg.applyRoundedCorners(cornerRadii: CGSize(width: 20, height: 20))

            
            
            
            let rectShape = CAShapeLayer()
            rectShape.bounds = cell.profileImg.frame
            rectShape.position = cell.profileImg.center
            rectShape.path = UIBezierPath(roundedRect: cell.profileImg.bounds, byRoundingCorners: [.bottomLeft  , .topLeft], cornerRadii: CGSize(width: 15, height: 25)).cgPath

            cell.profileImg.layer.backgroundColor = UIColor.green.cgColor
            //Here I'm masking the textView's layer with rectShape layer
            cell.profileImg.layer.mask = rectShape
            
            print("imageIntract",cell.profileImg.isUserInteractionEnabled)
            
            let imagClick = ProfileImageVc(target: self, action:#selector(ProfileIamgeVc))
                        imagClick.ImageUrl = getAlumni.profilePicture
                        imagClick.TitleLbl = getAlumni.name
                        cell.profileImg.addGestureRecognizer(imagClick)
        }
        
      
        
        return cell
    }
    
    
    func applyRoundedCorners(cornerRadii: CGSize) {
          let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: cornerRadii)
          let maskLayer = CAShapeLayer()
          maskLayer.path = path.cgPath
          self.layer.mask = maskLayer
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
 
    
     func SpecificSearch(searchText: String) {
 
        if memberType == 1 || memberType == 2 {
            
            
            let filtered_list : [NetworkInstituteData] = Mapper<NetworkInstituteData>().mapArray(JSONString: clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                print("searchType",searchType)
                if searchType == "Name" {
                    getInstituteData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased())}
                    }else if searchType == "Batch" {
                        getInstituteData = filtered_list.filter { $0.batch.lowercased().contains(searchText.lowercased())}
                        
                    }else if searchType == "Designation" {
                        
                    
                        getInstituteData = filtered_list.filter {  $0.designation.lowercased().contains(searchText.lowercased())}
                }
                
                
                
            }else{
                getInstituteData = filtered_list
                print("getInstituteData")
            }
            
            if getInstituteData.count > 0{
                noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true

                gifImage.isHidden = true

                print ("searchListPendigCount",getInstituteData.count)
                //                viewEmpty.alpha = 0
                //                emptyLbl.alpha = 0
            }else{
                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
                gifImage.isHidden = false
//                noRecordsLbl.text = "No Records"
//                self.gifImage.image = UIImage.gif(name: "no_data_found")
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL


                //                viewEmpty.alpha = 1
                //                emptyLbl.alpha = 1
            }
            
            
            
            tv.reloadData()
            //
            
        }else{
            let filtered_list : [NetworkAlumniData] = Mapper<NetworkAlumniData>().mapArray(JSONString: alumni_clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                if searchType == "Name" {
                    getAlumniData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased())}
                    }else if searchType == "Batch" {
                        getAlumniData = filtered_list.filter { $0.batch.lowercased().contains(searchText.lowercased())}
                        
                    }else if searchType == "Designation" {
                        
                    
                        getAlumniData = filtered_list.filter {  $0.designation.lowercased().contains(searchText.lowercased())}
                }
                
                
            }else{
                
                getAlumniData = filtered_list
                print("pendingOrder")
            }
            
            if getAlumniData.count > 0{
                noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true
                gifImage.isHidden = true
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL
                //                self.gifImage.image = UIImage.gif(name: "Rocket")

                print ("searchListPendigCount",getAlumniData.count)
                //                viewEmpty.alpha = 0
                //                emptyLbl.alpha = 0
            }else{
//                self.gifImage.image = UIImage.gif(name: "no_data_found")
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL
                
                gifImage.isHidden = false

                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
//                noRecordsLbl.text = "No Records"


                //                viewEmpty.alpha = 1
                //                emptyLbl.alpha = 1
            }
            
            
            
            tv.reloadData()
            //
            
        }
        
    
        
   
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("memberTypememberType",memberType)
        if memberType == 1 || memberType == 2 {
//            let getInstitute : NetworkInstituteData = getInstituteData [indexPath.row]
//            
            
            print("Institute Not Access For Chat")
//            let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
//            let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
//            viewController.userName = getInstitute.name
//            viewController.userImg = getInstitute.profilePicture
//            viewController.user_id = getInstitute.id
//            viewController.selectedUserId = getInstitute.id
//            viewController.designationStr = getInstitute.designation
//
//            print("getInstitute.id",getInstitute.id)
//            self.main.present(viewController, animated: true)
            
        }else{
            let getAlumni : NetworkAlumniData = getAlumniData [indexPath.row]

            let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
            viewController.userName = getAlumni.name
            viewController.user_id = getAlumni.id
            viewController.selectedUserId = getAlumni.id
            print("getAlumni.id.id",getAlumni.id)
            viewController.designationStr = getAlumni.designation

            viewController.userImg = getAlumni.profilePicture
            viewController.batchStr = getAlumni.batch

            
            
            viewController.cNameStr = getAlumni.companyName

            viewController.instituteNameStr = getAlumni.instituteName

            self.main.present(viewController, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if memberType == 1 || memberType == 2 {
            let filtered_list : [NetworkInstituteData] = Mapper<NetworkInstituteData>().mapArray(JSONString: clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                
                getInstituteData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased()) ||
                    $0.designation.lowercased().contains(searchText.lowercased()) ||
                    $0.batch.lowercased().contains(searchText.lowercased())
                  
                }
                
                
            }else{
                getInstituteData = filtered_list
                print("getInstituteData")
            }
            
            if getInstituteData.count > 0{
                noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true

                gifImage.isHidden = true

                print ("searchListPendigCount",getInstituteData.count)
                //                viewEmpty.alpha = 0
                //                emptyLbl.alpha = 0
            }else{
                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
                gifImage.isHidden = false
//                noRecordsLbl.text = "No Records"
//                self.gifImage.image = UIImage.gif(name: "no_data_found")
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL

                //                viewEmpty.alpha = 1
                //                emptyLbl.alpha = 1
            }
            
            
            
            tv.reloadData()
            //
            
        }else{
            let filtered_list : [NetworkAlumniData] = Mapper<NetworkAlumniData>().mapArray(JSONString: alumni_clone_list.toJSONString()!)!
            
            if !searchText.isEmpty{
                getAlumniData = filtered_list.filter { $0.name.lowercased().contains(searchText.lowercased()) ||
                    $0.designation.lowercased().contains(searchText.lowercased()) ||
                    $0.batch.lowercased().contains(searchText.lowercased())
                }
                
                
            }else{
                
                getAlumniData = filtered_list
                print("pendingOrder")
            }
            
            if getAlumniData.count > 0{
                noRecordsView.isHidden = true
//                noRecordsLbl.isHidden = true
                gifImage.isHidden = true

                
//                self.gifImage.image = UIImage.gif(name: "Rocket")

                print ("searchListPendigCount",getAlumniData.count)
                //                viewEmpty.alpha = 0
                //                emptyLbl.alpha = 0
            }else{
//                self.gifImage.image = UIImage.gif(name: "no_data_found")
                gifImage.isHidden = false
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL
                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
//                noRecordsLbl.text = "No Records"


                //                viewEmpty.alpha = 1
                //                emptyLbl.alpha = 1
            }
            
            
            
            tv.reloadData()
            //
            
        }
        
    }
        
//     func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//         
//       
//        search_bar.endEditing(true)
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        search_bar.endEditing(true)
//    }
    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        print("searchBar.resignFirstResponder()")
//
//        
//        if memberType == 1 || memberType == 2 {
//            getNetworkInstituteList()
//            search_bar.resignFirstResponder()
//   
//            self.tv.reloadData()
//        }else{
//            getNetworkAlumniList()
//            search_bar.resignFirstResponder()
//    
//            self.tv.reloadData()
//        }
//        search_bar.resignFirstResponder()
////        print("searchBar.resignFirstResponder()")
////        print(getLessonPlanData.count)
////        tv.alpha = 1
////        getLessonDetails()
//        self.tv.reloadData()
//    }

    
    
    
    
    @IBAction  func getNetworkAlumniList () {
        
        
        
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": 0,
            "year" : 0,
            "designation" : "",
            "name" : ""
        ]
       
       
       
        print("token",token)
        print("param4567",param)
        
        GetNetworkAlumniRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let alumniNetworkResponse : NetworkAlumniResponse = Mapper<NetworkAlumniResponse>().map(JSONString: res)!
            
            if alumniNetworkResponse.status == true {
                
                getAlumniData = alumniNetworkResponse.data
                alumni_clone_list = alumniNetworkResponse.data

                tv.dataSource = self
                tv.delegate = self
                
                tv.reloadData()
                //
                
            }else{
                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
//                noRecordsLbl.text = alumniNetworkResponse.message
//                let alert = UIAlertController(title: "Alert", message: alumniNetworkResponse.message, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                self.main.present(alert, animated: true, completion: nil)
//                
                //
                
            }
            
            
        }
    }
    
    
    
    
    
    @IBAction  func getNetworkInstituteList () {
        
        
        
        let param : [String : Any] =
        [
            "limit": 10,
            "offset": 0,
            "year" : 0,
            "designation" : "",
            "name" : ""
        ]
       
       
       
        print("token",token)
        print("param",param)
        
        GetNetworkInstituteRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let instituteNetworkResponse : NetworkInstituteResponse = Mapper<NetworkInstituteResponse>().map(JSONString: res)!
            
            if instituteNetworkResponse.status == true {
                
                getInstituteData = instituteNetworkResponse.data
                clone_list = instituteNetworkResponse.data

                tv.dataSource = self
                tv.delegate = self
                
                tv.reloadData()
                //
                
            }else{
                
                
                noRecordsView.isHidden = false
//                noRecordsLbl.isHidden = false
//                noRecordsLbl.text = instituteNetworkResponse.message
//                let alert = UIAlertController(title: "Alert", message: instituteNetworkResponse.message, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                self.main.present(alert, animated: true, completion: nil)
                
                //
                
            }
            
            
        }
    }
    
    
    
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


//            self.view.endEditing(true)


            return false


        }
    
    
    
    
    
    
    
}

class ProfileImageVc : UITapGestureRecognizer{
    
    
    var ImageUrl : String!
    var TitleLbl : String!
    
    
}
