//
//  GetCountryIdStateIdRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation


import KRProgressHUD


class GetCountryIdStateIdRequest{
    
    
    static func call_request (param : [String : String],completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetCountryIdStateIdRequest()",get_url())
        BaseRequest.get(url: get_url(), param: param).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {
        return String (format:  "%@get-country-list",Constant.BaseUrl as! CVarArg )
    }
    
    

    
}
