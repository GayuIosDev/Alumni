//
//  AlumniPersonalDetailModal.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation

import ObjectMapper




class AlumniPersonalDetailModal : Mappable {
    

  
    var profile_pic : String!
    var  age : Int!
    var dob : String!
    var gender : String!
    var  address : String!
 
    var  state : Int!
    var country : String!
    var marital : String!
   
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
//        alumni_id <- map["alumni_id"]
        profile_pic <- map["profile_pic"]
       
        age <- map["age"]
        dob <- map["dob"]
        gender <- map["gender"]
       
        address <- map["address"]
        state <- map["state"]
        country <- map["country"]
        marital <- map["marital"]
       
    }
    
}

class AlumniPersonalDetailModalResponse : Mappable {
   
    var status : Bool!
    var  message : String!
 
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
      
       

    }
    
}
