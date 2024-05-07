//
//  SocketIOManager.swift
//  VsConciise
//
//  Created by APPLE on 23/08/22.
//

import Foundation
import SocketIO
import ObjectMapper




class SocketIOManager: NSObject {

    static let sharedInstance = SocketIOManager()
    


    static var manager = SocketManager(socketURL: URL(string: "http://socket.chalkpz.com:6869/")!, config: [.log(true), .compress])
    static var socket = manager.defaultSocket
    

    
    override init() {
        super.init()
        initialize()
//        SocketIOManager.socket.joinNamespace("/swift") // Create a socket for the /swift namespac
        

    }

    
    
      func initialize() {
          
          SocketIOManager.manager = SocketManager(socketURL: URL(string: "http://socket.chalkpz.com:6869/")!, config: [.log(true), .compress])
          SocketIOManager.socket = SocketIOManager.manager.defaultSocket
        
        
          
          SocketIOManager.socket.on(clientEvent: .connect) {data, ack in
            print("socket connected \(data)")


//            SocketIOManager.socket.emit(
//                "client join", ["id":"234", "identifier":"54"]
//            )

        }

        SocketIOManager.socket.on("client balance change") { dataArray, ack in
            print("socket connected \(dataArray)")
        }
          
          
    }
    
    
//    async (user_id, msg_id,chat_room_ids,group_room_ids,msg)
    func emitMessage(user_id : Int,room_id : Int, msg_id : String,socket_value : socketObject){
        
        var data_object : [String : Any] = [String : Any]()
        data_object["room_id"] = socket_value.room_id
        data_object["user_name"] = socket_value.user_name
        data_object["content"] = socket_value.content
        data_object["local_file"] = socket_value.local_file
        data_object["content_type"] = socket_value.content_type
        data_object["user_id"] = socket_value.user_id
        data_object["login_id"] = socket_value.login_id
        data_object["date_time"] = socket_value.date_time
        data_object["message_status"] = socket_value.message_status
        data_object["sent"] = socket_value.sent
        data_object["delivered"] = socket_value.delivered
        data_object["seen"] = socket_value.seen
        data_object["is_deleted"] = socket_value.is_deleted

        //SocketIOManager.socket.emit("send_value",user_id,room_id,msg_id,data_object)
        SocketIOManager.socket.emit("send_msg",user_id,room_id,msg_id,data_object)

}
    
    
    
    func emitMessageSendGroup(user_id : Int,room_id : Int, msg_id : String,socket_value : socketObject){
        
        var data_object : [String : Any] = [String : Any]()
        data_object["room_id"] = socket_value.room_id
        data_object["user_name"] = socket_value.user_name
        data_object["content"] = socket_value.content
        data_object["local_file"] = socket_value.local_file
        data_object["content_type"] = socket_value.content_type
        data_object["user_id"] = socket_value.user_id
        data_object["login_id"] = socket_value.login_id
        data_object["date_time"] = socket_value.date_time
        data_object["message_status"] = socket_value.message_status
        data_object["sent"] = socket_value.sent
        data_object["delivered"] = socket_value.delivered
        data_object["seen"] = socket_value.seen
        data_object["is_deleted"] = socket_value.is_deleted

        //SocketIOManager.socket.emit("send_value",user_id,room_id,msg_id,data_object)
        SocketIOManager.socket.emit("send_group_msg",user_id,room_id,msg_id,data_object)

}
    
    
    func emitMessageGroup(user_id : Int,room_id : Int, msg_id : String,socket_value : socketObject){
        
        print("socketValue",socket_value.toJSONString())
        SocketIOManager.socket.emit("send_group_msg",user_id,room_id,msg_id,socket_value.toJSONString()! )

        
      //  SocketIOManager.socket.emit("send_msg", 123, 345, 678, emitVariables )
        print("messageSend")
        
        
        SocketIOManager.socket.on("ack_msg") { dataArray, ack in
            print("ack_msg \(dataArray)")
        }
        
        print("ack_msgmessageSend")
    }
    
    
    
    func ForwarMessageChat(user_id : Int,room_ids : Int, chat_room_ids : Int,msg_id : String,socket_value : socketObject){
        
        
//        async (user_id, msg_id,chat_room_ids,group_room_ids,msg)
        print("socketValue",socket_value.toJSONString())
//        SocketIOManager.socket.async(user_id,room_ids,chat_room_ids,msg_id,socket_value.toJSONString()! )

        
        print("messageSend")
        
        
        SocketIOManager.socket.on("ack_msg") { dataArray, ack in
            print("ack_msg \(dataArray)")
        }
        
        print("ack_msgmessageSend")
    }
    
    func getMessage(){
        SocketIOManager.socket.on("ack_msg") { dataArray, ack in
            print("ack_msg1 \(dataArray)")
        }
        
        print("ack_msgmessageSend")
    }
    
    func establishConnection() {
        SocketIOManager.socket.connect()
        print("SocketIOManager.socket.connect", SocketIOManager.socket.status)
    }

    func closeConnection() {
        SocketIOManager.socket.disconnect()
    
        print("SocketIOManager.socket.disconnect")
    }
}




class socketObject : Mappable {
    
    var room_id : Int!
    var user_name : String!
    var content : String!
    var  local_file : String!
    var content_type : String!
    var user_id : Int!
    var login_id : Int!
    var date_time : String!
     var message_status : String!
    var  sent : Bool!
    var delivered : Bool!
    var  seen : Bool!
    var is_deleted : Bool!
     
    var s_is_birthday : Bool!
    
    
    
    init(){}
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        s_is_birthday <- map ["s_is_birthday"]
        room_id <- map ["room_id"]
        user_name <- map ["user_name"]
        content <- map ["content"]
        local_file <- map ["local_file"]
        content_type <- map ["content_type"]
        user_id <- map ["user_id"]
        login_id <- map ["login_id"]
        date_time <- map ["date_time"]
        message_status <- map ["message_status"]
        sent <- map ["sent"]
        delivered <- map ["delivered"]
        seen <- map ["seen"]
        is_deleted <- map ["is_deleted"]
       
    }
    

}
