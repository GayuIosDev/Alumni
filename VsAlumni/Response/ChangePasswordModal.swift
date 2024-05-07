//
//  ChangePasswordModal.swift
//  VsAlumni
//
//  Created by admin on 12/01/24.
//

import Foundation
import ObjectMapper


class ChangePasswordModal : Mappable {
   
     
    var old_password : String!
    var new_password : String!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        old_password <- map["old_password"]
        new_password <- map["new_password"]
        
      
    }
    
}




class ChangePasswordResponse : Mappable {
  
                        
    var status : Bool!
    
    var message : String!
//    var  data : [ProfileSettingChangeDetailData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
//        data <- map["data"]
        
    }
    
}




