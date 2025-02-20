//
//  AutoLoginRequest.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import Foundation

import KRProgressHUD


class AutoLoginRequest {
    
    static func call_request(param : String, completion_handler : @escaping(String)->()) {
//        KRProgressHUD.show()
        print("NewValidateOtpRequest()",get_url())
        BaseRequest.raw_post(url: get_url(), param: param).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@auth/auto-login", Constant.BaseUrl as! CVarArg )
    }
    
}
