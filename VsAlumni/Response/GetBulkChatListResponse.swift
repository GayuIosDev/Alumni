//
//  GetBulkChatListResponse.swift
//  VsAlumni
//
//  Created by admin on 26/02/24.
//

import Foundation
import ObjectMapper

                   
               


class GetBulkChatListResponse : Mappable {
  
    var status : Bool!
    var message : String!
    var data : [GetBulkChatListData]!
    var deletedMsgs : [Int]! = []
  
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
        deletedMsgs <- map["deletedMsgs"]
        
       
       
    }
    
}

class GetBulkChatListData : Mappable {
    
    var msg_id : Int!
    var user_id : Int!

    var room_id : Int!
    var user_name : String!

    var chatContent : String!
    var content_type : String!
    var sent : Bool!
    
    
    var delivered : Bool!
    var seen : Bool!

    var local_file : String!
    var date_time : String!
    var is_delete : Bool!
    var id : Int!
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        msg_id <- map["msg_id"]
        user_id <- map["user_id"]

        room_id <- map["room_id"]
        user_name <- map["user_name"]
        chatContent <- map["content"]
       
        
        content_type <- map["content_type"]
        sent <- map["noReceived"]
        delivered <- map["delivered"]
       
        
        seen <- map["seen"]
        local_file <- map["local_file"]
        date_time <- map["date_time"]
        id <- map["id"]
        is_delete <- map["is_delete"]
      
    }
    
}





