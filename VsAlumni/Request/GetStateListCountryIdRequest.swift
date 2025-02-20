//
//  GetStateListCountryIdRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation

import KRProgressHUD


class GetStateListCountryIdRequest{
    
    
    static func call_request (param : [String : Any],completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetStateListCountryIdRequest()",get_url())
        BaseRequest.get(url: get_url(), param: param).success {


          
            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {

        return String (format:  "%@location/get-state-list",Constant.BaseUrl as! CVarArg)

    }
    
    
//https://vss.voicesnapforschools.com/nodejs/api/lesson-plan/get_lesson_plan_staff_report_App
    
}
