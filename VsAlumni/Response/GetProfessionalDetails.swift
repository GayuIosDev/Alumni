//
//  GetProfessionalDetails.swift
//  VsAlumni
//
//  Created by admin on 13/02/24.
//

import Foundation
import ObjectMapper




class GetProfessionalDetails : Mappable {
    
    var status : Bool!
    var  message : String!
    var getProfessionalData : [ProfileGetProfessionalDetail]!
    
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
        getProfessionalData <- map["data"]
      
       
       

    }
    
    
}

class ProfileGetProfessionalDetail : Mappable {
   
  
    var id : Int!
    var company_name : String!
    var designation : String!
    var curently_working : Int!

    
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
      
        id <- map["id"]
      
        company_name <- map["company_name"]
       
        designation <- map["designation"]
      
        curently_working <- map["curently_working"]
       

    }
    
    
}




