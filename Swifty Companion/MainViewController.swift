//
//  MainViewController.swift
//  Swifty Companion
//
//  Created by Felix Ntokozo THWALA on 2018/10/17.
//  Copyright © 2018 Felix Ntokozo THWALA. All rights reserved.
//

import UIKit
import JSONParserSwift

class MainViewController: UIViewController {
    
    var user: String?
    
    var deToken = ""
    var topicsBackup: [Dictionary<String,Any>]?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Requesting access token */
        let UID = "ce3639778c7e09492c14afd96f1351585b88a7b533776bf487f45483c789a9be"
        let SECRET = "baa1b092885602618b1ff23cfcb97344c3179c60973aad7a2af9a4f62f0bc9f4"
        let BEARER = ((UID + ":" + SECRET).data(using: String.Encoding.utf8, allowLossyConversion: true))!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        
        guard let url = URL(string: "https://api.intra.42.fr/oauth/token") else {return}
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let token = json["access_token"]
                    {
                        self.deToken = token as! String
                        _ = self.getTopic()
                    }
                } catch {
                    print(error)
                }
            }
        })
        
        task.resume()
    }
    
    /*  Getting the user info */
    func getTopic() {
        print("Started connection")
        let authEndPoint: String = "https://api.intra.42.fr/v2/users/\(user!)"
//        print(user!)
        let url = URL(string: authEndPoint)
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(self.deToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let requestGET = session.dataTask(with: request) { (data, response, error) in
            //print(data!)
            if let data = data {
                do {
                    print(data)
                    let dataAsString = String(data: data, encoding: .utf8)
                    let baseResponse: BaseResponse = try JSONParserSwift.parse(string: dataAsString!)
                    print(baseResponse)
                 
                } catch {
                    print(error)
                }
            }
            else {
                print("Data is null")
            }
        }
        requestGET.resume()
        print("End token")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
