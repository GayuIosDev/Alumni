//
//  AlumniProfessionalDetailsResponse.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation

import ObjectMapper


class AlumniProfessionalDetailsModal : Mappable {
    
    var company_lists : [ProfessionalCompanyLists]!
  
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        company_lists <- map["company_lists"]
    
       
    }
    
}


class ProfessionalCompanyLists : Mappable {
    
   
    var  company_name : String!
    var designation : String!
    var currently_working : Int!
   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        company_name <- map["company_name"]
       
        designation <- map["designation"]
        currently_working <- map["currently_working"]
       
       
    }
    
}

class AlumniProfessionalDetailsResponse : Mappable {
   
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
