//
//  AutoLoginRequest.swift
//  VsAlumni
//
//  Created by admin on 30/01/24.
//

import Foundation
import ObjectMapper


class AutoLoginResponseModal : Mappable {
  

    var mobile_number : String!
    var device_id : String!
    var device_type : String!
    
    var is_otp_validated : Int!
    var ip_address : String!

  
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        mobile_number <- map["mobile_number"]
        device_id <- map["device_id"]
        device_type <- map["device_type"]
        
        is_otp_validated <- map["is_otp_validated"]
        ip_address <- map["ip_address"]
    }
    
}




class AutoLoginResponse : Mappable {
  
    var status : Bool!
    var message : String!
    var data : [AutoLoginResponseData]!

   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]

       
       
    }
    
}


class AutoLoginResponseData : Mappable {
  
    var name : String!
    var isRegistered : Int!
    var isEducationalDetailsAdded : Int!
    var isLogout : Int!
    var token : String!
    
    var isRedirectOTP : Int!

    
   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        isRedirectOTP <- map["isRedirectOTP"]

        name <- map["name"]
        isRegistered <- map["isRegistered"]
        isEducationalDetailsAdded <- map["isEducationalDetailsAdded"]
        isLogout <- map["isLogout"]
        token <- map["token"]

       
       
    }
    
}

