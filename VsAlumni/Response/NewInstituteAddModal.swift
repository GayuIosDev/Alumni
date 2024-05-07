//
//  NewInstituteAddModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation
import ObjectMapper




class NewInstituteAddModal : Mappable {
    
    var alumni_id : Int!
  
    var country_id : Int!
    var  state_id : Int!
    var district_id : Int!
    var institute_name : String!
    var  area : String!
    var city : String!
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        country_id <- map["country_id"]
        state_id <- map["state_id"]
       
        alumni_id <- map["alumni_id"]
       
        district_id <- map["district_id"]
       
        institute_name <- map["institute_name"]
        area <- map["area"]
        city <- map["city"]
       
       
    }
    
}

class NewInstituteAddResponse : Mappable {
   
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
