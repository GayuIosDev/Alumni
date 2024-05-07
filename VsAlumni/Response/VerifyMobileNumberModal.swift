//
//  VerifyMobileNumberModal.swift
//  VsAlumni
//
//  Created by admin on 30/01/24.
//

import Foundation

import ObjectMapper


  

class VerifyMobileNumberModal : Mappable {
    
    var mobile_number : String!
    var log_in : Int!

    
   
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        mobile_number <- map["mobile_number"]
        log_in <- map["log_in"]

        
    }
    
}




class VerifyMobileNumberResponse : Mappable {
  
    var status : Bool!
    var message : String!
    var otp : Int!

   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        otp <- map["otp"]

       
       
    }
    
}


