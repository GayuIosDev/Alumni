//
//  NetworkAlumniResponse.swift
//  VsAlumni
//
//  Created by admin on 18/01/24.
//

import Foundation
import ObjectMapper

class NetworkAlumniResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var data : [NetworkAlumniData]!
    
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


class NetworkAlumniData : Mappable {
    
    
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
        instituteName <- map["instituteName"]
        id <- map["id"]
        name <- map["name"]
        designation <- map["designation"]
        profilePicture <- map["profilePicture"]
        batch <- map["batch"]
        companyName <- map["companyName"]
        
        
    }
    
    
}


