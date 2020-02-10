//
//  ResponseStatus.swift
//  APiTest
//
//  Created by Noban on 15/6/1441 AH.
//  Copyright © 1441 Noban. All rights reserved.
//


import Foundation
class ResponseStatus{
    var isSuccess : Bool = false
    var responnseCode : Int = 0
    var msg : String = ""
    
    
    init(isSuccess : Bool,resCode : Int,msg : String) {
        self.isSuccess = isSuccess
        self.msg = msg
        responnseCode = resCode
    }
}
