//
//  GetDistrictListModal.swift
//  VsAlumni
//
//  Created by admin on 16/12/23.
//

import Foundation
import ObjectMapper

     



 class GetDistrictListRsponse : Mappable {
     
     var status : Bool!
     var  message : String!
     var data : [DistrictData]!
     
     required init?(map: Map) {
         mapping(map: map)
     }
     
     
     func mapping(map: Map) {
         
         status <- map["status"]
         message <- map["message"]
         data <- map ["data"]
        

         
         
         
         
     }
     
 }

 class DistrictData : Mappable {
   
     var idDistrict : Int!
     var  stateId : Int!
     var  districtName : String!
    
   
     required init?(map: Map) {
         mapping(map: map)
     }
     
     
     func mapping(map: Map) {
         
         idDistrict <- map["idDistrict"]
         stateId <- map["stateId"]
         districtName <- map["districtName"]
         
         
         
     }
     
 }
