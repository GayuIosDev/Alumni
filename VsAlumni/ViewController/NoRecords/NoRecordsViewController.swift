//
//  NoRecordsViewController.swift
//  VsAlumni
//
//  Created by admin on 16/04/24.
//

import UIKit

class NoRecordsViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var noRecordsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    

    @IBAction func okAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

@IBDesignable class Triangle: UIView {
    
    @IBInspectable var color: UIColor = .white
//    UIColor(named: "BeforeSplashGrey")!
    @IBInspectable var firstPointX: CGFloat = 0
    @IBInspectable var firstPointY: CGFloat = 0
    @IBInspectable var secondPointX: CGFloat = 0.5
    @IBInspectable var secondPointY: CGFloat = 1
    @IBInspectable var thirdPointX: CGFloat = 1
    @IBInspectable var thirdPointY: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: self.firstPointX * rect.width, y: self.firstPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.secondPointX * rect.width, y: self.secondPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.thirdPointX * rect.width, y: self.thirdPointY * rect.height))
        aPath.close()
        self.color.set()
        self.backgroundColor = .clear
        aPath.fill()
    }
    
}
