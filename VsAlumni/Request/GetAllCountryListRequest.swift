//
//  GetAllCountryListRequest.swift
//  VsAlumni
//
//  Created by admin on 15/12/23.
//

import Foundation


import KRProgressHUD


class GetAllCountryListRequest{
    
    
    static func call_request (completion_handler : @escaping(String) -> ()) {

        
        KRProgressHUD.show()
        print("GetAllCountryListRequest()",get_url())
        BaseRequest.getNoParam(url: get_url()) .success {
     

            (res) in

            completion_handler(res as! String)

        }

    }

    private static func get_url() -> String {

        return String (format:  "%@location/get-country-list",Constant.BaseUrl as! CVarArg)

    }
    
    
//https://vss.voicesnapforschools.com/nodejs/api/lesson-plan/get_lesson_plan_staff_report_App
    
}
