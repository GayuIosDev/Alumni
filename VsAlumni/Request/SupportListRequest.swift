//
//  SupportListRequest.swift
//  VsAlumni
//
//  Created by admin on 01/02/24.
//

import Foundation

import KRProgressHUD

class SupportListRequest{
    
    
    static func call_request(token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("GetAlumniSideGallery()",get_url())
        BaseRequest.paramNotUsing(url: get_url(),token : token).success {
            
            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@support/get-support-type",Constant.BaseUrl as! CVarArg )
    }
    
    


    
}
