//
//  CryptionExtension.swift
//  VsConciise
//
//  Created by APPLE on 06/09/22.
//

import Foundation
import CryptoSwift

extension String {

    func aesEncrypt(key: String, iv: String) throws -> String {
        let data = self.data(using: .utf8)!
        let encrypted = try! AES(key: key, iv: iv, padding: .pkcs7).encrypt([UInt8](data))
        let encryptedData = Data(encrypted)
        return encryptedData.toHexString()
    }

    func aesDecrypt(key: String, iv: String) throws -> String {
        let data = self.dataFromHexadecimalString()!
        let decrypted = try! AES(key: key, iv: iv, padding:.pkcs7).decrypt([UInt8](data))
        let decryptedData = Data(decrypted)
        return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
    }

    func dataFromHexadecimalString() -> Data? {
        var data = Data(capacity: count / 2)
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, options: [], range: NSMakeRange(0, count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            let num = UInt8(byteString, radix: 16)
            data.append(num!)
        }
            return data
    }

}

extension Data {

    var bytes: Array<UInt8> {
        return Array(self)
    }

    func toHexString() -> String {
        return bytes.toHexString()
    }

}
