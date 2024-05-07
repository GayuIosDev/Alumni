//
//  GetInstituteContributeResponse.swift
//  VsAlumni
//
//  Created by admin on 26/01/24.
//

import Foundation
import ObjectMapper


  

class GetInstituteContributeResponse : Mappable {
    
    var status : Bool!
    var message : String!
    var data : [GetInstituteContributeResponseData]!

   
    var info : String!
    
    init(){}
    
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


class GetInstituteContributeResponseData : Mappable {
    
    var supportType : Int!
    var id : Int!

    var title : String!
    var description : String!

    var noRequired : Int!
    var noReceived : Int!
    var noPending : Int!
    
    
    var activeFrom : String!
    var is_published : Int!
    var isAmount : Bool!

    var isPublished : Int!
    var activeTo : String!
    var publishScheduledOn : String!
    var reference_media : [GetContributeReferenceMedia]!
   
    var bulletPoints : [String]!
  
    var instituteId : Int!
    var instituteName : String!
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        instituteId <- map["instituteId"]
        instituteName <- map["instituteName"]
        
        
        bulletPoints <- map["bulletPoints"]
        id <- map["id"]

        supportType <- map["supportType"]
        title <- map["title"]
        description <- map["description"]
       
        
        noRequired <- map["noRequired"]
        noReceived <- map["noReceived"]
        noPending <- map["noPending"]
       
        activeFrom <- map["activeFrom"]
        isAmount <- map["isAmount"]
        activeTo <- map["activeTo"]
        publishScheduledOn <- map["publishScheduledOn"]
       
        publishScheduledOn <- map["publishScheduledOn"]
        is_published <- map["is_published"]
        reference_media <- map["referenceMedia"]

    }
    
}




class GetContributeReferenceMedia : Mappable {
  
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


class GetContributeBulletPoints : Mappable {
    
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

    
    
    
    
    class GetContributeData : Mappable {
        
        var supportType : Int!

        var title : String!
        
        var description : Bool!

        var bullet_points : [GetContributeBulletPoints]!
    //    var  data : [GetInstituteEventDetailData]!
        
        required init?(map: Map) {
            mapping(map: map)
        }
        
        
        func mapping(map: Map) {
            
            supportType <- map["supportType"]
            title <- map["title"]
            description <- map["description"]
            bullet_points <- map["bullet_points"]
            
    //        data <- map["data"]
            
        }
        
    }




//class ContributeResponse : Mappable {
//    
//    var status : Bool!
//
//    var message : String!
////    var  data : [GetInstituteEventDetailData]!
//    
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//    
//    
//    func mapping(map: Map) {
//        
//        status <- map["status"]
//        message <- map["message"]
//        
////        data <- map["data"]
//        
//    }
//    
//}


