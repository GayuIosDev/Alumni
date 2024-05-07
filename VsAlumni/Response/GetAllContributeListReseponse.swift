//
//  GetAllContributeListReseponse.swift
//  VsAlumni
//
//  Created by admin on 31/01/24.
//

import Foundation
import ObjectMapper

class getContributeSupportList : Mappable {
           
        var status : Bool!
            var message : String!
            var  data : [GetContributeSupportListData]!

    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        

    }
    
}

        class GetContributeSupportListData : Mappable {
          
            var id : Int!
            var supportName : String!
            var content : String!
          
            
            init(){}
            
            required init?(map: Map) {
                mapping(map: map)
            }
            
            
            func mapping(map: Map) {
                
             
                
                id <- map["id"]
                supportName <- map["supportName"]
                content <- map["content"]
                
            }
            
        }
