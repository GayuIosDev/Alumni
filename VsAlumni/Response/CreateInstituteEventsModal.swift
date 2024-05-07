//
//  CreateInstituteEventsModal.swift
//  VsAlumni
//
//  Created by admin on 02/01/24.
//

import Foundation
import ObjectMapper


//
//class CreateInstituteEventsModal : Mappable {
//    
//    var user_name : String!
//    var password_key : String!
//    var  ip_address : String!
//    var user_agent : String!
//   
//  
//    init(){}
//    
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//    
//    
//    func mapping(map: Map) {
//        
//        user_name <- map["user_name"]
//        password_key <- map["password_key"]
//       
//        ip_address <- map["ip_address"]
//        user_agent <- map["user_agent"]
//       
//       
//    }
//    
//}
//
//
//"status": true,
//       "message": "Records found ",
//       "data": {
//                    "id": 13,
//                    "eventName": "Main Event",
//                    "eventTitle": "Special Event",
//                    "description": "testing purpose",
//                    "media": [
//                                 {
//                                     "url": "image.png",
//                                     "type": "image."
//                                 },
//                                 {
//                                     "url": "video.mp4",
//                                     "type": "video."
//                                 }
//                             ],
//                    "venue": "Auditorium",
//                    "fromTime": "01/01/2024 12:30 PM",
//                    "toTime": "01/01/2024 01:30 PM",
//                    "mapLocation": "location",
//                    "isPublished": 1
//                }
//
//
//
//
//
//
//class CreateInstituteEventsResponse : Mappable {
//   
//    var status : Bool!
//    var  message : String!
//    var token : Int!
//    var status : Bool!
//    var  message : String!
//    var token : Int!
//    
//    var data : [SchoolSideRegistrationData]!
//    
//   
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
//        token <- map["token"]
//        data <- map["data"]
//        
//        status <- map["status"]
//        message <- map["message"]
//       
//        token <- map["token"]
//        data <- map["data"]
//        
//        
//      
//      
//       
//       
//
//    }
//    
//}
//
//
//
//
//class LoginAlumniSideData : Mappable {
//   
//    var name : String!
//    var  isMainUser : Int!
//    var memberTypeId : Int!
//    var schoolName : String!
//   
//  
//    required init?(map: Map) {
//        mapping(map: map)
//    }
//    
//    
//    func mapping(map: Map) {
//        
//        name <- map["name"]
//        isMainUser <- map["isMainUser"]
//       
//        memberTypeId <- map["memberTypeId"]
//        schoolName <- map["schoolName"]
//      
//      
//       
//       
//
//    }
//    
//}
