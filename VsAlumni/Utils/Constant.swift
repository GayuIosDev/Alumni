//
//  Constant.swift
//  VoicesnapSchoolApp
//
//  Created by admin on 16/08/23.
//

import Foundation
import UIKit

class Constant {
    
    
//    Register
    static let BaseUrl : String = "http://106.51.127.215:8061/api/"
    static let LoginResponse : String = "auth/credential-login"
    static let LoginResponseInstitute : String = "register/alumni-registration"
    static let PersonalDetailResponse : String = "register/alumni-personal-detail"
//    static let LoginResponse : String = "ValidatePassword"
//    static let GetUserDetail : String =  "GetUserDetailsWithValidation"
//    static let CountryResponse : String = "GetCountryList"
//    static let MobileNumberResponse : String = "ValidateUser"
//    static let PasswordResponse : String = "ValidatePassword"
//    static let TermsAndConditionResponse : String = "AgreeTermsAndConditions"
    
//    static let CountryUrl : String = "https://vss.voicesnapforschools.com/nodejs/api/MergedApi/"
    
    
    
    //    let defaults = UserDefaults.standard
    //    static let SmsBaseUrl : String = defaults.string(forKey: BASEURL)!
    
    struct AppFontName {
      static let RobotoBold = "Roboto-Bold.ttf"
      static let RobotoRegular = "Roboto-Regular.ttf"
      static let RobotoMedium = "Roboto-Medium.ttf"
        static let Aladin =  "Aladin-Regular.ttf"
        static let PoppinsBold   =  "Poppins-Bold.ttf"
        static let PoppinsLight   = "Poppins-Light.ttf"
        static let PoppinsMedium  =  "Poppins-Medium.ttf"
        static let PoppinsRegular  =   "Poppins-Regular.ttf"
        static let PoppinsSemiBold  =  "Poppins-SemiBold.ttf"
       
    }
    
    

    
    struct DefaultsKeys {
        
      
        
        static let TermsAndCondition = "TermsAndCondition"
        static let CountryId = "CountryId"
        static let MobileNumber = "MobileNumber"
        static let Password = "Password"
        static let DeviceId = "DeviceId"
        static let DialNumberOne = "DialNumberOne"
        static let DialNumberTwo = "DialNumberTwo"
        static let ResendOTPTimer = "ResendOTPTimer"
        static let tokenStatusCode = "5"
         static let changeType = "changeType"
        static let memberTypeId = "memberTypeId"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let schoolName = "schoolName"
        static let profilePic = "profilePic"
        static let token = "token"
        static let privacyPolicy = "privacyPolicy"
        static let faq = "faq"
        static let help = "help"
        static let PdfSize = "PdfSize"
        static let ProfileLink = "ProfileLink"
        static let ProfileTitle = "ProfileTitle"
        static let ReportsLink = "ReportsLink"
        static let UploadProfileTitle = "UploadProfileTitle"
        static let ForceUpdate = "ForceUpdate"
        static let profileImg = "profileImg"
        static let photoArray = [UIImage]()
        static var instGalleryData : [GalleryGetInstituteListData] = []
       static var AllModalVale : [EducationDataDetailModal] = []
        static var TokenExpire : Int!
        static var YearJoined : Int!
        static var YearPassedOut : Int!
        static var InstuteId : Int!
        static var ShareAppLink = "ShareAppLink"
        static var LoginUserName = "LoginUserName"
        static var VimeoToken = "VimeoToken"
        static var getSelectedImg : [String] = []
        static var galleryGetSelectedImg : [String] = []
        static var LoginId = "LoginId"
        static var getEventsType : String!
        static var getEventsProfile : String!
//        var call_back: (([String]) -> Void)?
    }
    

    
    struct CommonParameter {
        
        
        static let DeviceType = "Iphone"
        static let AppID = "3"
      
        
    }
    
    
   static func getWiFiAddress() -> String? {
     
            var address: String?
            var ifaddr: UnsafeMutablePointer<ifaddrs>?

            if getifaddrs(&ifaddr) == 0 {
                var ptr = ifaddr
                while ptr != nil {
                    defer { ptr = ptr?.pointee.ifa_next }

                    guard let interface = ptr?.pointee else { continue }
                    let addrFamily = interface.ifa_addr.pointee.sa_family
                    if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                        
                        let interfaceName = String(cString: interface.ifa_name)
                        if interfaceName == "en0" {
                            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                            getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                        &hostname, socklen_t(hostname.count),
                                        nil, socklen_t(0), NI_NUMERICHOST)
                            address = String(cString: hostname)
                            break
                        }
                    }
                }
                freeifaddrs(ifaddr)
            }

            return address
        }
    
    struct CellIdentifier {
        
        
        static let countryList = "CountryListTableViewCell"
    }
}
