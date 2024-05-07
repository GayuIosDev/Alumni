//
//  UpdateAlumniEducationalDetail.swift
//  VsAlumni
//
//  Created by admin on 15/02/24.
//

import Foundation
 import KRProgressHUD

class UpdateAlumniEducationalDetail{
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("CreateContributeRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String {
        return String (format:  "%@register/update-alumni-educational-detail",Constant.BaseUrl as! CVarArg )
    }
    
    

   
    
}

