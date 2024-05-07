//
//  FeedBackResponce.swift
//  VsAlumni
//
//  Created by admin on 13/04/24.
//

import Foundation
import ObjectMapper


class feedModal:Mappable{
    
    
    var name : String!
    var email : String!
    var mobile_number : String!
    var is_satisfied : Int!
    var suggestion_content : String!
    
    init(){}
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
    
        name <- map["name"]
        email <- map["email"]
        mobile_number <- map["mobile_number"]
        is_satisfied <- map["is_satisfied"]
        suggestion_content <- map["suggestion_content"]
        
        
    }
    
    
    
    
    
}

class feedResp : Mappable{
    
    
    var status : Bool!
    var message : String!
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        status<-map["status"]
        message<-map["message"]
    }
    
    
    
    
}
