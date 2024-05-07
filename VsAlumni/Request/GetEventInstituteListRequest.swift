//
//  GetEventInstituteListRequest.swift
//  VsAlumni
//
//  Created by admin on 19/01/24.
//

import Foundation

import KRProgressHUD


class GetEventInstituteListRequest{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetEventInstituteListRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@event/get-institute-events",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}

class GetEventAlumniListRequest{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetEventInstituteListRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@event/get-alunni-events",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
