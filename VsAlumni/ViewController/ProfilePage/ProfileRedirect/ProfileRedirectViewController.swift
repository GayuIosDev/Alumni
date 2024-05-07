//
//  ProfileRedirectViewController.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import UIKit
import WebKit

class ProfileRedirectViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    
    @IBOutlet weak var web_view: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    
    var webUrl : String!
    
    var titleName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light

        titleLbl.text = titleName
        
        let myURL = URL(string: webUrl)
              let myRequest = URLRequest(url: myURL!)
        web_view.load(myRequest)
        
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGesture)

    }
    

    @IBAction func backVc() {
        dismiss(animated: true)
    }
}
