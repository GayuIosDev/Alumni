//
//  DeleteEventDetailModal.swift
//  VsAlumni
//
//  Created by admin on 06/01/24.
//

import Foundation
import ObjectMapper


class DeleteEventDetailModal : Mappable {
    
    var event_id : Int!
  
  
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        event_id <- map["event_id"]
       
       
       
    }
    
}

class DeleteEventDetailResponse : Mappable {
   
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
