//
//  AlumniProfessionalDetailRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation

import KRProgressHUD


class AlumniProfessionalDetailRequest {
    
    
    static func call_request(param : String, token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("AlumniProfessionalDetailRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/alumni-professional-detail", Constant.BaseUrl as! CVarArg )
    }
    
}



class UpdateAlumniProfessionalDetailRequest {
    
    
    static func call_request(param : String, token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("AlumniProfessionalDetailRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@register/update-alumni-professional-detail", Constant.BaseUrl as! CVarArg )
    }
    
}
