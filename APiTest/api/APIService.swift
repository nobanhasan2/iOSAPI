//
//  APIService.swift
//  APiTest
//
//  Created by Noban on 15/6/1441 AH.
//  Copyright © 1441 Noban. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIService{
    class func getResponseStatus(isSuccess: Bool, responseCode : Int, msg: String)-> ResponseStatus {
        return ResponseStatus(isSuccess: isSuccess, resCode : responseCode, msg: msg)
    }
    
    class func getPhotos(  completionHandler : @escaping(_ rpPhotos :RPPhotos?, _ status: ResponseStatus) -> ()){
           
          
           
           
           let url =    "https://reqres.in/api/users?page=1"
           print(url)
           var urlRequest = URLRequest(url: URL(string: url)!)
           urlRequest.httpMethod = HTTPMethod.get.rawValue
           //urlRequest.cachePolicy = .returnCacheDataElseLoad
           urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
           
           let request = Alamofire.request(urlRequest)
               .validate(statusCode: 200..<201)
               .validate(contentType: ["application/json"])
           
           request.responseObject{ (response: DataResponse<RPPhotos>) in
               switch response.result{
               case .success(let rpProductsByCategory):
                   //let json = Mapper().toJSON(rpProductsByCategory)
                   //print(json)
                   print("Response success Featured")
                   completionHandler(rpProductsByCategory,getResponseStatus(isSuccess: true, responseCode: 200, msg: ""))
                   break
                   
               case .failure(let error):
                   print(error)
                   if error._code == NSURLErrorTimedOut {
                       completionHandler(nil,getResponseStatus(isSuccess: true, responseCode: Constants.RESPONSE_CODE_NETWORK_TIMEOUT, msg: "Please check your internet Connection"))
                   }else{
                       if response.response == nil{
                           completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: 0, msg: "something went wrong"))
                       }else{
                           let responseCode : Int = (response.response?.statusCode)!
                           if responseCode == Constants.RESPONSE_CODE_NO_DATA_FOUND{
                               //print("API: \(responseCode)")
                               completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "No data Found"))
                           }else{
                               completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "Some thing went wrong"))
                           }
                       }
                   }
                   break
               }
           }
       }
    
}
