//
//  DeviceTokenModal.swift
//  VsAlumni
//
//  Created by admin on 29/02/24.
//

import Foundation

import ObjectMapper

                   
               


class DeviceTokenModal : Mappable {
  
    var device_type : String!
    var device_token : String!
   

    init(){}
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        device_type <- map["device_type"]
        device_token <- map["device_token"]
       
    }
    
}

class DeviceTokenResponse : Mappable {
    
    
  
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





