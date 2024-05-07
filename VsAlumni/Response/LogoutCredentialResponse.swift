//
//  LogoutCredentialResponse.swift
//  VsAlumni
//
//  Created by admin on 05/01/24.
//

import Foundation
import ObjectMapper



class LogoutCredentialResponse : Mappable {
   
    var status : Bool!
    var  message : String!
//    var data : [SchoolSideRegistrationData]!
    
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
       
//        data <- map["data"]
      
      
       
       

    }
    
}




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
