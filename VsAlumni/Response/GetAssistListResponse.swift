//
//  GetAssistListResponse.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import Foundation
import ObjectMapper

class GetAssistListResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var data : [GetAssistListtData]!
    
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


class GetAssistListtData : Mappable {
    
    
    var name : String!
    var  assist_id : Int!
    var alumni_id : Int!
    var  title : String!
    var description : String!
    var validity_date : String!
    var  profile_picture : String!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        name <- map["name"]
        assist_id <- map["assist_id"]
        alumni_id <- map["alumni_id"]
        title <- map["title"]
        description <- map["description"]
        validity_date <- map["validity_date"]
        profile_picture <- map["profile_picture"]
        
        
    }
    
}


