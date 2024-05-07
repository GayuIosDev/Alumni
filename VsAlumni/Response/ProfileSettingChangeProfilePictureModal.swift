//
//  ProfileSettingChangeProfilePictureModal.swift
//  VsAlumni
//
//  Created by admin on 11/01/24.
//

import Foundation
import ObjectMapper




class ProfileSettingChangeProfilePictureModal : Mappable {
   
    
    var profile_pic : String!
//    var lastName : String!
//    var  emailId : String!
   
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        profile_pic <- map["profile_pic"]
//        lastName <- map["lastName"]
//        
//        emailId <- map["emailId"]
//      
    }
    
}




class ProfileSettingChangeProfilePictureResponse : Mappable {
  
                        
    var status : Bool!
    
    var message : String!
    var  data : [ProfileSettingChangeProfilePictureData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
        data <- map["data"]
        
    }
    
}




class ProfileSettingChangeProfilePictureData : Mappable {
                
    var profile_picture : String!
  
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        profile_picture <- map["profile_picture"]
      
        
    }
    
}

