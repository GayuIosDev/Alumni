//
//  GetVolunteerListResponse.swift
//  VsAlumni
//
//  Created by admin on 08/03/24.
//

import Foundation
import ObjectMapper



class GetVolunteerListResponse : Mappable {
    
    

    
  
    var status : Bool!
    var message : String!
    var data : [GetVolunteerData]!
var volunteerList : VolunteerList!
var isJoin : Bool!
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        volunteerList <- map["VolunteerList"]
        
        isJoin <- map["isJoin"]
       
    }
    
}

class GetVolunteerData : Mappable {
    


    var support_request_id : Int!
    var first_name : String!

    var last_name : String!
    var profile_pic : String!

  
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        support_request_id <- map["support_request_id"]
        first_name <- map["first_name"]

        last_name <- map["last_name"]
        profile_pic <- map["profile_pic"]
        
      
    }
    
}





class VolunteerList : Mappable {
    
   
    var noPending : Int!
    var noReceived : Int!
    var noRequired : Int!
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
       
        noPending <- map["noPending"]
        noReceived <- map["noReceived"]

        noRequired <- map["noRequired"]
    }
    
}





