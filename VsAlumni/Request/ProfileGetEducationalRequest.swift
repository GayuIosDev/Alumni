//
//  ProfileGetEducationalRequest.swift
//  VsAlumni
//
//  Created by admin on 13/02/24.
//

import Foundation

import KRProgressHUD

class ProfileGetEducationalRequest{
    
    
    static func call_request(token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("ProfileGetEducationalRequest()",get_url())
        BaseRequest.paramNotUsing(url: get_url(),token : token).success {
            
            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@profile/get-educational-details",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
