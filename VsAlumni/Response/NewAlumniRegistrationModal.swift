//
//  NewAlumniRegistrationModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation

import ObjectMapper




class NewAlumniRegistrationModal : Mappable {
    
    var first_name : String!
  
    var last_name : String!
    var  mobile_number : String!
    var email_id : String!
//    var password_key : String!
//    var  visible_pwd : String!
 
    var ip_address : String!
    var  user_agent : String!
 
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        first_name <- map["first_name"]
        last_name <- map["last_name"]
       
        mobile_number <- map["mobile_number"]
        email_id <- map["email_id"]
//        password_key <- map["password_key"]
//       
//        visible_pwd <- map["visible_pwd"]
       
        
          
        ip_address <- map["ip_address"]
       
        user_agent <- map["user_agent"]
       
       
    }
    
}

class NewAlumniRegistrationResponse : Mappable {
   
    var status : Bool!
    var  message : String!
    var alumni_id : Int!
    var token : String!
    
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
        alumni_id <- map["alumni_id"]
        token <- map["token"]
      
       
       

    }
    
}
