//
//  GetCountryListModal.swift
//  VsAlumni
//
//  Created by admin on 16/12/23.
//

import Foundation
import ObjectMapper


class GetCountryListResponse : Mappable {
    
    var status : Bool!
    var  message : String!
    var data : [CountryData]!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map ["data"]
       

        
        
        
        
    }
    
}

class CountryData : Mappable {
   
    var idCountry : Int!
    var  countryCode : String!
    var countryName : String!
    var phoneCode : String!
    var utc_hours : Int!
    var  utc_minutes : Int!
  
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        idCountry <- map["idCountry"]
        countryCode <- map["countryCode"]
        countryName <- map ["countryName"]
        phoneCode <- map["phoneCode"]
      
        utc_hours <- map["utc_hours"]
        utc_minutes <- map["utc_minutes"]
        
        
        
    }
    
}
