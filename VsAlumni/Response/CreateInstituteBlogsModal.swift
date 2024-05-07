//
//  CreateInstituteBlogsModal.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import ObjectMapper

class CreateInstituteBlogsModal : Mappable {
    


    var institute_id : Int!
    var title : String!
    var content : String!
    var category_id : Int!
    var type : String!
    var url : String!
    var is_published : Int!
    var reference_media : [BlogReferenceMediaInstitute]!
    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        institute_id <- map["institute_id"]
        title <- map["title"]
        content <- map["content"]
        category_id <- map["category_id"]
        type <- map["type"]
        
        url <- map["url"]
        is_published <- map["is_published"]
        reference_media <- map["reference_media"]
        
        
        
        
    }
    
}

class BlogReferenceMediaInstitute : Mappable {
    
    
    
//    var status : Bool!
//    var message : String!
//    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
//        status <- map["status"]
//        message <- map["message"]
//        
        
        
    }
    
}

class CreateInstituteBlogs : Mappable {
    
    
    
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




