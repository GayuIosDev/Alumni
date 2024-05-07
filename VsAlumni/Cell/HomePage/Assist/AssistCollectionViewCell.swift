//
//  AssistCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 11/10/23.
//

import UIKit
import ObjectMapper


class AssistCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var gifImage: UIImageView!
    
    @IBOutlet weak var noRecordView: UIView!
    
    
    @IBOutlet weak var noRecordLbl: UILabel!
    
    
    
    @IBOutlet weak var reqLbl: UILabel!
    
    @IBOutlet weak var yourReqLbl: UILabel!
    
    @IBOutlet weak var requestAidView: UIViewX!
    
    
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var yourReqView: UIViewX!
    
    @IBOutlet weak var requestView: UIViewX!
    
    
    var rowIdentifier = "AssistListTableViewCell"
    
    
    var getData : [GetAssistListtData] = []
    var getDataAll : [GetAssistListtData] = []
    var token : String!
    
    
    var main : UIViewController!
    var getAssistId : Int!
    
    var clickAssistRequestType : String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if getData.count < 0 {
            tv.isHidden = true
        }else{
            tv.isHidden = false
        }
        tv.dataSource = self
        tv.delegate = self
        
        print("getData.countgetData.count",getData.count)
        let defaults =  UserDefaults.standard
        token = defaults.string(forKey: Constant.DefaultsKeys.token)
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
            
            
            self.main.present(refreshAlert, animated: true, completion: nil)
            
        }
        
        
//        getAssistAllList()
        
       
        
        
        noRecordView.isHidden = true
        gifImage.isHidden = true
        
        tv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)
        
        
//        let rqsAidGesture = UITapGestureRecognizer(target: self, action:  #selector(createRequestAid))
//        requestAidView.addGestureRecognizer(rqsAidGesture)
        
