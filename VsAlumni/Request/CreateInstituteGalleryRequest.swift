//
//  CreateInstituteGalleryRequest.swift
//  VsAlumni
//
//  Created by admin on 17/01/24.
//

import Foundation

import KRProgressHUD


class CreateInstituteGalleryRequest {
    
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("AlumniPersonalDetailRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@gallery/create-institute-gallery-collection", Constant.BaseUrl as! CVarArg )
    }
    
}
