//
//  VersionCheckResponse.swift
//  VsAlumni
//
//  Created by admin on 22/12/23.
//

import Foundation
import ObjectMapper



class VersionCheckModal : Mappable {
  
    var version_code : Int!
    var  device_type : String!
    
    
    init(){}
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        version_code <- map["version_code"]
        device_type <- map["device_type"]
       

        
        
        
        
    }
    
}


class VersionCheckResponse : Mappable {
    
    var status : Bool!
    var  message : String!
    var data : [VersionData]!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map ["data"]
       

        
        
        
        
    }
    
}

class VersionData : Mappable {
    
    
   
    var versionCode : Int!
    var  isForceUpdate : Int!
    var changesMade : String!
    var whatsNewContent : String!
    var privacyPolicy : String!
    var  termsAndConditions : String!
    var faq : String!
    var help : String!
    
    
    var  ShareAppLink : String!
    var isUpdateAvailable : Int!
    var updateGivenOn : String!
    var IsTermsShow : Bool!
    var  VimeoToken : String!
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        IsTermsShow <- map["IsTermsShow"]
        VimeoToken <- map["VimeoToken"]
        
        versionCode <- map["versionCode"]
        isForceUpdate <- map["isForceUpdate"]
        changesMade <- map ["changesMade"]
        whatsNewContent <- map["whatsNewContent"]
      

        
        
        privacyPolicy <- map["privacyPolicy"]
        termsAndConditions <- map["termsAndConditions"]
        faq <- map ["faq"]
        help <- map["help"]
        
        ShareAppLink <- map["ShareAppLink"]
        isUpdateAvailable <- map ["isUpdateAvailable"]
        updateGivenOn <- map["updateGivenOn"]
      
      
        
    }
    
}
