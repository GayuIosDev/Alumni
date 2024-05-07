//
//  ContributeViewController.swift
//  VsAlumni
//
//  Created by admin on 12/10/23.
//

import UIKit
import ObjectMapper
import SDWebImage
import DropDown


class ContributeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
   
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var instituteNameLl: UILabel!
    
    
    @IBOutlet weak var moneyViewHeight: NSLayoutConstraint!
    @IBOutlet weak var moneyView: UIView!
    
    @IBOutlet weak var dollarRupeeTxtField: UILabel!
    @IBOutlet weak var moneyGif: UIImageView!
    
    @IBOutlet weak var dollarRupeeSelectView: UIView!
    
    @IBOutlet weak var contributeLbl: UILabel!
    
    @IBOutlet weak var contributorHeight: NSLayoutConstraint!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var contributeOverAllHeight: NSLayoutConstraint!
    @IBOutlet weak var contributorsLbl: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var noPendingLbl: UILabel!
    
    @IBOutlet weak var fundReceLbl: UILabel!
    
    @IBOutlet weak var fundNeedLbl: UILabel!
    
    
    @IBOutlet weak var contributeView: UIView!
    
    @IBOutlet weak var tv: UITableView!
    
    var fundNeeded : Int!
    var fundReceived : Int!
    var noPending : Int!
    var requestID : Int!
   let rowIdentifier = "ContributorsListTableViewCell"
    var memberType : Int!
    var token : String!
    var instituteID : Int!
    var isAmountChck : String!
    var drop_down = DropDown()
    var isJoint : Bool!
    var getPending : Int!
    var ContributeData : [GetContributionListData] = []
    var vounteerData : [GetVolunteerData] = []
    
    
    var getInstituteName : String!
    var getTitleLbl : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyGif.isHidden = true
        
        
        
        
        instituteNameLl.text = getInstituteName
        titleLbl.text = getTitleLbl
        print("getInstituteName",getInstituteName)
        dollarRupeeTxtField.text = "Rupee"
        let rupeeDollarGesture = UITapGestureRecognizer(target: self, action: #selector(pickDollarRupee))
        dollarRupeeSelectView.addGestureRecognizer(rupeeDollarGesture)
        print("ContributeViewController")
//        contributeView.isHidden = true
//        contributeLbl.isHidden = true

        let defaults =  UserDefaults.standard
        memberType = defaults.integer(forKey: Constant.DefaultsKeys.memberTypeId)
        token  =   defaults.string(forKey: Constant.DefaultsKeys.token)

        overrideUserInterfaceStyle = .light

        
//        self.moneyGif.image = UIImage.gif(name: "money-4894749-4127723-ezgif.com-video-to-gif-converter")

        let gifURL = UIImage.gif(name: "money-4894749-4127723-ezgif.com-video-to-gif-converter")
                  // Use SDWebImage to load and display the GIF image
//        moneyGif.image = gifURL
        amountTextField.delegate = self
        
        amountTextField.keyboardType = .numberPad
        addDoneButtonOnKeyboard()
      
        tv.dataSource = self
        tv.delegate = self
//        contributorsLbl.isHidden = true
//        contributeOverAllHeight.constant = 270
        if memberType == 1 || memberType == 2 {
            contributeView.isHidden = true
            contributeLbl.isHidden = true

            moneyGif.isHidden = true
            moneyViewHeight.constant  = 0
            amountTextField.isHidden = true
            moneyView.isHidden = true
            contributorHeight.constant = 0
            contributeOverAllHeight.constant = 250
                     }else{
                         contributeLbl.isHidden = false

                         contributeView.isHidden = false
                         moneyGif.isHidden = false
                         amountTextField.isHidden = false
                         contributorHeight.constant = 40
                         moneyView.isHidden = false
                         moneyViewHeight.constant  = 70
                         contributeOverAllHeight.constant = 410

                     }
      
        
        tv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)

        
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
        
        print("membe12rType",memberType)
       
      
        print("isAmountChck",isAmountChck)
       
        if isAmountChck == "Amount" {
            let contributeGest = paymentGesture(target: self, action: #selector(contributePayment))
            contributeGest.amount = amountTextField.text
            contributeGest.instituteId = instituteID
            contributeGest.requestId = requestID
            contributeView.addGestureRecognizer(contributeGest)
            getContributeList()
            contributeLbl.text = "CONTRIBUTE"
            
        } else if isAmountChck == "Volunteer" {
            
            if isJoint == true {
                
                
                
                contributeView.isHidden = false
                contributeLbl.isHidden = false

                
                contributeLbl.text = "EXIT"
                let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
                contributeGest.amount = amountTextField.text
                contributeGest.instituteId = instituteID
                contributeGest.requestId = requestID
                contributeGest.isDelete = 1
                contributeView.addGestureRecognizer(contributeGest)
                
                
            }else{
                contributeView.isHidden = false
                contributeLbl.isHidden = false
                contributeLbl.text = "JOIN"
                let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
                contributeGest.amount = amountTextField.text
                contributeGest.instituteId = instituteID
                contributeGest.requestId = requestID
                contributeGest.isDelete = 0
                contributeView.addGestureRecognizer(contributeGest)
//                }
        }
            getVolnteerList()
//            contributeLbl.text = "JOIN"
            moneyGif.isHidden = true
            moneyViewHeight.constant  = 0
            contributeOverAllHeight.constant = 270
            amountTextField.isHidden = true
            moneyView.isHidden = true
        }
        
        
    }
    
    
    @IBAction func pickDollarRupee() {
        
        print("pickEstblishYear")
        
        
        
        
            var optionArray = [
                                     "Rupee","Dollar"
                                     ]
//
            drop_down.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                dollarRupeeTxtField.text = item
//    stateId = stateIDArr[index]
              
            }
            
            drop_down.dataSource = optionArray
            drop_down.anchorView = dollarRupeeSelectView
            drop_down.bottomOffset = CGPoint(x: 0, y:(drop_down.anchorView?.plainView.bounds.height)!)
            drop_down.show()
         
            
