//
//  GalleryGetInstituteListModal.swift
//  VsAlumni
//
//  Created by admin on 17/01/24.
//

import Foundation
import ObjectMapper


class GalleryGetInstituteListModal : Mappable {
    
    var institute_id : Int!
    
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        institute_id <- map["institute_id"]
        
        
    }
    
}



class GalleryGetInstituteListResponse : Mappable {
    
    var status : Bool!
    
    var message : String!
    var data : [GalleryGetInstituteListData]!
    
    var info : String!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        
        info <- map["info"]
    }
    
}

class GalleryGetInstituteListData : Mappable {
    
    
    var collection_id : Int!
    var  institute_id : Int!
    var from_date : String!
    var  to_date : String!
    var collection_name : String!
    var no_of_photo : Int!
    var  photos : [GetGalleryPhotos]!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        collection_id <- map["collection_id"]
        institute_id <- map["institute_id"]
        from_date <- map["from_date"]
        to_date <- map["to_date"]
        collection_name <- map["collection_name"]
        no_of_photo <- map["no_of_photo"]
        photos <- map["photos"]
        
        
    }
    
}


class GetGalleryPhotos : Mappable {
    
    var id : Int!
    var url : String!
    var  eventTitle : String!
    var gextension : String!
    var resolution : String!
    var  tile_type : String!
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        id <- map["id"]
        url <- map["url"]
        
        gextension <- map["extension"]
        resolution <- map["resolution"]
        tile_type <- map["tile_type"]
        
        
        
    }
    
}

