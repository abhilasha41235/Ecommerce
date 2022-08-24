//
//  UserInteractor.swift
//  Assignment
//
//  Created by Thapliyal, Abhilasha on 27/05/22.
//

import Foundation

private var session: URLSession?

protocol UserInteractorLogic: AnyObject {
     func getUserDetails(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ userData: UserModel?, _ error: String?) -> Void)
}

class UserInteractor: UserInteractorLogic {
    
    unowned var display: UserInteractorLogic?
    
    public func getUserDetails(baseUrl: String, endPoint: String, completionHandler: @escaping (_ success: Bool, _ userData: UserModel?, _ error: String?) -> Void) {
        GatewayService().apiGet(baseURL: baseUrl + endPoint) { (response: ServiceResponse<UserModel>) in
            completionHandler(true, response.data, nil)
        }
    }
}