//        }
        
    }
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

        amountTextField.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            amountTextField.resignFirstResponder()
        }
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    @IBAction func contributePayment( ges : paymentGesture) {
        print("contributePayment")
        var getAmount = amountTextField.text!
        if amountTextField.text! != "" {
            if  String(noPending) > getAmount {
                
                let storyboard = UIStoryboard(name: "ContributePaymentStoryboard", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as! ContributePaymentViewController
                //        viewController.getImg = ges.img
                //        viewController.deleteHide  = 1
                //
                
                
                var getAmount = amountTextField.text
                print("getAmount",getAmount)
                //
                //
                viewController.institueId = ges.instituteId
                
                viewController.requestId = ges.requestId
                
                viewController.amount = amountTextField.text
                //        viewController.getGalleryPhotos = ges.getPhotos
                print("contributePayment")
                present(viewController, animated: true)
            }else{
                
                amountTextField.text = ""
                let alert = UIAlertController(title: "Alert", message: "Amount Should Be less than Funds yet to be covered", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please Enter the Amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func getContributeList() {
           
        

        let param : [String:Int] = [

            "requestid" : requestID,
            "limit" : 10,
            "offset" : 0
           

            
        ]
        
        print("token",token)
        print("param",param)
        
        GetContributionListRequest.call_request(param: param,token: token){ [self]
            (res) in
//            print("GetBulkChatRes",res)
            let GetBulkChatRes : GetContributionListResponse = Mapper<GetContributionListResponse>().map(JSONString: res)!
            
            
            
            if GetBulkChatRes.status == true {
                
                //
                
                ContributeData = GetBulkChatRes.data
              
                
                
                fundNeedLbl.text = "Total Funds Needed - " + String(GetBulkChatRes.amountList.noRequired)
                          fundReceLbl.text = "Funds Received - " + String(GetBulkChatRes.amountList.noReceived)
                          noPendingLbl.text = "Funds yet to be covered - " + String(GetBulkChatRes.amountList.noPending)
              
               
                
//                if ContributeData.count > 0 {
//                    contributorsLbl.isHidden = false
//                
//                }else{
//                    contributorsLbl.isHidden = true
//
//                }
                contributorsLbl.isHidden = false
              
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                
            }else{
                
                contributorsLbl.isHidden = true
                
                fundNeedLbl.text = "Total Funds Needed - " + String(GetBulkChatRes.amountList.noRequired)
                          fundReceLbl.text = "Funds Received - " + String(GetBulkChatRes.amountList.noReceived)
                          noPendingLbl.text = "Funds yet to be covered - " + String(GetBulkChatRes.amountList.noPending)
              
            }
            
        }
        
        
    }
    
    func getVolnteerList() {
           
        

        let param : [String:Int] = [

            "requestid" : requestID,
            "limit" : 10,
            "offset" : 0
           

            
            
        ]
        
        print("token",token)
        print("param",param)
        
        GetVolunteerRequest.call_request(param: param,token: token){ [self]
            (res) in
//            print("GetBulkChatRes",res)
            let GetBulkChatRes : GetVolunteerListResponse = Mapper<GetVolunteerListResponse>().map(JSONString: res)!
            
            
            
            if GetBulkChatRes.status == true {
                
                //
                
                vounteerData = GetBulkChatRes.data
                isJoint = GetBulkChatRes.isJoin
                getPending = GetBulkChatRes.volunteerList.noPending
                
                contributeLbl.isHidden = false
               if isJoint == false {
                   contributeLbl.text = "JOIN"
               }else{
                   contributeLbl.text = "EXIT"
               }
                
                
                if vounteerData.count > 0 {
                    contributorsLbl.isHidden = false
                
                }else{
                    contributorsLbl.isHidden = true

                }
                
                
                fundNeedLbl.text = "Total Funds Needed - " + String(GetBulkChatRes.volunteerList.noRequired)
                          fundReceLbl.text = "Funds Received - " + String(GetBulkChatRes.volunteerList.noReceived)
                          noPendingLbl.text = "Funds yet to be covered - " + String(GetBulkChatRes.volunteerList.noPending)
              
                  
                
                contributeLbl.isHidden = false
                
                tv.isHidden = false
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                
            }else{
                
                isJoint = GetBulkChatRes.isJoin
                
               if isJoint == false {
                   contributeLbl.text = "JOIN"
               }else{
                   contributeLbl.text = "EXIT"
               }
                
//                vounteerData = GetBulkChatRes.data
//                isJoint = GetBulkChatRes.isJoin
                
                fundNeedLbl.text = "Total Funds Needed - " + String(GetBulkChatRes.volunteerList.noRequired)
                          fundReceLbl.text = "Funds Received - " + String(GetBulkChatRes.volunteerList.noReceived)
                          noPendingLbl.text = "Funds yet to be covered - " + String(GetBulkChatRes.volunteerList.noPending)
              
                contributeLbl.isHidden = false
                contributorsLbl.isHidden = true
                tv.isHidden = true
            }
            
        }
        
        
    }
    
    
    
    @IBAction func contributeClick(ges : paymentGesture) {
        
        print("contributeClick")
        let addVoulnteerModal = AddVolunteerModal()
        addVoulnteerModal.is_delete = ges.isDelete
        addVoulnteerModal.support_request_id = requestID
       
        
        
        
        if ges.isDelete == 1 {
            contributeLbl.text = "JOIN"
        }
        
        var  addVoulnteerModalStr = addVoulnteerModal.toJSONString()
        print("addVoulnteerModal",addVoulnteerModal.toJSON())
        print("addVoulnteerModal",addVoulnteerModalStr)
        print("token",token)
        
        AddVoulnteerRequest.call_request(param: addVoulnteerModalStr!,token: token) {
            
            
            
            [self] (res) in
            
            
            
            let addVolunteerResponseRes : AddVolunteerResponse = Mapper<AddVolunteerResponse>().map(JSONString: res)!
            
            
            if addVolunteerResponseRes.status == true {
                
                print("addVolunteerResponseRes",addVolunteerResponseRes.message)
                
                
                
                getVolnteerList()
                tv.dataSource = self
                tv.delegate = self
                tv.reloadData()
                //                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                //                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                //                viewController.alertShowType = 1
                //                viewController.gifImage = "successImage"
                //                viewController.messageResponse = creaveEventRes.message
                //
                //                KRProgressHUD.dismiss()
                //                self.present(viewController, animated: true)
                
                
            }else{
                
                //                let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
                //                let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
                //                viewController.alertShowType = 1
                //                viewController.gifImage = "failureImage"
                //                viewController.messageResponse = creaveEventRes.message
                //                KRProgressHUD.dismiss()
                //                self.present(viewController, animated: true)
            }
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if memberType == 1 || memberType == 2 {
            if isAmountChck == "Amount" {
                return ContributeData.count
                
            }
        }else {
            if isAmountChck == "Amount" {
                return ContributeData.count
                
            } else if isAmountChck == "Volunteer" {
                return vounteerData.count
            }else{
                return 0
            }
        }
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! ContributorsListTableViewCell
        cell.selectionStyle  = .none
        print("memberType.c",memberType)
        if memberType == 1 || memberType == 2 {
            print("ContributeData.c",ContributeData.count)
            var contribute : GetContributionListData = ContributeData[indexPath.row]
            cell.nameLbl.text = contribute.first_name + " " + contribute.last_name
            cell.profilePic.sd_setImage(with: URL(string:  contribute.profile_pic), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.profilePic.layer.cornerRadius = 25
            
            
        }else{
            
            var contribute : GetVolunteerData = vounteerData[indexPath.row]
            cell.nameLbl.text = contribute.first_name + " " + contribute.last_name
            cell.profilePic.sd_setImage(with: URL(string:  contribute.profile_pic), placeholderImage: UIImage(named: "sample_black_screen"))
            cell.profilePic.layer.cornerRadius = 25
        if isAmountChck == "Amount" {
            cell.selectionStyle = .none
            
//            if memberType == 1 || memberType == 2 {
//              
//            }else{
//                cell.amountLbl.isHidden = false
                let contributeGest = paymentGesture(target: self, action: #selector(contributePayment))
                contributeGest.amount = amountTextField.text
                contributeGest.instituteId = instituteID
                contributeGest.requestId = requestID
                contributeView.addGestureRecognizer(contributeGest)      
            }
//            
            
            
//            if isAmountChck == "Amount" {
//                contributeLbl.text = "CONTRIBUTE"
//                
//            } else if isAmountChck == "Volunteer" {
            
          
            
            
            
          
            
            
//
            
//        }else {
            
            
            
         
            
            
            
            //            if getPending == 0 {
            
            print("isAmountChck",isAmountChck)
//            if isAmountChck == "Amount" {
//                print("isAmountChckElse")
//                cell.amountLbl.isHidden = false
//                let contributeGest = paymentGesture(target: self, action: #selector(contributePayment))
//                contributeGest.amount = amountTextField.text
//                contributeGest.instituteId = instituteID
//                contributeGest.requestId = requestID
//                contributeView.addGestureRecognizer(contributeGest)
//            }else{
//                
                
                
                print("isJointisJoint",isJoint)
                if isJoint == true {
                    
                    
                    
                    contributeView.isHidden = false
                    contributeLbl.isHidden = false

                    contributeLbl.text = "EXIT"
                    let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
                    contributeGest.amount = amountTextField.text
                    contributeGest.instituteId = instituteID
                    contributeGest.requestId = requestID
                    contributeGest.isDelete = 1
                    contributeView.addGestureRecognizer(contributeGest)
                    
                    
                }else{
                    contributeView.isHidden = false
                    contributeLbl.isHidden = false

                    contributeLbl.text = "JOIN"
                    let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
                    contributeGest.amount = amountTextField.text
                    contributeGest.instituteId = instituteID
                    contributeGest.requestId = requestID
                    contributeGest.isDelete = 0
                    contributeView.addGestureRecognizer(contributeGest)
//                }
            }
            //            }else{
            //                contributeView.isHidden = true
            //            }
            
            //            if isJoint == true {
            //                contributeLbl.text = "JOINT"
            //                let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
            //                contributeGest.amount = amountTextField.text
            //                contributeGest.instituteId = instituteID
            //                contributeGest.requestId = requestID
            //                contributeGest.isDelete = 0
            //                contributeView.addGestureRecognizer(contributeGest)
            //
            //            }else{
            //                contributeLbl.text = "EXIT"
            //                let contributeGest = paymentGesture(target: self, action: #selector(contributeClick))
            //                contributeGest.amount = amountTextField.text
            //                contributeGest.instituteId = instituteID
            //                contributeGest.requestId = requestID
            //                contributeGest.isDelete = 1
            //                contributeView.addGestureRecognizer(contributeGest)
            //            }
            
            
            
            
            
        
            
        }
       
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

}



class paymentGesture : UITapGestureRecognizer {
    var instituteId : Int!
    var requestId : Int!
    var amount : String!
    var isDelete : Int!
}
