//
//  DeleteImageGalleryModal.swift
//  VsAlumni
//
//  Created by admin on 19/02/24.
//

import Foundation
import ObjectMapper

class DeleteImageGalleryModal : Mappable {
      
    
    var image_id : Int!
   
    
    init(){}
   
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        image_id <- map["image_id"]
       
      
    }
    
}




class DeleteImageGalleryResponse : Mappable {
    
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



