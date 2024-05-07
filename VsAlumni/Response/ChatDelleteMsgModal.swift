//
//  ChatDelleteMsgModal.swift
//  VsAlumni
//
//  Created by admin on 04/03/24.
//

import Foundation

import ObjectMapper

                   
               


class ChatDelleteMsgModal : Mappable {
       

    
    var msgId : String!
    var roomId : Int!
    var chatType : String!


    init(){}
   
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        msgId <- map["msgId"]

        roomId <- map["roomId"]
        chatType <- map["chatType"]
       
    }
    
}

class ChatDelleteMsgResponse : Mappable {
    
    
  
    var status : Bool!
    var message : String!

    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]

      
      
    }
    
}





