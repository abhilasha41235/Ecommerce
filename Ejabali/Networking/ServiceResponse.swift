//
//  ServiceResponse.swift
//  Assignment
//
//  Created by Thapliyal, Abhilasha on 28/05/22.
//

import Foundation
import UIKit

// Generic service response
public class ServiceResponse<T>: NSObject {

    public var data: T?

    init(data: T?) {
        self.data = data
    }

    convenience override init () {
        self.init(data: nil)
    }

}

struct GenericResponse: Codable {
    var response: String?

    init() {
        self.response = String()
    }

    init(response: String) {
        self.response = response
    }

    init?(json: [String: Any]) {
        guard let response = json["response"] as? String
            else {
                return nil
        }

        self.init(response: response)

    }
}
