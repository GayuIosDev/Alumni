//
//  AddVolunteerModal.swift
//  VsAlumni
//
//  Created by admin on 08/03/24.
//

import Foundation
import ObjectMapper

                   
               


class AddVolunteerModal : Mappable {
  
    var support_request_id : Int!
    var is_delete : Int!
    

    init(){}
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        support_request_id <- map["support_request_id"]
        is_delete <- map["is_delete"]
       
    }
    
}

class AddVolunteerResponse : Mappable {
    
    
  
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





