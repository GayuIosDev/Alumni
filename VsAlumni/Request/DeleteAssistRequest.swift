//
//  DeleteAssistRequest.swift
//  VsAlumni
//
//  Created by admin on 11/01/24.
//

import Foundation
import KRProgressHUD


class DeleteAssistRequest {
    
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("AlumniPersonalDetailRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@assist/delete-assist-req", Constant.BaseUrl as! CVarArg )
    }
    
}
