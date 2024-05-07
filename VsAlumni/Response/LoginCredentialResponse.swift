//
//  LoginCredentialResponse.swift
//  VsAlumni
//
//  Created by admin on 01/01/24.
//

import Foundation
import ObjectMapper

class LoginCredentialModal : Mappable {
    
    var user_name : String!
//    var password_key : String!
    var  ip_address : String!
    var user_agent : String!
   
  
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        user_name <- map["user_name"]
//        password_key <- map["password_key"]
       
        ip_address <- map["ip_address"]
        user_agent <- map["user_agent"]
       
       
    }
    
}






class LoginCredentialAlumniResponse : Mappable {
   
    var status : Bool!
    var  message : String!
    var token : String!
    var data : [SchoolSideRegistrationData]!
    
   
  
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




class LoginAlumniSideData : Mappable {
   
    var name : String!
    var  isMainUser : Int!
    var memberTypeId : Int!
    var schoolName : String!
    var lastname : String!
    var  profilePicture : String!
    var alumniId : Int!
    var email : String!
    
    var userLoginId : Int!
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        name <- map["name"]
        isMainUser <- map["isMainUser"]
       
        memberTypeId <- map["memberTypeId"]
        schoolName <- map["schoolName"]
      
      
       
        lastname <- map["lastname"]
        profilePicture <- map["profilePicture"]
       
        alumniId <- map["alumniId"]
        email <- map["email"]
        userLoginId <- map["userLoginId"]
    }
    
}
