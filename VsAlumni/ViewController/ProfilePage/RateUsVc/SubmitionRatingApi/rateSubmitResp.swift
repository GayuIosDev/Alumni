//
//  rateSubmitResp.swift
//  VsAlumni
//
//  Created by admin on 15/04/24.
//

import Foundation
import ObjectMapper

class rateSubMitModal : Mappable{
    
    var start_rating : Int!
    var input_content : [String]!
    var suggestion_content : String!
    
    init(){}
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        start_rating <- map["start_rating"]
        input_content <- map["input_content"]
        suggestion_content <- map["suggestion_content"]
        
        
        
    }
    
    
    
    
}

class ratesubResp : Mappable{
   
 
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
