//
//  CreateAlumniBlogsModal.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation
import ObjectMapper

class CreateAlumniBlogsModal : Mappable {
    
    var title : String!
    var content : String!
    var category_id : Int!
    var type : String!
    var url : String!
    var is_published : Int!
    var reference_media : [BlogReferenceMedia]!
    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        title <- map["title"]
        
        content <- map["content"]
        category_id <- map["category_id"]
        type <- map["type"]
        
        url <- map["url"]
        is_published <- map["is_published"]
        reference_media <- map["reference_media"]
        
        
        
        
    }
    
}

class BlogReferenceMedia : Mappable {
    
    
    
//    var status : Bool!
//    var message : String!
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
//        status <- map["status"]
//        message <- map["message"]
        
        
        
    }
    
}

class CreateAlumniBlogResponse : Mappable {
    
    
    
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




