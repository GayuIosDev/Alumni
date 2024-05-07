//
//  ResendOtpRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation
//
import KRProgressHUD


class ResendOtpRequest {
    
    
    static func call_request(completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ResendOtpRequest()",get_url())
        BaseRequest.getNoParam(url: get_url()).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/resend-otp", Constant.BaseUrl as! CVarArg)
    }
    
}






class ResendOtpInstituteRequest {
    
    
    static func call_request(completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ResendOtpRequest()",get_url())
        BaseRequest.getNoParam(url: get_url()).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@institute/resend-otp", Constant.BaseUrl as! CVarArg)
    }
    
}


class ResetPasswordRequest {
    
    
    static func call_request( param : String, token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ResendOtpRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@auth/reset-password", Constant.BaseUrl as! CVarArg)
    }
    
}
