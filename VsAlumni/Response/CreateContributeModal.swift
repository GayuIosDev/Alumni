//
//  CreateContributeModal.swift
//  VsAlumni
//
//  Created by admin on 26/01/24.
//

import Foundation

import ObjectMapper



class CreateContributeModal : Mappable {
    
    var support_type : Int!
    var title : String!
    var description : String!
    var no_required : String!
    var reference_media : [ContributeReferenceMedia]!
    var bullet_points : [String]!
    var active_from : String!
    var active_to : String!
    var publish_scheduled_on : String!
    var is_published : Int!
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        support_type <- map["support_type"]
        title <- map["title"]
        bullet_points <- map["bullet_points"]
        description <- map["description"]
        
        
        no_required <- map["no_required"]
        
        
        active_from <- map["active_from"]
        active_to <- map["active_to"]
        
        publish_scheduled_on <- map["publish_scheduled_on"]
        
        
        is_published <- map["is_published"]
        
        reference_media <- map["reference_media"]
        
    }
    
}




class ContributeReferenceMedia : Mappable {
  
    var type : String!
    
    var url : String!
  
   
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        type <- map["type"]
        url <- map["url"]
        
       
       
    }
    
}


class ContributeBulletPoints : Mappable {
    
//    var status : Bool!
//    
//    var message : String!
//    var  data : [GetInstituteEventDetailData]!
    
    init(){}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
//        status <- map["status"]
//        message <- map["message"]
        
//        data <- map["data"]
        
    }
    
}



class ContributeResponse : Mappable {
    
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


