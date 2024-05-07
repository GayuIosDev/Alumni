//
//  GetSchoolListModal.swift
//  VsAlumni
//
//  Created by admin on 16/12/23.
//

import Foundation
import ObjectMapper




class GetSchoolListModal : Mappable {
    
    var keyword : String!
    var  countryid : Int!
    var stateid : Int!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        keyword <- map["keyword"]
        countryid <- map["countryid"]
        stateid <- map ["stateid"]
       

        
        
        
        
    }
    
}

class GetSchoolListResponse : Mappable {
    
    var status : Bool!
    var  message : String!
    var data : [SchoolListData]!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        status <- map["status"]
        message <- map["message"]
        data <- map ["data"]
       

        
        
        
        
    }
    
}

class SchoolListData : Mappable {
    
   
    var school : String!
    var  schoolName : String!
    var schoolId : Int!
    var  cityName : String!
    var cityId : Int!
    var  districtName : String!
    var districtId : Int!
    var  stateName : String!
   
    var  stateId : Int!
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        
        school <- map["school"]
        schoolName <- map["schoolName"]
        schoolId <- map["schoolId"]
        cityName <- map["cityName"]
        
        cityId <- map["cityId"]
        districtName <- map["districtName"]
        districtId <- map["districtId"]
        stateName <- map["stateName"]
        
        stateId <- map["stateId"]
       
        
        
        
    }
    
}
