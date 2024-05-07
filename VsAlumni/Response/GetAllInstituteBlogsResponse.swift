//
//  GetAllInstituteBlogsResponse.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation
import ObjectMapper

class GetAllInstituteBlogsResponse : Mappable {
    
   


    var status : Bool!
    var message : String!
    var data : [GetAllInstituteBlogsResponseData]!
   
    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
     
        
        
        
        
    }
    
}

    class GetAllInstituteBlogsResponseData : Mappable {
        
       


        var title : String!
        var content : String!
        var referenceMedia : [GetAllInstituteBlogsReferenceMedia]!
        
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

    class GetAllInstituteBlogsReferenceMedia : Mappable {
        
        
        
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

   
