//
//  ValidateOtpModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation
import ObjectMapper
//class ValidateOtpModal : Mappable {
//    
////    var id : Int!
//    var  recentOtp : String!
//  
//    init (){}
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//    
//    
//    func mapping(map: Map) {
//        
//        recentOtp <- map["recentOtp"]
//        
//        
//        
//        
//    }
//    
//}








class NewValidateOtpModal : Mappable {
   
    var mobile_number : String!
    var  recent_otp : Int!
  
    init (){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        recent_otp <- map["recent_otp"]
        mobile_number <- map["mobile_number"]
        
    }
    
}

class NewValidateOtpResponse : Mappable {
   
    var status : Bool!
    var  message : String!
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
       

    }
    
}
