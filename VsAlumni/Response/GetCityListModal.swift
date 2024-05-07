//
//  GetCityListModal.swift
//  VsAlumni
//
//  Created by admin on 16/12/23.
//

import Foundation
//
import ObjectMapper



class GetCityListModal : Mappable {

var status : Bool!
var  message : String!
var data : [CityData]!

required init?(map: Map) {
    mapping(map: map)
}


func mapping(map: Map) {
    
    status <- map["status"]
    message <- map["message"]
    data <- map ["data"]
   

    
    
    
    
}

}

class CityData : Mappable {
   
         
var idCity : Int!
var  stateId : Int!
var  districtId : Int!
var cityName : String!
var  townPanchayat : String!



required init?(map: Map) {
    mapping(map: map)
}


func mapping(map: Map) {
    
    idCity <- map["idCity"]
    stateId <- map["stateId"]
    districtId <- map["districtId"]
    cityName <- map["cityName"]
    townPanchayat <- map["townPanchayat"]
   
    
    
    
}

}
