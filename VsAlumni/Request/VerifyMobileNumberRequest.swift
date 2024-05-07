//
//  VerifyMobileNumberRequest.swift
//  VsAlumni
//
//  Created by admin on 30/01/24.
//

import Foundation

import KRProgressHUD


class VerifyMobileNumberRequest {
    
    static func call_request(param : String, completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("VerifyMobileNumberRequest()",get_url())
        BaseRequest.raw_post(url: get_url(), param: param).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@auth/verify-mobile-number", Constant.BaseUrl as! CVarArg )
    }
    
}
