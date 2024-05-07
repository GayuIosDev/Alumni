//
//  LoginCredentialRequest.swift
//  VsAlumni
//
//  Created by admin on 01/01/24.
//

import Foundation
import KRProgressHUD


class LoginCredentialRequest {
    
    
    static func call_request(param : String, completion_handler : @escaping(String)->()) {
//        KRProgressHUD.show()
        print("AlumniProfessionalDetailRequest()",get_url())
        BaseRequest.raw_post(url: get_url(), param: param).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@auth/credential-login", Constant.BaseUrl as! CVarArg )
    }
    
}
