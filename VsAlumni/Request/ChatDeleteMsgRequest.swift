//
//  ChatDeleteMsgRequest.swift
//  VsAlumni
//
//  Created by admin on 04/03/24.
//

import Foundation

import KRProgressHUD



class ChatDeleteMsgRequest {
    
    
    static func call_request(param : String,token: String,completion_handler:@escaping(String)->()){
        KRProgressHUD.show()
        print("ChatDeleteMsgRequest()",get_url())
        BaseRequest.vimeo(url: get_url(), param: param, Token: token).success {
            
            (res) in
            completion_handler (res as! String)
        }
    }
    
    
    private static func get_url() -> String{
        
        return String(format: "%@m-chat/delete-msg", Constant.BaseUrl as! CVarArg )
    }
    
}
