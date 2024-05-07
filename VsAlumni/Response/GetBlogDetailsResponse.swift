//
//  GetBlogDetailsResponse.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation

import ObjectMapper

class GetBlogDetailsResponse : Mappable {
    
   
  
      

    var status : Bool!
    var message : String!
    var data : [GetBlogDetailsResponseData]!
var instituteId : Int!
var categoryId : Int!
var isPublished : Int!
var createdOn : String!

    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"] 
        instituteId <- map["instituteId"]
        categoryId <- map["categoryId"]
        isPublished <- map["isPublished"]
        createdOn <- map["createdOn"]
      
        
        
        
        
    }
    
}

    class GetBlogDetailsResponseData : Mappable {
        
       


        var title : String!
        var content : String!
        var referenceMedia : [GetBlogDetailsReferenceMedia]!
        
        var isPublished : String!
        
        init(){}
        
        
        required init?(map: Map) {
            mapping(map: map)
        }
        
        
        func mapping(map: Map) {
            title <- map["title"]
            content <- map["content"]
            referenceMedia <- map["referenceMedia"]
            isPublished <- map["isPublished"]
            
            
            
        }
        
    }

    class GetBlogDetailsReferenceMedia : Mappable {
        
        
        
        var url : String!
        var type : String!
        
        
        required init?(map: Map) {
            mapping(map: map)
        }
        
        
        func mapping(map: Map) {
            url <- map["url"]
            type <- map["type"]
            
            
            
        }
        
    }

   
