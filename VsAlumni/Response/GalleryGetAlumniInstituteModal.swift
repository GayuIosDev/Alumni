//
//  GalleryGetAlumniInstituteModal.swift
//  VsAlumni
//
//  Created by admin on 17/01/24.
//

import Foundation
import ObjectMapper


class GalleryGetAlumniInstituteResponse : Mappable {
    
    var status : Bool!
    var message : String!
    var  data : [GalleryGetAlumniInstituteData]!
    
    var info : String!
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        info <- map["info"]
        
    }
    
}




class GalleryGetAlumniInstituteData : Mappable {
   
    var institute_id : Int!
    var institute_name : String!
   
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        institute_id <- map["institute_id"]
        institute_name <- map["institute_name"]
        
      
        
    }
    
}

