//
//  GetAllInstituteBlogsRequest.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation
import KRProgressHUD


class GetAllInstituteBlogsRequest{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetAllInstituteBlogsRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {

          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@blog/get-institute-blogs",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
