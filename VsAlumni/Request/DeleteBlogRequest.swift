//
//  DeleteBlogRequest.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import KRProgressHUD

class DeleteBlogRequest{
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("CreateInstituteBlogsRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String {
        return String (format:  "%@blog/delete-blog",Constant.BaseUrl as! CVarArg )
    }
    
    

   
    
}



