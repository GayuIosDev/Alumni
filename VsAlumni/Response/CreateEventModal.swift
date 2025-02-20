//
//  CreateEventModal.swift
//  VsAlumni
//
//  Created by admin on 05/01/24.
//

import Foundation
import ObjectMapper



class CreateEventModal : Mappable {
    
    var event_name : String!
    var  event_title : String!
    var description : String!
    var venue : String!
    var from_time : String!
    var  to_time : String!
    var  maps_location : String!
    var  is_published : Int!
    var  reference_media : [CreateEventReferenceMedia]!
   
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        event_name <- map["event_name"]
        event_title <- map["event_title"]
        description <- map["description"]
        venue <- map["venue"]
        from_time <- map["from_time"]
        to_time <- map["to_time"]
        maps_location <- map["maps_location"]
        is_published <- map["is_published"]
        reference_media <- map["reference_media"]
        
      
       
    }
       
    
    
}





class CreateEventReferenceMedia : Mappable {
    
   
    var type : String!
  
    var url : String!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        type <- map["type"]
       
        url <- map["url"]
        
      
       
    }
    
}

class CreateEventResponse : Mappable {
   
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
