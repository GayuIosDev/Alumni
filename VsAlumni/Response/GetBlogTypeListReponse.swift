//
//  GetBlogTypeListReponse.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation
import ObjectMapper

class GetBlogTypeListReponse : Mappable {
    
   

    var status : Bool!
    var message : String!
    var data : [GetBlogTypeListReponseData]!


    
    
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

    class GetBlogTypeListReponseData : Mappable {
        
       


        var id : Int!
        var category_name : String!
      
        
        init(){}
        
        
        required init?(map: Map) {
            mapping(map: map)
        }
        
        
        func mapping(map: Map) {
            id <- map["id"]
            category_name <- map["category_name"]
          
            
            
        }
        
    }

    
