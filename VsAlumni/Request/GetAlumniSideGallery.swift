//
//  GetAlumniSideGallery.swift
//  VsAlumni
//
//  Created by admin on 19/01/24.
//

import Foundation
import KRProgressHUD

class GetAlumniSideGallery{
    
    
    static func call_request(token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("GetAlumniSideGallery()",get_url())
        BaseRequest.paramNotUsing(url: get_url(),token : token).success {
            
            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@gallery/alumni-institute-list",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
