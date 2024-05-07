//
//  DeleteInstituteGalleryModal.swift
//  VsAlumni
//
//  Created by admin on 17/01/24.
//

import Foundation
import ObjectMapper

class DeleteInstituteGalleryModal : Mappable {
    
    var collection_id : Int!
    
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        collection_id <- map["collection_id"]
        
    }
    
}


class DeleteInstituteGalleryResponse : Mappable {
    
    
    
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
