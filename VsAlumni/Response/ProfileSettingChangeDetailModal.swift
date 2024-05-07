//
//  ProfileSettingChangeDetailModal.swift
//  VsAlumni
//
//  Created by admin on 11/01/24.
//

import Foundation
import ObjectMapper


class ProfileSettingChangeDetailModal : Mappable {
   
    
    var firstName : String!
    var lastName : String!
    var  emailId : String!
   
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        
        emailId <- map["emailId"]
      
    }
    
}




class ProfileSettingChangeDetailResponse : Mappable {
  
                        
    var status : Bool!
    
    var message : String!
    var  data : [ProfileSettingChangeDetailData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
        data <- map["data"]
        
    }
    
}




class ProfileSettingChangeDetailData : Mappable {
                
    var id : Int!
    var name : String!
    var  lastname : String!
    var email_id : String!
  
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        
        lastname <- map["lastname"]
        email_id <- map["email_id"]
        
        
    }
    
}

