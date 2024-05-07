//
//  ProfileGetProfessionalRequest.swift
//  VsAlumni
//
//  Created by admin on 13/02/24.
//

import Foundation

import KRProgressHUD

class ProfileGetProfessionalRequest{
    
    
    static func call_request(token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ProfileGetProfessionalRequest()",get_url())
        BaseRequest.paramNotUsing(url: get_url(),token : token).success {
            
            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@profile/get-professional-details",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
