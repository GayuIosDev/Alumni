//
//  GetNetworkInstituteRequest.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import Foundation
import KRProgressHUD

class GetNetworkInstituteRequest{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetAssistRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {

          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@network/get-institute-network",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
