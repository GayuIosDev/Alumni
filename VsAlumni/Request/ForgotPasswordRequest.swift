//
//  ForgotPasswordRequest.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import Foundation

import KRProgressHUD


class ForgotPasswordRequest {
    
    
    static func call_request(param : String, completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ResendOtpRequest()",get_url())
        BaseRequest.raw_post(url: get_url(), param: param).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@auth/forgot-password", Constant.BaseUrl as! CVarArg)
    }
    
}
