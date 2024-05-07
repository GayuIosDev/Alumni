//
//  UpdateEventDetailModal.swift
//  VsAlumni
//
//  Created by admin on 06/01/24.
//

import Foundation
import ObjectMapper

class UpdateEventDetailModal : Mappable {
    
    var event_id : Int!
    var event_name : String!
    var  event_title : String!
    var description : String!
    var media : [updateEventReferenceMedia]!
    var  venue : String!
    var from_time : Bool!
    var  to_time : String!
    var maps_location : Int!
    var is_published : Int!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        event_id <- map["event_id"]
        event_name <- map["event_name"]
        
        event_title <- map["event_title"]
        description <- map["description"]
        media <- map["media"]
        
        venue <- map["venue"]
        from_time <- map["from_time"]
        to_time <- map["to_time"]
        
        maps_location <- map["maps_location"]
        is_published <- map["is_published"]
        
    }
    
}

class updateEventReferenceMedia : Mappable {
    
    
    
    var url : String!
    var  type : String!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        url <- map["url"]
        
        type <- map["type"]
        
        
        
        
    }
    
}



class UpdateEventDetailResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var  data : [UpdateEventDetailRepesponseData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
        data <- map["data"]
        
    }
    
}



class UpdateEventDetailRepesponseData: Mappable {
    
    
    
    
    var id : Int!
    
    var eventName : String!
    var  eventTitle : String!
    var description : String!
    var media : [UpdateEventDetailReferenceMedia]!
    var  venue : String!
    var fromTime : Bool!
    var  toTime : String!
    var mapLocation : Int!
    var isPublished : Int!
    
    var modifiedOn : String!
    var modifiedBy : Int!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        id <- map["id"]
        eventName <- map["eventName"]
        
        eventTitle <- map["eventTitle"]
        description <- map["description"]
        media <- map["media"]
        
        venue <- map["venue"]
        fromTime <- map["fromTime"]
        toTime <- map["toTime"]
        
        mapLocation <- map["mapLocation"]
        isPublished <- map["isPublished"]
        
        
        modifiedOn <- map["modifiedOn"]
        modifiedBy <- map["modifiedBy"]
        
    }
    
}

class UpdateEventDetailReferenceMedia : Mappable {
    
    
    
    var url : String!
    var  type : String!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        url <- map["url"]
        
        type <- map["type"]
        
        
        
        
    }
    
}
