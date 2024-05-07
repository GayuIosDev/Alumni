//
//  NewAlumniRegistrationRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation


import KRProgressHUD


class NewAlumniRegistrationRequest {
    
    
    static func call_request(param : String, completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("NewAlumniRegistrationRequest()",get_url())
        BaseRequest.raw_post(url: get_url(), param: param).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/alumni-registration", Constant.BaseUrl as! CVarArg )
    }
    
}
