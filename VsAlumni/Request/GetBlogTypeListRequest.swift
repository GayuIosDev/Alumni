//
//  GetBlogTypeListRequest.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import KRProgressHUD


class GetBlogTypeListRequest{
    
    
    static func call_request (param : [String : Any],token :String,completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetBlogTypeListRequest()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {

          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@blog/get-blog-categories",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
