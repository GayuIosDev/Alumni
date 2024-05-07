//
//  NetworkInstituteResponse.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import Foundation

import ObjectMapper

class NetworkInstituteResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var data : [NetworkInstituteData]!
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


class NetworkInstituteData : Mappable {
    
    
    var id : Int!
    var  name : String!
    var designation : String!
    var  profilePicture : String!
    var batch : String!
    var instituteName : String!
    var companyName : String!
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        designation <- map["designation"]
        profilePicture <- map["profilePicture"]
        batch <- map["batch"]
        instituteName <- map["instituteName"]
        companyName <- map["companyName"]
        
        
    }
    
}


