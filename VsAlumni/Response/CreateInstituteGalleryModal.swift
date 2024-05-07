//
//  CreateInstituteGalleryModal.swift
//  VsAlumni
//
//  Created by admin on 17/01/24.
//

import Foundation
import ObjectMapper




class CreateInstituteGalleryModal : Mappable {
    
//    var from_date : String!
//    
//    var to_date : String!
    var collection_name : String!
    
    var no_of_photo : Int!
    
    var photos : [CreateInstituteGalleryPhotos]!
    
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
//        from_date <- map["from_date"]
//        to_date <- map["to_date"]
//        
        collection_name <- map["collection_name"]
        
        
        no_of_photo <- map["no_of_photo"]
        photos <- map["photos"]
        
    }
    
}




class CreateInstituteGalleryPhotos : Mappable {
  
    var url : String!
    
    var gextension : String!
    var  resolution : String!
    var tile_type : String!
   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        url <- map["url"]
        gextension <- map["extension"]
        
        resolution <- map["resolution"]
        tile_type <- map["tile_type"]
       
    }
    
}


class CreateInstituteGalleryResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
//    var  data : [GetInstituteEventDetailData]!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        
//        data <- map["data"]
        
    }
    
}




