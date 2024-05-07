//
//  DeleteContributeModal.swift
//  VsAlumni
//
//  Created by admin on 26/01/24.
//

import Foundation

import ObjectMapper

class DeleteContributeModal : Mappable {
     

     
    var support_request_id : Int!
   
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        support_request_id <- map["support_request_id"]
        
      
    }
    
}




class DeleteContributeResponse : Mappable {
  
                        
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





          
