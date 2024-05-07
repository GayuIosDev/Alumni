//
//  ForgotPasswordModal.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import Foundation

import ObjectMapper

class ForgotPasswordModal : Mappable {
     

     
    var user_name : String!
    var ip_address : String!
    var user_agent : String!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        user_name <- map["user_name"]
        ip_address <- map["ip_address"]
        user_agent <- map["user_agent"]
      
    }
    
}




class ForgotPasswordResponse : Mappable {
  
                        
    var status : Bool!
    
    var message : String!
    var token : String!
    var  data : [ForgotPasswordData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        token <- map["token"]
        data <- map["data"]
        
    }
    
}
class ForgotPasswordData : Mappable {
   
              
    var name : String!
    var  isMainUser : Int!
    var memberTypeId : Int!
    var schoolName : String!
    var lastname : String!
    var  alumniId : Int!
    var profilePicture : String!
    var email : String!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        name <- map["name"]
        isMainUser <- map["isMainUser"]
        
        memberTypeId <- map["memberTypeId"]
        schoolName <- map["schoolName"]  
        lastname <- map["lastname"]
        alumniId <- map["alumniId"]
        
        profilePicture <- map["profilePicture"]
        email <- map["email"]
        
        
        
    }
}
