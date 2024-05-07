//
//  StepFourViewController.swift
//  Vs_Alumni
//
//  Created by admin on 09/10/23.
//

import UIKit

class StepFourViewController: UIViewController {
    
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var instagramView: UIViewX!
    @IBOutlet weak var twitterView: UIViewX!
    @IBOutlet weak var faceBookView: UIViewX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextVc))
        finishView.addGestureRecognizer(tapGesture)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-91
                print("keyboardSize.height",keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func nextVc() {
        //        let storyboard = UIStoryboard(name: "StepThreeStoryboard", bundle: nil)
        //        let viewController = storyboard.instantiateInitialViewController() as! StepThreeViewController
        //        self.present(viewController, animated: true)
        //    }
        let storyboard = UIStoryboard(name: "HomePageStoryboard", bundle: nil)
                    let viewController = storyboard.instantiateInitialViewController() as! HomePageViewController
                    self.present(viewController, animated: true)
    }
    @IBAction func yesAction(_ sender: UIButton) {
    }
    
    
    @IBAction func noAction(_ sender: UIButton) {
    }
}
