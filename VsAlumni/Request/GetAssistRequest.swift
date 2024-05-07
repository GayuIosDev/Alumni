//
//  GetAssistRequest.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import Foundation
import KRProgressHUD


class GetAssistRequest{
    
    
    static func call_request (param : [String : Int],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetAssistRequest()",get_url())
        BaseRequest.verifyTokenChat(param: param, url: get_url(), token: token).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@assist/get-assist-req",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}

class GetAssistRequestAll{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetAssistRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@assist/get-assist-req-all",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
