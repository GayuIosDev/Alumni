//
//  ValidateOtpRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation
//
import KRProgressHUD


class ValidateOtpRequest {
    
    
    static func call_request(param : String, token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ValidateOtpRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/validate-otp", Constant.BaseUrl as! CVarArg )
    }
    
}


class ValidateOtpInstituteRequest {
    
    
    static func call_request(param : String, token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ValidateOtpRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@institute/validate-otp", Constant.BaseUrl as! CVarArg )
    }
    
}
