//
//  ContributePaymentViewController.swift
//  VsAlumni
//
//  Created by admin on 06/03/24.
//

import UIKit
import WebKit


class ContributePaymentViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var backView: UIView!
    
    
    
    
    var token : String!
    var institueId : Int!
    var requestId : Int!
    var amount : String!
    var paymentUrl = "http://payment.chalkpz.com/#/option/"
    override func viewDidLoad() {
        super.viewDidLoad()

//    token/instituteid/requestid/amount
        
        let defaults =  UserDefaults.standard
        token  =   defaults.string(forKey: Constant.DefaultsKeys.token)
        print("token",token)
        var tokenSplit = token.replacingOccurrences(of: "Bearer", with: "")
        print("tokenSplit",tokenSplit)
      print("institueId",institueId)
        
        print("requestId",requestId)
        print("amount",amount)
        
        var institueIdStr =  String(institueId)
        var requestIdStr =  String(requestId)
        var amountStr =  String(amount)
        var paymentBeareToken = "http://payment.chalkpz.com/#/option/" + tokenSplit
        let trimmedString = paymentBeareToken.trimmingCharacters(in: .whitespaces)
//        trimmingCharacters(in: .whitespaces)

        
        var paymentToken =  trimmedString + "/" + institueIdStr + "/" + requestIdStr + "/" + amountStr
//        + "/" + institueId + "/" + requestId + "/" + amount
        print("paymentToken",paymentToken)
        let url = URL (string: paymentToken)
        print("PaymentUrl",url!)
        let requestObj = URLRequest(url: url!)
        print("requestObj",requestObj)
        webView.load(requestObj)
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
    }
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//ChildIDString = String(describing: appDelegate.SchoolDetailDictionary["ChildID"]!)
//SchoolIDString = String(describing: appDelegate.SchoolDetailDictionary["SchoolID"]!)
//
//var studId = ChildIDString
//var schoolId = SchoolIDString
//
//print("studId\(studId)")
//print("schoolId\(schoolId)")
//appDelegate.FeePaymentGateway =  appDelegate.FeePaymentGateway.replacingOccurrences(of: ":student_id/:school_id", with: "")
//let str_url = appDelegate.FeePaymentGateway + "\(studId)" + "/" + "\(schoolId)"
//print("WebURL",str_url)
//let url: URL = URL(string: str_url)!
////    http://testing.schoolchimes.com/#/online-fee-payment/7783339/5512/details
//paymentWebView.load(URLRequest(url: url))
//
