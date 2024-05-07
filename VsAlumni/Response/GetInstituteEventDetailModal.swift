//
//  GetInstituteEventDetailModal.swift
//  VsAlumni
//
//  Created by admin on 06/01/24.
//

import Foundation


import ObjectMapper


class GetInstituteEventDetailResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var  data : [GetInstituteEventDetailData]!
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




class GetInstituteEventDetailData : Mappable {
    
    var id : Int!
    
    var name : String!
    var  title : String!
    var description : String!
    var media : [getInstituteEventReferenceMedia]!
    var  venue : String!
    var fromTime : String!
    var  toTime : String!
    var mapLocation : Int!
    var isPublished : Int!
    var  type : String!
    var  profile : String!
    
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
        name <- map["name"]
        
        title <- map["title"]
        description <- map["description"]
        media <- map["media"]
        type <- map["type"]
        venue <- map["venue"]
        fromTime <- map["from_time"]
        toTime <- map["to_time"]
        
        mapLocation <- map["mapLocation"]
        isPublished <- map["isPublished"]
        
    }
    
}

class getInstituteEventReferenceMedia : Mappable {
    
    
    
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
