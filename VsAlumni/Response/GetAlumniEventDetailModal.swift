//
//  GetAlumniEventDetailModal.swift
//  VsAlumni
//
//  Created by admin on 06/01/24.
//

import Foundation
import ObjectMapper


class GetAlumniEventDetailResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var  data : [GetAlumniEventDetailData]!
    
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




class GetAlumniEventDetailData : Mappable {
    
    var id : Int!
    var  type : String!

    var name : String!
    var  title : String!
    var description : String!
    var media : [getAlumniEventReferenceMedia]!
    var mediaBdayChat : [bdayReferenceMedia]!
    var  venue : String!
    var fromTime : String!
    var  toTime : String!
    var mapLocation : Int!
    var isPublished : Int!
    var profile : String!
    var user_id : Int!
    var user_name : String!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        user_name <- map["user_name"]
        user_id <- map["user_id"]
        profile <- map["profile"]
        id <- map["id"]
        type <- map["type"]
        name <- map["name"]
        
        title <- map["title"]
        description <- map["description"]
        media <- map["media"]
        mediaBdayChat <- map["media"]
        
        venue <- map["venue"]
        fromTime <- map["from_time"]
        toTime <- map["to_time"]
        
        mapLocation <- map["mapLocation"]
        isPublished <- map["isPublished"]
        
    }
    
}

class getAlumniEventReferenceMedia : Mappable {
    
   
    
    var url : String!
    var  type : String!

var name : String!
var  content : String!

    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        url <- map["url"]
        
        type <- map["type"]
        name <- map["name"]
        
        content <- map["content"]
        
        
        
        
    }
    
}

class bdayReferenceMedia : Mappable {
    
                                   
   
    
    var msg_id : Int!
    var  receiver_id : Int!
    var receiver_name : String!
    var  sender_id : Int!
    var sender_name : String!
    var  sender_profile : String!
    var content : String!

    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        msg_id <- map["msg_id"]
        receiver_id <- map["receiver_id"]
        receiver_name <- map["receiver_name"]
        sender_id <- map["sender_id"]
        sender_name <- map["sender_name"]
        sender_profile <- map["sender_profile"]
        content <- map["content"]
        
        
        
        
        
    }
    
}
