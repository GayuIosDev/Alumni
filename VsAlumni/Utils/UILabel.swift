//
//  UILabel.swift
//  Vs_Alumni
//
//  Created by admin on 11/10/23.
//

import Foundation
import UIKit
extension UILabel{
    
    enum FontType {
        case RobotoBold, RobotoRegular, RobotoMedium,Aladin,PoppinsBold,PoppinsLight,PoppinsMedium,PoppinsRegular,PoppinsSemiBold
    }
    
    func set_font(font_type: FontType, font_size: CGFloat){
        
        var str_font = ""
        
        switch font_type {
        case .RobotoBold:
            str_font = "Roboto-Bold"
        case .RobotoRegular:
            str_font = "Roboto-Regular"
        case .RobotoMedium:
            str_font = "Roboto-Medium"
        case .Aladin:
            str_font =  "Aladin-Regular"
        case .PoppinsBold: 
            str_font =  "Poppins-Bold.ttf"
        case .PoppinsLight:
            str_font  = "Poppins-Light.ttf"
        case .PoppinsMedium:
            str_font =  "Poppins-Medium.ttf"
        case .PoppinsRegular:
            str_font =   "Poppins-Regular.ttf"
        case .PoppinsSemiBold:
            str_font =  "Poppins-SemiBold.ttf"
        }
        
        font = UIFont(name: str_font, size: font_size)
    }
    
    
    func update_space(line_space: CGFloat, letter_space: CGFloat){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = line_space
        paragraphStyle.alignment = self.textAlignment
        
        let strokeTextAttributes = [
            NSAttributedString.Key.font : font ?? UIFont.systemFontSize,
            NSAttributedString.Key.kern: letter_space,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ] as [NSAttributedString.Key : Any]
        attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension Dictionary where Value: Equatable {
    /// Returns all keys mapped to the specified value.
    /// ```
    /// let dict = ["A": 1, "B": 2, "C": 3]
    /// let keys = dict.keysForValue(2)
    /// assert(keys == ["B"])
    /// assert(dict["B"] == 2)
    /// ```
    func keysForValue(value: Value) -> [Key] {
        return compactMap { (key: Key, val: Value) -> Key? in
            value == val ? key : nil
        }
    }
}


extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect( x : 0, y :  0, width :  self.size.width, height :  self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /*var png: Data? { return UIImagePNGRepresentation(self) }
    

    func jpeg(_ quality: JPEGQuality) -> NSData? {
        return UIImageJPEGRepresentation(self, quality.rawValue) as NSData?
    }*/
}
