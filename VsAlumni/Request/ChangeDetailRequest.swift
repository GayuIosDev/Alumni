//
//  ChangeDetailRequest.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import Foundation

import KRProgressHUD



class ChangeDetailRequest {
    
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("ChangeDetailRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@profile/change-details", Constant.BaseUrl as! CVarArg )
    }
    
}
