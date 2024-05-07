//
//  DeleteAssistModal.swift
//  VsAlumni
//
//  Created by admin on 11/01/24.
//

import Foundation
import ObjectMapper

class DeleteAssistModal : Mappable {
      
    
    var assist_id : Int!
   
    
    init(){}
   
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        assist_id <- map["assist_id"]
       
      
    }
    
}




class DeleteAssistResponse : Mappable {
    
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



