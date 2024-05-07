//
//  AlumniEducationDetailModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation
import ObjectMapper



class AlumniEducationDetailModal : Mappable {
    
    var institute_list : [AlumniInstituteEducationDetailModal]!
    var  participation_interest : String!
 
   
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        institute_list <- map["institute_list"]
        participation_interest <- map["participation_interest"]
       
      
      
       
    }
    
}





class AlumniInstituteEducationDetailModal : Mappable {
    
   
    var institute_id : Int!
  
    var class_joined : String!
    var year_joined : Int!
    var  class_passed_out : String!
 
    var  year_passed_out : Int!
   
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        institute_id <- map["institute_id"]
       
        class_joined <- map["class_joined"]
        year_joined <- map["year_joined"]
        class_passed_out <- map["class_passed_out"]
       
        year_passed_out <- map["year_passed_out"]
      
       
    }
    
}

class AlumniEducationDetailResponse : Mappable {
   
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
