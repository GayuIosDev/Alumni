//
//  DeleteBlogModal.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import ObjectMapper

class DeleteBlogModal : Mappable {
    


    var blog_id : Int!
   
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        blog_id <- map["blog_id"]
       
        
        
        
    }
    
}




class DeleteBlogResponse : Mappable {
    
    
    
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




