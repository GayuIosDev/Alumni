//
//  ResetPasswordModal.swift
//  VsAlumni
//
//  Created by admin on 21/01/24.
//

import Foundation

import ObjectMapper

class ResetPasswordModal : Mappable {
     

     
    var password_key : String!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        password_key <- map["password_key"]
        
      
    }
    
}




class ResetPasswordResponse : Mappable {
  
                        
    var status : Bool!
    var message : String!
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
    }
    
}
