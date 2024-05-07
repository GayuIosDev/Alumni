//
//  CreateAssistModal.swift
//  VsAlumni
//
//  Created by admin on 11/01/24.
//

import Foundation
import ObjectMapper


class CreateAssistModal : Mappable {
      
    
    var title : String!
    var description : String!
    var  validity_date : String!
   
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        title <- map["title"]
        description <- map["description"]
        
        validity_date <- map["validity_date"]
      
    }
    
}




class CreateAssistResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
   
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
        
    }
    
}



