//
//  AddNewInstituteDetailRequest.swift
//  VsAlumni
//
//  Created by admin on 29/12/23.
//

import Foundation

import KRProgressHUD


class AddNewInstituteDetailRequest {
    
    
    static func call_request(param : String, token : String ,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("NewAlumniRegistrationRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/add-new-institute", Constant.BaseUrl as! CVarArg )
    }
    
}
