//
//  RateResponce.swift
//  VsAlumni
//
//  Created by admin on 13/04/24.
//

import Foundation
import ObjectMapper


class rateResp:Mappable{
    
    var status : Bool!
    var message : String!
    var data : [rateDataDetails]!
    
    required init?(map: ObjectMapper.Map) {
        
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
    
        status<-map["status"]
        message <- map["message"]
        data <- map["data"]
        
    }
    
    
    
    
}

class rateDataDetails  : Mappable{
    
    var rating : Int!
    var content : String!
    var input_content : [String] = []
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        rating <- map["rating"]
        content <- map["content"]
        input_content <- map["input_content"]
        
    }
    
    
    
    
    
}
