//
//  WebService.swift
//  Marvel
//
//  Created by Kadır  Yıldız on 1.09.2022.
//
import UIKit
import Foundation
import CryptoKit

class WebService {
    
    var publicKey = "c5af5628f90299271fa41225499e7d92"
    var privateKey = "c018a5ecd3b5062b20f66efe53bc73a27e40f3cf"
    
    func parse(comp: @escaping([Character]?) -> ()) {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        let api = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: api)!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(APIResult.self, from: data!)
                comp(result.data.results)
                print(result)
            }
            catch {
            }
        }.resume()
    }
    func MD5(data: String)-> String{
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
   
