//
//  GetAlumniSupportRequestReesponse.swift
//  VsAlumni
//
//  Created by admin on 06/03/24.
//

import Foundation
import ObjectMapper


class GetAlumniSupportRequestReesponse : Mappable {
    
    var status : Bool!
    var message : String!
    var data : [GetAlumniSupportRequestReesponseData]!

   
    var info : String!
    
  
    
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


class GetAlumniSupportRequestReesponseData : Mappable {
    
    var supportType : Int!
    var id : Int!

    var title : String!
    var description : String!

    var noRequired : Int!
    var noReceived : Int!
    var noPending : Int!
    
    
    var activeFrom : String!
    var is_published : Int!
    var instituteId : Int!

    var isPublished : Int!
    var activeTo : String!
    var publishScheduledOn : String!
    var instituteName : String!
    var isAmount : Bool!
    var bulletPoints : [String]!
    var referenceMedia : [GetContributeAlumniReferenceMedia]!
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        referenceMedia <- map["referenceMedia"]
        bulletPoints <- map["bulletPoints"]
        id <- map["id"]
        instituteId <- map["instituteId"]

        supportType <- map["supportType"]
        title <- map["title"]
        description <- map["description"]
       
        
        noRequired <- map["noRequired"]
        noReceived <- map["noReceived"]
        noPending <- map["noPending"]
       
        
        activeFrom <- map["activeFrom"]
        activeTo <- map["activeTo"]
        publishScheduledOn <- map["publishScheduledOn"]
       
        publishScheduledOn <- map["publishScheduledOn"]
        is_published <- map["is_published"]
        instituteName <- map["instituteName"]
        isAmount <- map["isAmount"]
        
    }
    
}




class GetContributeAlumniReferenceMedia : Mappable {
  
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


//class GetContributeBulletPoints : Mappable {
//    
////    var status : Bool!
////
////    var message : String!
////    var  data : [GetInstituteEventDetailData]!
//    
//    init(){}
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//    
//    
//    func mapping(map: Map) {
//        
////        status <- map["status"]
////        message <- map["message"]
//        
////        data <- map["data"]
//        
//    }
//    
//}

    
    
    
    
//    class GetContributeData : Mappable {
//        
//        var supportType : Int!
//
//        var title : String!
//        
//        var description : Bool!
//
//        var bullet_points : [GetContributeBulletPoints]!
//    //    var  data : [GetInstituteEventDetailData]!
//        
//        required init?(map: Map) {
//            mapping(map: map)
//        }
//        
//        
//        func mapping(map: Map) {
//            
//            supportType <- map["supportType"]
//            title <- map["title"]
//            description <- map["description"]
//            bullet_points <- map["bullet_points"]
//            
//    //        data <- map["data"]
//            
//        }
//        
//    }




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


