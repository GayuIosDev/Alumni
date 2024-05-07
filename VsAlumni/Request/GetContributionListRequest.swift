//
//  GetContributionListRequest.swift
//  VsAlumni
//
//  Created by admin on 06/03/24.
//

import Foundation

import KRProgressHUD

class GetContributionListRequest{
    
    
    static func call_request (param : [String : Int],token :String,completion_handler : @escaping(String) -> ()) {

     

        KRProgressHUD.show()
        print("GetBulkChatRequest()",get_url())
        BaseRequest.verifyTokenChat(param: param, url: get_url(), token: token).success {
//        (url: , param,token: token)


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@support/get-contribution-list",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
