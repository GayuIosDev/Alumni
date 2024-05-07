//
//  DeleteImageGalleryRequest.swift
//  VsAlumni
//
//  Created by admin on 19/02/24.
//

import Foundation

import KRProgressHUD


class DeleteImageGalleryRequest {
    
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("EventDeleteRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@gallery/delete-image", Constant.BaseUrl as! CVarArg )
    }
    
}
