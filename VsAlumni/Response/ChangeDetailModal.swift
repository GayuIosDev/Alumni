//
//  ChangeDetailModal.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import Foundation
import ObjectMapper

class ChangeDetailModal : Mappable {
   
     
    var firstName : String!
    var lastName : String!
    var emailId : String!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        emailId <- map["emailId"]
      
    }
    
}




class ChangeDetailResponse : Mappable {
  
                        
    var status : Bool!
    
    var message : String!
    var  data : [ChangeProfileSettingChangeDetailData]!
    var  alumnidata : [ChangeProfileSettingChangeDetailDataAlumni]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        alumnidata <- map["data"]
        
    }
    
}


class ChangeProfileSettingChangeDetailDataAlumni : Mappable {
  
                        
    var email_id : String!
    var lastname : String!
    
    var name : String!
    var  id : Int!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        email_id <- map["email_id"]
        name <- map["name"]
        lastname <- map["lastname"]
        id <- map["id"]
        
    }
    
}


class ChangeProfileSettingChangeDetailData : Mappable {
  
                        
    var email_id : String!
    
    var name : String!
    var  id : Int!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        email_id <- map["email_id"]
        name <- map["name"]
        
        id <- map["id"]
        
    }
    
}