//        let rqsGesture = ReuestGesture(target: self, action:  #selector(clickRequest))
////        rqsGesture.deleteView = cell.deleteView
////        rqsGesture.editView = cell.editView
////        rqsGesture.editdeleteView = cell.EditDeleteView
//
//        requestView.addGestureRecognizer(rqsGesture)
//        
//        
//    
//        let yourRqsGesture = ReuestGesture(target: self, action:  #selector(clickYourRequest))
////        yourRqsGesture.deleteView = cell.deleteView
////        yourRqsGesture.editView = cell.editView
////        yourRqsGesture.editdeleteView = cell.EditDeleteView
//
//        yourReqView.addGestureRecognizer(yourRqsGesture)
        
      
        // Initialization code
    }
    
    
    @IBAction func createRequestAid() {

        
        let storyboard = UIStoryboard(name: "RequestAssistStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! RequestAssistViewController
        self.main.present(viewController, animated: true)
//            }
    }

    @IBAction func clickRequest(ges : ReuestGesture) {
        print("clickRequest")
        
    yourReqLbl.textColor = .black
    yourReqView.backgroundColor = .white
        
        getAssistAllList()
        

        reqLbl.textColor = .white
        tv.dataSource = self
        tv.delegate = self
        requestView.backgroundColor = .black
        
    }

    
    @IBAction func clickYourRequest( ges: ReuestGesture) {
        print("clickYourRequest")
        reqLbl.textColor = .black
        requestView.backgroundColor = .white
        
        
        yourReqLbl.textColor = .white
        yourReqView.backgroundColor = .black

        tv.dataSource = self
        tv.delegate = self
        getAssistList()

    }

    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! AssistListTableViewCell
        
        cell.selectionStyle = .none

//        if  requestView.backgroundColor == .black {

        cell.EditDeleteView.isHidden = true
        cell.deleteView.isHidden = true

        
        if clickAssistRequestType == "Request" {
            let getAssistData : GetAssistListtData = getData [indexPath.row]

            cell.EditDeleteView.isHidden = true
            cell.deleteView.isHidden = true
//            cell.editView.isHidden = true

//            cell.editView.isHidden = true
            cell.nameLbl.text = getAssistData.name
            cell.titleLbl.text = getAssistData.title
            cell.descriptionLbl.text = getAssistData.description
//            cell.validity_dateLbl.text = getAssistData.validity_date
            
//            cell.validity_dateLbl.isHidden = true
            
            cell.imgView.sd_setImage(with: URL(string:  getAssistData.profile_picture!), placeholderImage: UIImage(named: "image 2"))
        }else {
        
//        if yourReqLbl.text == "YOUR REQUESTS"{
            let getAssistData : GetAssistListtData = getData [indexPath.row]
//            cell.editView.isHidden = true

            cell.deleteView.isHidden = false
            cell.EditDeleteView.isHidden = false

            cell.nameLbl.text = getAssistData.name
            cell.titleLbl.text = getAssistData.title
            cell.descriptionLbl.text = getAssistData.description
//            cell.validity_dateLbl.text = getAssistData.validity_date
//            cell.validity_dateLbl.isHidden = true

         
            cell.imgView.sd_setImage(with: URL(string:  getAssistData.profile_picture!), placeholderImage: UIImage(named: "image 2"))
            let deleteGesture = ReuestGesture(target: self, action:  #selector(deleteVc))
            deleteGesture.assistId = getAssistData.assist_id
            cell.deleteView.addGestureRecognizer(deleteGesture)
        }
      
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! AssistListTableViewCell
        
        let getAssistData : GetAssistListtData = getData [indexPath.row]
        
        print("getAssistData.assist_id",getAssistData.assist_id)
        getAssistId = getAssistData.assist_id
    }
    
    
    
    
    @IBAction func deleteVc(ges : ReuestGesture) {
    
        var refreshAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete!!!", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
          print("Handle Ok logic here")
            print("tokenn",token)
            print("getAssistId",ges.assistId)
          
            
                let deleteModal = DeleteAssistModal()
            deleteModal.assist_id = ges.assistId
                
                var deleteModalStr = deleteModal.toJSONString()
                print("deleteModal",deleteModal.toJSON())
                DeleteAssistRequest.call_request(param: deleteModalStr!, token: token) {
                    
                    [self] (res) in
                    
                    let deleteRes : DeleteAssistResponse = Mapper<DeleteAssistResponse>().map(JSONString: res)!
                    
                    
                    if deleteRes.status == true {
                       
                        getAssistList()
                     
                    }else{
                        let alert = UIAlertController(title: "Alert", message: deleteRes.message, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        
                        self.main.present(alert, animated: true, completion: nil)

                    }
                    
                    
                    
                
           
        }
          }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          print("Handle Cancel Logic here")
          }))

        main.present(refreshAlert, animated: true, completion: nil)
            
          
    
}
    
    @IBAction  func getAssistList () {
        
        
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": 0
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetAssistRequest.call_request(param: param,token: token){ [self]
            (res) in
            
            let assist_response : GetAssistListResponse = Mapper<GetAssistListResponse>().map(JSONString: res)!
            
            if assist_response.status == true {
                
                getData = assist_response.data
                
                tv.isHidden = false

                tv.dataSource = self
                tv.delegate = self
                noRecordView.isHidden = true
                gifImage.isHidden = true
                tv.reloadData()
                //
                
            }else{
                
                tv.isHidden = true

//                self.gifImage.image = UIImage.gif(name: "no_data_found")

                
                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL
                
                
                noRecordView.isHidden = false
                gifImage.isHidden = false
//                noRecordLbl.text = assist_response.message
                
//               
                
            }
            
            
        }
    }
    
    
    @IBAction  func getAssistAllList () {
        
        
        
        let param : [String : Int] =
        [
            "limit": 10,
            "offset": 0
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetAssistRequestAll.call_request(param: param,token: token){ [self]
            (res) in
//            if res?.statusCode == 401 {
//        
//                
//            }
            
            let assist_response : GetAssistListResponse = Mapper<GetAssistListResponse>().map(JSONString: res)!
            
            if assist_response.status == true {
                
                getData = assist_response.data
                
                tv.isHidden = false

                tv.dataSource = self
                tv.delegate = self
                noRecordView.isHidden = true
                gifImage.isHidden = true
                tv.reloadData()
                //
                
            }else{
                
                tv.isHidden = true

                noRecordView.isHidden = false
//                self.gifImage.image = UIImage.gif(name: "no_data_found")

                let gifURL = UIImage.gif(name: "no_data_found")
                          // Use SDWebImage to load and display the GIF image
//                gifImage.image = gifURL
//                gifImage.isHidden = false
//                noRecordLbl.text = assist_response.message
                
//                let alert = UIAlertController(title: "Alert", message: assist_response.message, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                self.main.present(alert, animated: true, completion: nil)
                
                //
                
            }
            
            
        }
    }
    
}



class ReuestGesture : UITapGestureRecognizer {
    
    
    var editdeleteView : UIView!
    var deleteView : UIView!
    var editView : UIView!
    var assistId : Int!
}
