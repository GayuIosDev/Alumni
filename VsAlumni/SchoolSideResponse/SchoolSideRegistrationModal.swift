//
//  SchoolSideRegistrationModal.swift
//  VsAlumni
//
//  Created by admin on 26/12/23.
//

import Foundation

import ObjectMapper

class SchoolSideRegistrationModal : Mappable {
    
    var school_pic : String!
  
    var m_institute_id : Int!
    var  name : String!
    var designation : String!
    var contact_number : String!
    var  mail_id : String!
    var established_year : Int!
  
    var password_key : String!
    var  visible_pwd : String!
    var ip_address : String!
    var  user_agent : String!
  
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        school_pic <- map["school_pic"]
        m_institute_id <- map["m_institute_id"]
       
        name <- map["name"]
        designation <- map["designation"]
        contact_number <- map["contact_number"]
       
        mail_id <- map["mail_id"]
       
        
        established_year <- map["established_year"]
        password_key <- map["password_key"]
        visible_pwd <- map["visible_pwd"]
        
        ip_address <- map["ip_address"]
        user_agent <- map["user_agent"]
       
     
       
       
    }
    
}

class SchoolSideRegistrationResponse : Mappable {
   
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




class SchoolSideRegistrationData : Mappable {
   
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
