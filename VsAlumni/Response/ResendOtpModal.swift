//
//  ResendOtpModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation
import ObjectMapper

class ResendOtpModal : Mappable {
    
    var id : Int!
  
  
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
      
        id <- map["id"]
        
        
        
    }
    
}

class resendValidateOtpResponse : Mappable {
   
    var status : Bool!
    var  message : String!
    var alumni_id : Int!
    
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
        alumni_id <- map["alumni_id"]
      
       
       

    }
    
}
