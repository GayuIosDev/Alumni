//
//  TermsAndConditionViewController.swift
//  VsAlumni
//
//  Created by admin on 11/03/24.
//

import UIKit
import WebKit


class TermsAndConditionViewController: UIViewController {

    
    @IBOutlet weak var continueView: UIViewX!
    
    
    
    
    @IBOutlet weak var agreeImg: UIImageView!
    
    @IBOutlet weak var dontAgreeImg: UIImageView!
    
    
    @IBOutlet weak var agreeView: UIView!
    
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var webKitView: WKWebView!
    
    @IBOutlet weak var dontAgreeView: UIView!
    
    
    
    
    var termUrl : String = "https://www.freeprivacypolicy.com/live/0c8df0d8-362c-4b5c-a1b2-2fff38db17e3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let url = URL(string: termUrl)
        print("PaymentUrl",url)
        let requestObj = URLRequest(url: url!)
        webKitView.load(requestObj)
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
        
        
        let agreeGest = UITapGestureRecognizer(target: self, action: #selector(agreeVc))
        agreeView.addGestureRecognizer(agreeGest)
        
        let dontAgreeGest = UITapGestureRecognizer(target: self, action: #selector(dontAgreeVc))
        dontAgreeView.addGestureRecognizer(dontAgreeGest)
        
        
        let continueGest = UITapGestureRecognizer(target: self, action: #selector(continueAct))
        continueView.addGestureRecognizer(continueGest)
        
    }
   
    
    
    
//
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func agreeVc() {
        agreeImg.image = UIImage(named: "ic_check_box")
        dontAgreeImg.image = UIImage(named: "ic_uncheck_box")
        
        continueView.isHidden = false
        
        
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
           let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
           self.present(viewController, animated: true)
        
    }
    
    @IBAction func continueAct() {
       
        
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
           let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
           self.present(viewController, animated: true)
        
    }
    
    
    
    @IBAction func dontAgreeVc() {
        continueView.isHidden = true
        dontAgreeImg.image = UIImage(named: "ic_check_box")
        agreeImg.image = UIImage(named: "ic_uncheck_box")
        
    }
}
