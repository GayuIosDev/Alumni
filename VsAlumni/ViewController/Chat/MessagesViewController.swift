//
//  MessagesViewController.swift
//  VsAlumni
//
//  Created by admin on 20/10/23.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var tv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        SocketIOManager.socket.on("ack_msg") { [self]dataArray, ack in
            print("ack_user_id \(dataArray[0])")
            print("ack_room_id \(dataArray[1])")
            print("ack_msg_id \(dataArray[2])")
            print("chats_ack_value \(dataArray[3])")
            
        }

        
//        bulkChatResponse()

        // Do any additional setup after loading the view.
    }
//    @IBAction func bulkChatResponse() {
//        
//        
//        let param : [String:Int] = [
//
//            "limit" : 10,
//            "offset" : 0,
//            "roomId" : room_Id,
//            "msgId" : 0
//
//            
//            
//        ]
//        
//
//        
////        let indexPath = NSIndexPath(item: 1, section: 1)
////        tv.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.middle, animated: true)
////
//
////        var msgCount = msg_Id - 1
////
////        print("msgIdCount",msgCount)
//        print("room_Id",room_Id)
//        print("MsgId",msg_Id)
//
//        GetBulkChatRequest.call_request(param: param, token: tokenGet) {
//        [self]
//        (res) in
//            print("param",param)
//            print("token",tokenGet!)
//            let getBulkChat : BulkChatListResponse = Mapper<BulkChatListResponse>().map(JSONString: res)!
//
//            
//            getBulkChatList = getBulkChat.bulkData
//            tv.dataSource = self
//            tv.delegate = self
//            tv.reloadData()
//            
//    }
//    
//    }
//   
//    
//   
//    @IBAction func messageSending() {
//        
//        
//        let dateFormatter : DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm a"
//        let date = Date()
//        let dateString = dateFormatter.string(from: date)
//        let interval = date.timeIntervalSince1970
//
//        print("user_name!" , user_Name!)
//        print( "user_id!" ,user_Id!)
//        print( "login_id!" ,login_Id!)
//        print("date_time!",dateString)
//        print("roomId!",room_Id!)
////        print("MsgId!",msg_Id!)
//
//        let chatText = messageTextfield.text
//        messageTextfield.text?.removeAll()
//        print("chatText!",chatText!)
//        
//        
//        
//        
//        let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
//        let salt: [UInt8] = Array("120495030296".utf8)
//        let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
//        
//        var encryptedvalue = ""
//        
//      do {
//          let key = try PKCS5.PBKDF2(
//              password: password,
//              salt: salt,
//              iterations: 1,
//              keyLength: 32,
//              variant: .sha1
//          ).calculate()
//          let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)
//
//          print("contentTypeSend123444",contentTypeSend)
//        
//          if contentTypeSend == 1 {
//              let inputData = Data()
//              let encryptedBytes = try aes.encrypt(Array(filePathVoiceRecord.utf8))
//              print("filePathVoiceRecord",filePathVoiceRecord)
//              let encryptedData = Data(encryptedBytes)
//              encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
//              print("encryptrd",encryptedvalue)
//          }else if contentTypeSend == 2 {
//              let inputData = Data()
//              let encryptedBytes = try aes.encrypt(Array(VoiceFilePath.utf8))
//              let encryptedData = Data(encryptedBytes)
//              encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
//              print("encryptrd",encryptedvalue)
//          
//          }else{
//              let inputData = Data()
//              let encryptedBytes = try aes.encrypt(Array(chatText!.utf8))
//              let encryptedData = Data(encryptedBytes)
//              encryptedvalue = encryptedData.base64EncodedString(options: .lineLength64Characters)
//              print("encryptrd",encryptedvalue)
//                        
//            //              getBulkChatList.append(encryptedvalue)
//          }
//          
//
//          
////         let decrypted = try encryptedvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7))
////          print("decrypted value",decrypted)
//
//
//      }
//
//        catch {
//            print("error encryption",error)
//        }
//        
//        
//            let contentArr = BulkChatData()
//            contentArr.content = messageTextfield.text
//            getBulkChatList.append(contentArr)
//            
//            print("getBulkChatList.append", getBulkChatList.append(contentArr))
//            
//
//            tv.reloadData()
//            
//            print("encrypted value",encryptedvalue)
//
//        
//            
//            print("contentTypeSend",contentTypeSend)
//        
//        
//                let sockeModal = socketObject()
//                sockeModal.room_id = room_Id
//                sockeModal.user_name = user_Name
//                print("contentTypeSend123",contentTypeSend)
//
//               
//                sockeModal.local_file = ""
//                if contentTypeSend == 1 {
//                    sockeModal.content = encryptedvalue
//                    sockeModal.content_type = "IMAGE"
//                }else if contentTypeSend == 2{
//                    sockeModal.content = encryptedvalue
//                    sockeModal.content_type = "VOICE"
//                }else{
//                    sockeModal.content = encryptedvalue
//                    sockeModal.content_type = "TEXT"
//                }
//                
//                sockeModal.user_id = user_Id
//                sockeModal.login_id = login_Id
//                sockeModal.date_time = dateString
//                sockeModal.message_status = "pending"
//                sockeModal.sent = false
//                sockeModal.delivered = false
//                sockeModal.seen = false
//                sockeModal.is_deleted = false
//                
//                
//
////        async (user_id, msg_id,chat_room_ids,group_room_ids,msg)
//                
//                if tapType == 1 {
//                    SocketIOManager.sharedInstance.emitMessage(user_id: user_Id,room_id: room_Id,msg_id: dateString, socket_value: sockeModal)
//                    
//                }else{
//                    SocketIOManager.sharedInstance.emitMessageSendGroup(user_id: user_Id,room_id: room_Id,msg_id: dateString, socket_value: sockeModal)
//                    
//                }
//                
//                
//                print("sockeModal123",sockeModal)
//           
//        
//        }
//    
//    
//    
//    
//    
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: chatRowIdentifier, for: indexPath) as! ChatListTableViewCell
//        
//        
//        
//        
//        
//        
//        
//        
//      
//        getBulkChatList.reversed()
//        print("getBulk12",getBulkChatList.reversed())
//        
//        let bulkChat : BulkChatData = getBulkChatList[indexPath.row]
//        
//        tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.none, animated: true)
//
////        print("lastRowIndex",lastRowIndex)
//
//        
//       print("bulkChat.content" ,bulkChat.content)
//        
//        print("bulkChat.date_time" ,bulkChat.date_time)
//        print("bulkChat.user_id" ,bulkChat.user_id )
//         
//        cell.selectionStyle = .none
//        
//      
//
//            
//            let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
//            let salt: [UInt8] = Array("120495030296".utf8)
//            let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
//
//    
//
//            var decrypted = ""
//
//            do {
//
//            let key = try PKCS5.PBKDF2(
//                password: password,
//                salt: salt,
//                iterations: 1,
//                keyLength: 32,
//                variant: .sha1
//            ).calculate()
//            
////                let newvalue = "X4VQ+Kes6I7lWub/IymnED0ck20XEA3N1OCVa+eKxsUPGpBrMa0Q4GnpcxZmROE8\r\nAAU2Ir6gg5OvFdPKmYSzcsQWqMWzsJ7BXihOHQFiPQ9NY5C/L0fY6TiWl6bQ0R6i\r\nytLhXptSYxz1zFCYQaw0D46Yk0q+el/jfCBlBcGx8xAcDUUJskOsPSJwO2s6F8Bi\r\nE2VfNydf4ABqLjPEeTx9VZ9CG3VDa7mCkr8p04AUBzWdZvEkegDSI0PHc5NyjGC/"
//                let newvalue = bulkChat.content.replacingOccurrences(of: "\n", with: "")
//                print("newvalue",newvalue)
//                decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7))
//                print("decrypted value",decrypted)
//                print("newvalue",newvalue)
//                print("newvalue1",decrypted)
//    
//            }catch {
//                print("error encryption",error)
//            }
//
//        
//      
//        print("bulkUserId",bulkChat.user_id)
//        
//        
//        print("bulkChat.content_type",bulkChat.content_type)
//       
//        
//        
//        
//        
//        if bulkChat.content_type == "TEXT" {
//            
//            
//            cell.imgSetView.isHidden = true
//            cell.audioView.isHidden = true
//            cell.senderVoiceView.isHidden = true
//            cell.senderImgSetView.isHidden = true
//
//            
//            if user_Id == bulkChat.user_id {
//
//                
//                cell.chatView.isHidden = true
//                cell.recieverVoiceHeight.constant = 0
//                cell.chtTextHeight.constant = 0
//                cell.recieverImgViewHeight.constant = 0
//                print("userId",user_Id)
//                print("bulkUserId",bulkChat.user_id)
//                cell.senderView.backgroundColor = UIColor(named: "AppColor")
//          
//                cell.senderDateLbl.text = bulkChat.date_time
//                
//                print(" cell.senderDateLbl.text", cell.senderDateLbl.text)
//                cell.senderLbl.text = decrypted
//                
//                
//            }else{
//
//                cell.dateLbl.text = bulkChat.date_time
//                cell.contentLbl.text = decrypted
//                cell.chatView.backgroundColor = .gray
//                
//            }
//
//        }
//        
//      
//        return cell
//
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        print("getBulkChatList.count",getBulkChatList.count)
//       
//       
//        return getBulkChatList.count
//    }
//    
}
