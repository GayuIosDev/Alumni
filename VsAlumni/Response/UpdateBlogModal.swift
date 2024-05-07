//
//  UpdateBlogModal.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import ObjectMapper



class UpdateBlogModal : Mappable {
    


    var blog_id : Int!
    var blog_title : String!
    var is_published : Int!
    var content_name : String!
    var type : String!
    var url : String!
    var reference_media : [UpdateBlogReferenceMedia]!
    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        blog_id <- map["blog_id"]
        blog_title <- map["blog_title"]
        content_name <- map["content_name"]
        type <- map["type"]
        
        url <- map["url"]
        is_published <- map["is_published"]
        reference_media <- map["reference_media"]
        
        
        
        
    }
    
}

class UpdateBlogReferenceMedia : Mappable {
    
    
    
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

class UpdateBlogModalResponse : Mappable {
    
    
    
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




