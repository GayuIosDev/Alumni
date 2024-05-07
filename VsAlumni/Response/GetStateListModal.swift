//
//  GetStateListModal.swift
//  VsAlumni
//
//  Created by admin on 16/12/23.
//

import Foundation
//
import ObjectMapper


class GetStateListModal : Mappable {
    
    var countryId : Int!
  
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        countryId <- map["countryId"]
       
       

        
        
        
        
    }
    
}


class GetStateListResponse : Mappable {
    
    var status : Bool!
    var  message : String!
    var data : [StateData]!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map ["data"]
       

        
        
        
        
    }
    
}

class StateData : Mappable {
   
    var idState : Int!
    var  stateName : String!
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        idState <- map["idState"]
        stateName <- map["stateName"]
        
        
        
    }
    
}
