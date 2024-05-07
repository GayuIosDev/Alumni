//
//  GetContributionListResponse.swift
//  VsAlumni
//
//  Created by admin on 06/03/24.
//

import Foundation
import ObjectMapper



class GetContributionListResponse : Mappable {
  
    var status : Bool!
    var message : String!
    var data : [GetContributionListData]!
    var amountList : AmountList!

   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        amountList <- map["AmountList"]
        
       
       
    }
    
}

class GetContributionListData : Mappable {
    
    var contribution_id : Int!
    var order_amount : Int!

    var first_name : String!
    var last_name : String!

    var profile_pic : String!
    
 
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        contribution_id <- map["contribution_id"]
        order_amount <- map["order_amount"]

        first_name <- map["first_name"]
        last_name <- map["last_name"]
        profile_pic <- map["profile_pic"]
       
        
      
      
    }
    
}






class AmountList : Mappable {
    
   
    var noPending : Int!
    var noReceived : Int!
    var noRequired : Int!
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
       
        noPending <- map["noPending"]
        noReceived <- map["noReceived"]

        noRequired <- map["noRequired"]
    }
    
}





