//
//  CreateContributeRequest.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import Foundation

import KRProgressHUD

class CreateContributeRequest{
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("CreateContributeRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String {
        return String (format:  "%@support/create-institute-support-request",Constant.BaseUrl as! CVarArg )
    }
    
    

   
    
}



class getContributeRequest{
    
    
    static func call_request(param : [String : Any],token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("GetAlumniSideGallery()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {

            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@support/get-institute-support-request",Constant.BaseUrl as! CVarArg )
    }
    
    

//    support/create-institute-support-request
    
}


class getAlumniContributeRequest{
    
    
    static func call_request(param : [String : Any],token : String,completion_handler : @escaping(String)->()) {
        KRProgressHUD.show()
        print("GetAlumniSideGallery()",get_url())
        BaseRequest.verifyTokenChatString(param: param, url: get_url(), token: token).success {

            (res) in
            completion_handler (res as! String)
        }
        

    }

    private static func get_url() -> String {
        return String (format:  "%@support/get-alumni-support-request",Constant.BaseUrl as! CVarArg )
    }
    
    

//    support/create-institute-support-request
    
}
