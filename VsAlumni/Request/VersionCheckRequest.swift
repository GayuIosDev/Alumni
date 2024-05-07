//
//  VersionCheckRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation
import KRProgressHUD


class VersionCheckRequest {
    
    
  
        
        static func call_request(param : String, completion_handler : @escaping(String)->()) {
            KRProgressHUD.show()
            print("VersionCheckRequest()",get_url())
            BaseRequest.raw_post(url: get_url(), param: param).success {
                
                (res) in
                completion_handler (res as! String)
            }
        }
    
    
    
    private static func get_url() -> String{
        
        return String(format: "%@common/version-check", Constant.BaseUrl as! CVarArg )
    }
    
}
