//
//  ProfileGetEducationalDetails.swift
//  VsAlumni
//
//  Created by admin on 13/02/24.
//

import Foundation
import ObjectMapper


class ProfileGetEducationalDetails : Mappable {
    
    var status : Bool!
    var  message : String!
    var getEduData : [ProfileGetEducationDetail]!
    
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
        getEduData <- map["data"]
      
       
       

    }
    
    
}

class ProfileGetEducationDetail : Mappable {
    
  
    var profileInstituteList : [ProfileGetInstituteList]!
    var participation_interest : String!

    
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
      
        profileInstituteList <- map["institute_list"]
      
        participation_interest <- map["participation_interest"]
       

    }
    
    
}






class ProfileGetInstituteList : Mappable {
   
   
    var country_id : Int!
    var district_id : Int!
    var state_id : Int!
    var institute_name : String!
    var  id : Int!
 
    var  institute_id : Int!
   
   
  
  
    var class_joined : String!
    var year_joined : Int!
    var  class_passed_out : String!
 
    var  year_passed_out : Int!
   
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        country_id <- map["country_id"]
        district_id <- map["district_id"]
       
        state_id <- map["state_id"]
        institute_name <- map["institute_name"]
        id <- map["id"]
       
        institute_id <- map["institute_id"]
        
        
        
       
        class_joined <- map["class_joined"]
        year_joined <- map["year_joined"]
        class_passed_out <- map["class_passed_out"]
       
        year_passed_out <- map["year_passed_out"]
      
      
       
    }
    
}

